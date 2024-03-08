---
title: Lowering Ghost Memory Usage
date: 2023-09-21 21:13:00 +0700
description: |
  Laravel is winning over Rails for my 2023 and this article explain a bit more about why. 
category: Rails,Laravel
published: false
---

Recently, I installed a Ghost server for my new blog [belajardikelas.com](https://belajardikelas.com) and [hilanghealing.com](https://hilanghealing.com). I decided to migrate from WordPress and trying a new thing with different technology. 

Both blog has already been deployed with WordPress for quite some time. Unfortunately, there are problems with the hosting company, with the sitemap, with the SEO. I don't know what went wrong, but I felt lost and bored. So, I think to boost my writing productivity I need a new experience. 

This blog you are reading was built using Bridgetown, a Ruby static site generator. Since it's SSG, it does have limitation, especially on how to protect premium contents. Yes it's fast, and the hosting will be cheap, SEO will be great since it's so light (this blog has better seo than the other two). But, I need a way to protect premium content and with SSG it's cumbersome since I need to built the feature myself since the main sell point of SSG is static right? 

