---
title: Access Shopify Metafield from Theme's Liquid Code
date: 2023-04-01 16:37:00 +0700
description: |
  This week I'm tinkering with Shopify theme files to modify the item detail page. On the detail page, instead of showing images, I would like to show a 3D model. 
permalink: /access-shopify-metafield-from-theme-liquid-code/
categories: [Shopify, "3D Configurator"]
---

This week I'm tinkering with Shopify theme files to modify the item detail page. On the detail page, instead of showing images, I would like to show a 3D model. 

<figure class=""><img src="/images/posts/shopify-metafield.webp" alt="" class=""/><figcaption class="text-center">Setup metafields</figcaption></figure>

First and foremost, I will need to have the extra information, in this case a URL to a 3D scene hosted outside Shopify. In shopify world, the extra data for any kind of information is called `metafield`. 

My next task is to getting the URL from this metafield. How do I do that? 

So, every metafield are available by calling `something.metafields` where something is the object, in this case something is `product`. Searching through Stackoverflow, I got this code snippet:

```
{ { product.metafields.custom.3d_model_url.value } }
```

*I give spacing between `{` and `}` since the code is interpreted as valid erb code*

So, custom is the `namespace` and `3d_model_url` is the metafield name. But, I keep getting error message says:

```
Liquid syntax error (line 60): Expected id but found number
```

Since this is my first time tinkering with Shopify theme, I have no idea what this means. I forgot what gives me a clue that might be `custom` is not an object where `3d_model_url` is a property, what if `custom` is a map? Perhaps `3d_model_url` is a key not a property. This guess led me to succeed. The code below works and I can see the 3D scene loaded on product page.

```
{ { product.metafields.custom['3d_model_url'] } }
```

<figure class=""><img src="/images/posts/shopify-3d-scene.webp" alt="" class=""/><figcaption class="text-center">3D Scene Loaded on Shopify Product Page</figcaption></figure>
