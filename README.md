# IMDb Mod for Powerpipe

View dashboards to analyze [IMDb](https://imdb.com) movie ratings, budgets, box office performances, and more.

![image](https://raw.githubusercontent.com/turbot/powerpipe-mod-imdb/main/docs/imdb_dashboard_screenshot.png)

## Overview

Dashboards can help answer questions like:

- How many movies are present in the database?
- What is the average worldwide earnings from the movies?
- What is the average domestic earnings from the movies?
- What are the top rated movies by IMDb?

## Documentation

- **[Dashboards →](https://hub.powerpipe.io/mods/turbot/imdb/dashboards)**

## Getting Started

### Installation

Download and install Powerpipe (https://powerpipe.io/downloads). Or use Brew:

```sh
brew install turbot/tap/powerpipe
```

Install the mod:

```sh
mkdir dashboards
cd dashboards
powerpipe mod init
powerpipe mod install github.com/turbot/powerpipe-mod-imdb
```

Download the [IMDb Dataset Page](https://www.kaggle.com/datasets/shahjhanalam/movie-data-analytics-dataset/versions/1) (requires signup with [Kaggle](https://www.kaggle.com/))

Extract the downloaded file into the dashboards directory:

```sh
unzip ~/Downloads/archive.zip
```

### Browsing Dashboards

Start the dashboard server with the DB connection string:

```sh
powerpipe server --database sqlite:movie.sqlite
```

Browse and view your dashboards at **https://localhost:9033**.

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Powerpipe](https://powerpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://powerpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [IMDb Mod](https://github.com/turbot/powerpipe-mod-imdb/labels/help%20wanted)
