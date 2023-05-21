---
title: Buku Catur (2020)
date: 2023-05-21
description: |
  Buku Catur is an interactive chess book reader where user can use interactive board directly while reading the book. 
---

Buku Catur is an interactive chess book reader where user can use interactive board directly while reading the book. This app build using Kotlin for Android device and work offline.  

<img src="/images/portfolios/bukucatur-1.jpg" class="h-96 w-full object-cover"/>

I started working on this app on early pandemic days to fill boring days due to covid restriction. When my university chess club becoming online-only, I come to the idea of building interactive chess book app. 

Nothing special with the technologies used by the app, I just reuse the well known technique and libraries, just put it on together to integrate nicely. The app was written using markdown to render to content, I parsed the chess move with a pgn reader to generate chess position. The pgn also use to parsed next/previous move. 

<img src="/images/portfolios/bukucatur-2.jpg" class="h-96 w-full object-cover"/>

The chessboard was coming from an open source library. I imported the code directly since there's some additional changes needed to make it work with other part of the code. 

The server api coded using laravel which exposes the json data to be consumed by the app and copied into the local database (Room). After the data has been downloaded, user could use the app without using the internet. 

Download the app from the <a href="https://play.google.com/store/apps/details?id=id.ciptakreasilabs.bukucatur" target="_blank">Play Store (FREE)</a>.