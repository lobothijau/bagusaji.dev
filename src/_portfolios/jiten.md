---
title: Jiten (2019)
date: 2023-05-21
description: |
  Jiten is an Android-based Japanese-Indonesian dictionary to help user browse words using katakana, hiragana, and kanji.
---

<img src="/images/portfolios/jiten-1.jpg" class="h-96 w-full object-cover"/>


Engineered Jiten, a Japanese-Indonesian dictionary application built with Kotlin, leveraging SQLite's powerful full-text search capabilities through Room. Adapted from the open-source JMDict project, extending it with Indonesian translations.

Technical Implementation:
- Built efficient dictionary search system using:
  - SQLite FTS (Full-Text Search) for fast Japanese text queries
  - Room database for structured data access
  - Pre-compiled SQLite database integration
- Developed educational features including:
  - JLPT-level word groupings
  - Popular words collection
  - Word frequency indicators
- Implemented data structure handling:
  - Multiple language entries (Japanese, English, Indonesian)
  - Partial translation management (~10% Indonesian coverage)
  - Build-time database preparation

<img src="/images/portfolios/jiten-2.jpg" class="h-96 w-full object-cover"/>

Key Technical Features:
- Full-text search optimization
- Educational word groupings
- Multi-language entry management
- Efficient database integration
- Cross-language dictionary mapping

There's no "official translator" to help with the translation, hence it's progressing really slow. 

Download the app from the <a href="https://play.google.com/store/apps/details?id=id.droidindonesia.jiten" target="_blank">Play Store (FREE)</a>.
