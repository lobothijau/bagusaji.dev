---
title: JBA Indonesia (2020-2023)
date: 2023-03-22
description: |
  JBA Indonesia is a Flutter built project for Android and iOS to enable online auction right from your phone from all over Indonesia.
---

PT JBA Indonesia is an automotive auction house that enabling online based auction right from the palm of your hands. The app was built with Flutter to be able to release the app for both Android and iOS to let customer bid in an online auction right from their phones from all over Indonesia.

<img src="/images/projects/jba-bidding.webp" class="h-96 w-full object-cover"/>

The app was built by the other mobile team member at [Logique](http://logique.co.id/) but I'm taking over the maintenance once it released. I've added tons of new feature even made some remake.

<img src="/images/projects/jba-homepage.webp" class="h-96 w-full object-cover"/>

## Technologies

The original app was a native Kotlin-based Android app. Since there's a need for iOS version, then it was redeveloped with Flutter. The company able to release the app for Android and iOS simultaneously, thanks to Flutter. Here's some key libraries that used by the app:

- Socket IO Client to perform real-time bidding. 
- GetX for favigation & state management. 
- Firebase Messaging to handle push notification.
- Firebase Dynamic Links.
- Release Flavoring (DEV, STAING, PRODUCTION) for development and QA.
