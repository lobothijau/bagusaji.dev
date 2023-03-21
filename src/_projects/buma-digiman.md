---
title: BUMA Digiman Development
date: 2023-03-21
description: |
  Bukit Makmur Mandiri Utama Digiman is an Android only apps built with Kotlin to digitalized mining-vehicle inspection workflow.
permalink: /buma-digiman/

template_engine: erb

---

# BUMA Digiman (Kotlin 2021-2022)

Bukit Makmur Mandiri Utama Digimal Maintenance or BUMA Digiman for short, is an Android only application developed to helps mining-vehicle maintenance workflow. The main feature of this app is an **offline-only** inspection mode. 

I build this application with the other 2 mobile team members of [Logique](http://logique.co.id/). 

## Background

BUMA is the second biggest coal mining contractor company in Indonesia. They owned more than 2500 highly advanced mining vehicles consisting of well known manufacturers such as Komatsu, Caterpillar, Hitachi, Volvo, Scania and Mercedes. 

In order to digitalized the workflow for maintaining those mining-vehicles, BUMA needs to develop a mobile apps for the inspectors, foreman, mechanics, and supervisors. The app is called BUMA Digiman. 

## Technologies

BUMA Digiman developed using native Android technologies using Kotlin as the main programming language. The local database is implemented using SQLite with Room. 

Authentication system for this app was integrated with Microsoft Authentication Library (MSAL) which connected to their Azure services. 