mod "imdb" {
  title         = "IMDb"
  description   = "Visualize key metrics and trends in the movie industry, including financial performance, audience preferences, and critical acclaim, leveraging SQL queries to analyze IMDb data using Powerpipe."
  color         = "#F5C518"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/imdb-insights.svg"
  categories    = ["dashboard", "sqlite"]

  opengraph {
    title       = "Powerpipe Mod for IMDb"
    description = "Visualize key metrics and trends in the movie industry, including financial performance, audience preferences, and critical acclaim, leveraging SQL queries to analyze IMDb data using Powerpipe."
    image       = "/images/mods/turbot/imdb-insights-social-graphic.png"
  }
}
