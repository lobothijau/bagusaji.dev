---
title: Deploy Bridgetown to Netlify using Github Action 
date: 2023-03-24
description: |
  Learn how to deploy Bridgetown SSG to netlify using Github Action easily.
categories: Bridgetown Netlify
---

This site you're reading now is developed with [Bridgetown](https://www.bridgetownrb.com/) (which I forked from [masilotti.com](https://masilotti.com)), a Static Site Generator built with Ruby. 

Bridgetown is something like Jekyll, I'm not sure how the internal works, but it helps you to create a static site. It means, any project created with Bridgetown or any other SSG needs to build or in other words exports the HTML, CSS, and JS files. It's different with something like WordPress where each request will call something on the server, read the database and returning a response. What we get from SSG is a static files, that's why they called Static Site Generator. 

The original developer using Github Action to host the static files on his ftp server somewhere. I don't want to rent an additional server just to host my website. So, I turn to Netlify service where they can host my static files freely. Here's the original `deploy.yml` that configured the workflow:

```yml
name: Build and deploy site

on:
  push:
    branches:
      - main
  schedule:
    # Redeploy site at 9:00 UTC every day.
    - cron: "0 9 * * *"

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup Ruby and install gems
        uses: ruby/setup-ruby@v1
        with:
          bundler-cache: true

      - name: Setup Node
        uses: actions/setup-node@v3
        with:
          node-version: "16"
          cache: "yarn"
      - run: yarn install

      - name: Build
        env:
          BRIDGETOWN_ENV: production
        run: bin/bridgetown deploy

      - name: Deploy site
        uses: burnett01/rsync-deployments@5.1
        with:
          switches: -rtzq --progress --del
          path: output/
          remote_host: ${{ secrets.REMOTE_HOST }}
          remote_key: ${{ secrets.REMOTE_KEY }}
          remote_key_pass: ${{ secrets.REMOTE_KEY_PASS }}
          remote_path: ${{ secrets.REMOTE_PATH }}
          remote_user: ${{ secrets.REMOTE_USER }}
```

As you can see on **Deploy site** step, it uses rsync to upload the generated static files. Here's I change the steps from using rsync to publicly available Netlify action `actions-netlify`.

```yml
- name: Deploy site
  uses: nwtgck/actions-netlify@v1.2
  with:
    publish-dir: output/
    production-branch: main
    github-token: ${{ secrets.GITHUB_TOKEN }}
    deploy-message: "Deploy from GitHub Actions"
    enable-pull-request-comment: false
    enable-commit-comment: true
    overwrites-pull-request-comment: true
  env:
    NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
    NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
  timeout-minutes: 1
```

Github Actions will have access to `secrets.GITHUB_TOKEN` automatically each time the action was triggered. What we need to do is providing netlify auth token and the site id. 

Since Netlify doesn't know how to handle Bridgetown, I can't choose **Import an existing project** or **Start from a template**. So, here I choose **Deploy manually**.

![](/images/posts/netlify-create.png)

I don't know how, but I can't create empty Netlify site. To provide what being asked, I create a new folder, touch an `index.html` file and upload it. That way I could get a new Netlify site running. Once it created, access the site and choose **Site settings** menu. 

![](/images/posts/netlify-site.png)

Here we can get the side id. 

![](/images/posts/netlify-site-id.png)

On Github repository page, open **Settings** tab and access **Actions** menu under **Secrets and Variables**. 

![](/images/posts/github-actions-secrets.png)

Click the green **New repository secre** and input the data. Just make sure the name are the same. 

To get Netlify personal access token, go to **User settings > Application** and click **New access token**. 

![](/images/posts/netlify-access-token.png)

Once you get the access token, add it to Github Secrets. 

![](/images/posts/netlify-access-token-github.png)

Now, every commit to main branch will trigger Github Action to run, build the static files and upload it to Netlify site. 