# Managing Campaigns

This project uses Astro's content collections to manage campaign links. This makes it much easier to add, edit, or remove campaigns without touching the main HTML/Astro files.

## Adding a New Campaign

1. Create a new `.md` file in `src/content/campaigns/`
2. Use this template:

```markdown
---
title: "Campaign Name"
url: "https://example.com"
description: "Brief description of the campaign"
publishedAt: 2025-06-30
featured: true
---

Optional longer description of the campaign that can include markdown content.
```

## Editing Campaigns

Simply edit the relevant `.md` file in `src/content/campaigns/`. You can:

- Change the `title` (this appears on the website)
- Update the `url` (where the link goes)
- Modify the `description` 
- Adjust the `publishedAt` date (newer dates appear first - format: YYYY-MM-DD)
- Set `featured: false` to hide a campaign temporarily

## Current Campaigns

The campaigns are stored in these files:

- `ai-ceo-app.md` - AI CEO.app
- `oilwell.md` - Oilwell
- `visit-tottenham.md` - Visit Tottenham
- `asset-manager-quest.md` - Asset Manager Quest
- `ogilvyland.md` - Ogilvyland
- `carspreading.md` - Carspreading

## How It Works

The `CampaignList.astro` component automatically:

1. Reads all featured campaign files from the content collection
2. Sorts them by `publishedAt` date (newest first)
3. Renders them as links with the same styling as before
4. Adds the ➝ arrow automatically

## Ordering Campaigns

Campaigns are automatically ordered by their `publishedAt` date, with the most recent appearing first. To reorder:

- **Move a campaign to the top**: Give it a recent date (e.g., today's date or future)
- **Move a campaign down**: Give it an older date
- **No more manual numbering**: Just use natural dates when campaigns were launched

This means you never have to copy/paste anchor tags or manage tedious order numbers again!
