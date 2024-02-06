# IMDB Movie Data Analysis Dashboard

Analyze movie ratings, budgets, and box office performance data using SQLite and PowerPipe.

## Installation

Download and install Powerpipe (https://powerpipe.io/downloads) and SQLite(https://www.sqlite.org/download.html). Or use Brew:

```sh
brew install powerpipe
```

## Setup:

Download the Movie Data Analytics Dataset (https://www.kaggle.com/datasets/shahjhanalam/movie-data-analytics-dataset/data).

And unzip the file to a directory.

```sh
unzip archive.zip
```

## Clone:

```sh
git clone https://github.com/turbot/powerpipe-mod-movie-data-analytics.git
cd powerpipe-mod-movie-data-analytics
```

## Usage

Run the dashboard and specify the DB connection string:

```sh
powerpipe server --database sqlite:////your/path/to/the/directory/where/you/unzipped/the/dataset/movie.sqlite
```