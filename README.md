# Daily Psalms Website

The official website for **Daily Psalms**, an Android Bible-reading app designed to help people build a consistent daily habit of reading the Psalms and Proverbs.

> **This repository contains the public website for Daily Psalms—not the Daily Psalms Android app itself.**

## Purpose

The website gives Daily Psalms a searchable home on the web. It is designed to help people discover the app through search engines, learn how the reading plan works, view screenshots, and find the Google Play listing.

The site exists alongside the Android application because a dedicated, indexable website makes it easier for search engines to understand and surface Daily Psalms when people search for Bible-reading plans, Psalms reading tools, and related topics.

## What the website showcases

- The Daily Psalms reading plan: five Psalms and one Proverb each day
- The app's focus on a simple, consistent reading habit
- Progress tracking and reading history
- Flexible reading paths
- Offline, ad-free reading
- Translation selection, footnotes, and word-study tools
- Screenshots and visual highlights from the Android app
- A direct link to download the app from Google Play
- Support and privacy-policy links

## Visit Daily Psalms

- **Website:** [dailypsalms.click](https://dailypsalms.click/)
- **Google Play:** [Download Daily Psalms](https://play.google.com/store/apps/details?id=com.peter.dailypsalms)

## Technology

This is a lightweight static website built with:

- HTML
- CSS embedded in the main page
- Shell tooling for project/deployment support
- Static image assets for branding, feature graphics, and app screenshots

There is no application backend in this repository. The website is intended to be fast, simple to host, and easy for search engines to crawl.

## Repository structure

```text
.
├── index.html             # Main landing page
├── privacy.html           # Privacy policy page
└── images/                # Logos, feature graphics, and app screenshots
```

## Local preview

Because the site is static, it can be previewed with any local web server. For example, with Python installed:

```bash
python3 -m http.server 8000
```

Then open [http://localhost:8000](http://localhost:8000) in a browser.

## SEO and discoverability

The landing page includes search and sharing metadata intended to help search engines and social platforms understand the site, including:

- A descriptive page title and meta description
- A canonical URL
- Open Graph metadata
- Structured data describing Daily Psalms as an Android mobile application
- Descriptive headings and image alt text
- A direct Google Play download link

## Related project

The Android app referenced by this website is **Daily Psalms**. This repository is the companion marketing and discovery website for that app; Android application source code is maintained separately.

## Support

For questions or support, email [p.hill.businesses@gmail.com](mailto:p.hill.businesses@gmail.com).
