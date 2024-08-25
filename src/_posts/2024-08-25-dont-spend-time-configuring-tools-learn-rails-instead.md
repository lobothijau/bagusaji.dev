---
title: Don't Spend Time Configuring Tools, Learn Rails Instead
date: 2024-08-25 08:00:00 +0700
description: |
  Test
category: Rails
published: true
---

A few days ago, I'm reconfiguring my rails setup (including Ruby) on my Macbook Pro M2. My go to guide for preparing Ruby on Rails development machine is [Go Rails Guide](https://gorails.com/setup/macos/14-sonoma). Usually it uses rbenv (which I already installed), but this time they go with asdf.

Asdf is a multiple runtime version manager. It's like rbenv but not only for Ruby, it's also for Node and others as well. As a beginner of Rails, of course I follow the guide exactly like it's written. Everything looks normal until I installed Rails gem.

![](/posts/GVmFneWXgAA-y7E.jpeg)

Further investigation shows that the issue is related to permission. It's weird considering that the main config directory was inside my own home directory. If it's located let say `/opt`, it understandable. But why permission issue on my own home directory? I couldn't get it. I tried to chaged the permission but other error show up.

![](/posts/GVmG1U0b0AA5CRT.jpeg)

Frustrated, I completely remove asdf and ready to reinstall rbenv. But, my heart said, "come on, don't give up buddy". So, I visit asdf official documentation and follow their instruction instead. This time I use homebrew (Go Rails use Github method). Everything seems normal until the gem installation step. It show the same error.

I think asdf documentation missed some step where it's required to setup the permission or maybe the path. I follow each step carefully, step by step, line by line. I spent about an hour battling asdf until I surrender.

## Use what works

I don't think I should spent that much time configuring tools and doesn't even work by default. It might be my knowledge limitation which caused the configuration not working like it should be. But, at my current level I shouldn't spend too much time on tools that doesn't really foundational in my Rails journey. If it doesn't work, then just use what's work before, rbenv.

Intalling and using rbenv was so smooth and easy, just follow the guide one by one, setup the path, install gems, create Rails project, and you got it. Rails project up and running in less than 10 minutes with rbenv.

![](/posts/Screenshot 2024-08-25 at 09.47.50.png)

I'm going to use rbenv for the rest of my life.
