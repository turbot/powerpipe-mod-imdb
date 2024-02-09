dashboard "imdb_movie_data_analysis_dashboard" {

  title = "IMDB Movie Data Analysis Dashboard"

  container {
    
    title = "Overview"
    
    card {
      query = query.total_movies
      width = 3
    }

    card {
      query = query.average_worldwide_earnings
      width = 3
    }

    card {
      query = query.average_domestic_earnings
      width = 3
    }

    card {
      query = query.average_budget
      width = 3
    }
  }

  container {

    title = "Movie Ratings and Critical Acclaim"
    
    table {
      title = "Top Rated Movies"
      query = query.top_rated_movies
      type  = "bar"
      width = 4
    }

    chart {
      title = "Movies by Rating Range"
      query = query.movies_by_rating_range
      type  = "pie"
      width = 4
    }

    chart {
      title = "Distribution of Metacritic Scores"
      query = query.distribution_of_metacritic_scores
      type  = "donut"
      width = 4
    }

  }

  container {

    title = "Financial Performance Insights"

    chart {
      title = "Top Earning Movies Worldwide"
      query = query.top_earning_movies_worldwide
      type = "column"
      width = 4
      axes {
        x {
          title { 
            value = "Title" 
          }
        }
        y {
          title {
            value = "Worldwide Earnings"
          }
        }
      }
    }

    chart {
      title = "Domestic vs Worldwide Earnings Comparison"
      query = query.domestic_vs_worldwide_earnings_comparison
      type = "column"
      width = 4
      axes {
        x {
          title {
            value = "Title"
          }
        }
        y {
          title {
            value = "Earnings"
          }
        }
      }
    }

    chart {
      title = "Earnings by Movie Genre"
      query = query.earnings_by_movie_genre
      type = "column"
      width = 4
      axes {
        x {
          title {
            value = "Genre"
          }
        }
        y {
          title {
            value = "Total Earnings"
            }
        }
      }
    }
  }

  container {

    title = "Audience Preferences and Geographic Insights"

    chart {
      title = "International vs US Votes Comparison"
      query = query.international_vs_us_votes_comparison
      type  = "bar"
      width = 6
      axes {
        x {
          title {
            value = "Title"
          }
        }
        y {
          title {
            value = "Votes"
          }
        }
      }
    }

    chart {
      title = "Genre Popularity by Age Group"
      query = query.genre_popularity_by_age_group
      type = "column"
      width = 6
      axes {
        x {
          title {
            value = "Genre"
          }
        }
        y {
          title {
            value = "Votes"
          }
        }
      }
    }

  }
}

# Card Queries

query "total_movies" {
  sql = <<-EOQ
    select count(*) as "Total Movies" from IMDB;
  EOQ
}

query "average_worldwide_earnings" {
  sql = <<-EOQ
    select avg(Worldwide) as "Average Worldwide Earnings" from earning;
  EOQ
}

query "average_domestic_earnings" {
  sql = <<-EOQ
    select avg(Domestic) as "Average Domestic Earnings" from earning;
  EOQ
}

query "average_budget" {
  sql = <<-EOQ
    select avg(Budget) as "Average Budget" from IMDB;
  EOQ
}

# Chart Queries

query "top_rated_movies" {
  sql = <<-EOQ
    select Title, Rating from IMDB order by Rating desc limit 5;
  EOQ
}

query "movies_by_rating_range" {
  sql = <<-EOQ
    select 
      case 
        when Rating >= 9 then '9+'
        when Rating >= 8 then '8-8.9'
        when Rating >= 7 then '7-7.9'
        when Rating >= 6 then '6-6.9'
        else 'Below 6'
      end as "Rating Range",
        count(*) as "Number of Movies"
    from IMDB
    group by "Rating Range";
  EOQ
}

query "distribution_of_metacritic_scores" {
  sql = <<-EOQ
    select 
      case 
        when Metacritic >= 90 then '90+'
        when Metacritic >= 80 then '80-89'
        when Metacritic >= 70 then '70-79'
        when Metacritic >= 60 then '60-69'
        else 'Below 60'
        end as "Metacritic Range",
        count(*) as "Number of Movies"
    from 
      IMDB
    group by 
      "Metacritic Range";
  EOQ
}

query "top_earning_movies_worldwide" {
  sql = <<-EOQ
    select 
      i.title,
      e.worldwide
    from 
      earning e
      join imdb i on e.movie_id = i.movie_id
    order by 
      e.worldwide desc
    limit 5;
  EOQ
}

query "domestic_vs_worldwide_earnings_comparison" {
  sql = <<-EOQ
    select 
      i.title,
      e.domestic,
      e.worldwide
    from 
      earning e
      join imdb i on e.movie_id = i.movie_id
      order by e.worldwide desc
    limit 5;
  EOQ
}
query "earnings_by_movie_genre" {
  sql = <<-EOQ
    select 
      g.genre,
      sum(e.Worldwide) as "Total Earnings"
    from 
      genre g
      join earning e on g.Movie_id = e.Movie_id
    group by 
      g.genre
    order by
      "Total Earnings" desc;
  EOQ
}

query "international_vs_us_votes_comparison" {
  sql = <<-EOQ
    select Title, CVotesUS as "US Votes", CVotesnUS as "International Votes" from IMDB order by "US Votes" desc limit 5;
  EOQ
}

query "genre_popularity_by_age_group" {
  sql = <<-EOQ
    select
      g.genre,
      sum(cast(i.cvotesu18 as integer)) as "under_18",
      sum(cast(i.cvotes1829 as integer)) as "18_29",
      sum(cast(i.cvotes3044 as integer)) as "30_44",
      sum(cast(i.cvotes45a as integer)) as "45_plus"
    from 
      imdb i
      join genre g on i.movie_id = g.movie_id
    group by 
      g.genre;
  EOQ
}
