---
title: Docusaurus Build Issue Related to Client Side Code
date: 2023-04-01 16:00:00 +0700
description: |
  One of my personal website built with Docusaurus having a build issue. The source of the problem is that I put client side code on a server rendered part.
permalink: /docusaurus-build-issue-related-to-client-side-code/
category: Docusaurus
---

Today I got an error build notification from Vercel for my Docusaurus site. 

<figure class=""><img src="/images/posts/docusaurus-error.png" alt="" class=""/><figcaption class="text-center">Failed docusaurus build</figcaption></figure>

The log said somehting about locale:

```sh
[ERROR] Unable to build website for locale id.
```

I think it was realted to Docusaurus config. But, strangely it already working for a few days for old builds, why is it failed now? 

```json
i18n: {
  defaultLocale: 'id',
  locales: ['id'],
},
```

So, Docusaurus can't detect my locale? Tried to rewrite it with the longer format `id-ID`, but it still failed. Then I said, perhaps using `en` locale wouldn't be a problem, let's work with locale `id` when it really needed. 

You know what, the build still failed on locale `en`. Whaaat's happened? Something is not right with the site. 

## HyvorTalk is The Culprit

After a day of debugging, I found out other error message above the code I pasted above. 

```sh
[ERROR] Docusaurus server-side rendering could not render static page with path /somepath/document-path
[INFO] It looks like you are using code that should run on the client-side only.
To get around it, try using `<BrowserOnly>` (https://docusaurus.io/docs/docusaurus-core/#browseronly) or `ExecutionEnvironment` (https://docusaurus.io/docs/docusaurus-core/#executionenvironment).
It might also require to wrap your client code in `useEffect` hook and/or import a third-party library dynamically (if any).
```

The message gives me some clues. Before the builds I added a commenting feature using HyvorTalk. To add the comment form to my Docusaurus site, I use the react plugin (since Docusaurus is based on React). I swizzled `DocItem/Paginator` to add HyvorTalk related components to every page. It seems that the `CommentCount` and `Embed` was supposed to run only in client side not on the server. 

```jsx
export default function PaginatorWrapper(props) {
  return (
    <>
      <Paginator {...props} />

      <CommentCount websiteId={8715} />
      <Embed
        websiteId={8715}
      />
    </>
  );
}
```

So, based on the error message, I wrapped HyvorTalk components inside `BrowserOnly`. 

```jsx
export default function PaginatorWrapper(props) {
  return (
    <>
      <Paginator {...props} />

      <BrowserOnly>
        <CommentCount websiteId={8715} />
        <Embed
          websiteId={8715}
        />
      </BrowserOnly>
    </>
  );
}
```

I commit, push and got a green checkmark. 

<figure class=""><img src="/images/posts/docusaurus-issue-fixed.png" alt="" class=""/><figcaption class="text-center">Docusaurus build issue fixed</figcaption></figure>

Issue fixed!

But actually not!

<figure class=""><img src="/images/posts/docusaurus-crashed.png" alt="" class=""/><figcaption class="text-center">Docusaurus crashed on production</figcaption></figure>

It's compiled but the app crashed. To fix this I need to wrap HyvorTalk components inside a function because `<BrowserOnly>` children must be written inside a render function. 

```jsx
<BrowserOnly>
  {() => <div>
    <CommentCount websiteId={8715} />
    <Embed
      websiteId={8715}
    />
  </div>}

</BrowserOnly>
```
