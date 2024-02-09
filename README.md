# IMDB Movie Data Analysis Dashboard

Analyze movie ratings, budgets, and box office performance data using SQLite and PowerPipe.

## Installation

Download and install Powerpipe (https://powerpipe.io/downloads). Or use Brew:

```sh
brew install turbot/tap/powerpipe
```

## Clone the Mod Repository

```sh
git clone https://github.com/turbot/powerpipe-mod-imdb.git
cd powerpipe-mod-imdb
```

## Get the Dataset

Download the [Movie Data Analytics Dataset](https://www.kaggle.com/datasets/shahjhanalam/movie-data-analytics-dataset/data).

Unzip the file to the cloned mod directory.

```sh
unzip /Users/root/Downloads/archive.zip
```

## Usage

Run the dashboard and specify the DB connection string:

```sh
powerpipe server --database sqlite:movie.sqlite
```

## Open Source & Contributing

This repository is published under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0). Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

[Powerpipe](https://powerpipe.io) is a product produced from this open source software, exclusively by [Turbot HQ, Inc](https://turbot.com). It is distributed under our commercial terms. Others are allowed to make their own distribution of the software, but cannot use any of the Turbot trademarks, cloud services, etc. You can learn more in our [Open Source FAQ](https://turbot.com/open-source).

## Get Involved

**[Join #powerpipe on Slack →](https://powerpipe.io/community/join)**

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Powerpipe](https://github.com/turbot/powerpipe/labels/help%20wanted)
- [IMDB Mod](https://github.com/turbot/powerpipe-mod-imdb/labels/help%20wanted)
