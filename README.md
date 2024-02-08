# IMDB Movie Data Analysis Dashboard

Analyze movie ratings, budgets, and box office performance data using SQLite and PowerPipe.

## Installation

Download and install Powerpipe (https://powerpipe.io/downloads). Or use Brew:

```sh
brew install powerpipe
```

## Get the Dataset

Download the Movie Data Analytics Dataset (https://www.kaggle.com/datasets/shahjhanalam/movie-data-analytics-dataset/data).

Unzip the file to current directory.

```sh
unzip archive.zip
```

## Clone the Mod Repository

```sh
git clone https://github.com/turbot/powerpipe-mod-imdb.git
cd powerpipe-mod-imdb
```

## Usage

Run the dashboard and specify the DB connection string:

```sh
powerpipe server --database sqlite:////your/path/to/the/directory/where/you/unzipped/the/dataset/movie.sqlite
```