dashboard "imdb_movie_detail" {

  title = "IMDb Movie Detail"

  input "movie_id" {
    title = "Select a Movie:"
    query = query.imdb_movie_input
    width = 4
  }

  container {

    card {
      query = query.imdb_movie_rating
      width = 3
      args  = [self.input.movie_id.value]
    }

    card {
      query = query.imdb_movie_earning_worldwide
      width = 3
      args  = [self.input.movie_id.value]
    }

    card {
      query = query.imdb_movie_earning_domestic
      width = 3
      args  = [self.input.movie_id.value]
    }

    card {
      query = query.imdb_movie_runtime
      width = 3
      args  = [self.input.movie_id.value]
    }

  }

  container {

    container {
      width = 12

      table {
        title = "Overview"
        type  = "line"
        width = 4
        query = query.imdb_movie_overview
        args  = [self.input.movie_id.value]
      }

      table {
        title = "Votes Summary"
        width = 8
        query = query.imdb_movie_votes_summary
        args  = [self.input.movie_id.value]
      }

    }

  }

}

# Input queries

query "imdb_movie_input" {
  sql = <<-EOQ
    select
      title as label,
      movie_id as value
    from
      imdb
    order by
      title;
  EOQ
}

# Card queries

query "imdb_movie_rating" {
  sql = <<-EOQ
    select
      'Rating' as label,
      rating as value
    from
      imdb
    where
      movie_id = $1;
  EOQ
}

query "imdb_movie_earning_worldwide" {
  sql = <<-EOQ
    select
      'Earning (Worldwide)' as label,
      worldwide as value
    from
      earning
    where
      movie_id = $1;
  EOQ
}

query "imdb_movie_earning_domestic" {
  sql = <<-EOQ
    select
      'Earning (Domestic)' as label,
      domestic as value
    from
      earning
    where
      movie_id = $1;
  EOQ
}

query "imdb_movie_genre" {
  sql = <<-EOQ
    select
      'Genres' as label,
      string_agg(genre, ', ') as value
    from
      genre
    where
      movie_id = $1;
  EOQ
}

query "imdb_movie_runtime" {
  sql = <<-EOQ
    select
      'Runtime' as label,
      runtime as value
    from
      imdb
    where
      movie_id = $1;
  EOQ
}

# Other detail page queries
query "imdb_movie_overview" {
  sql = <<-EOQ
    select
      i.title as "Title",
      i.rating as "Rating",
      i.totalvotes as "Total Votes",
      string_agg(g.genre, ', ') as "Genre",
      i.budget as "Budget",
      i.runtime as "Runtime",
      i.metaCritic as "Meta Critic"
    from
      imdb as i
      join genre as g on i.movie_id = g.movie_id
    where
      i.movie_id = $1
    group by
      i.title, i.rating, i.totalvotes, i.budget, i.runtime, i.metaCritic;
  EOQ
}


query "imdb_movie_votes_summary" {
  sql = <<-EOQ
    select
      CVotesMale as "Votes Male",
      CVotesFemale as "Votes Female",
      CVotesU18 as "Votes Under 18",
      CVotes1829 as "Votes 18-29",
      CVotes3044 as "Votes 30-44",
      CVotes45A as "Votes 45+"
    from
      imdb
    where
      movie_id = $1;
  EOQ
}

