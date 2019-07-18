library(timevis)

source("ui-helpers.R")

fluidPage(
  title = "R/Pharma 2019 schedule",
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet"),

    # Favicon
    tags$link(rel = "shortcut icon", type="image/x-icon", href="http://daattali.com/shiny/img/favicon.ico"),

    # Facebook OpenGraph tags
    tags$meta(property = "og:title", content = share$title),
    tags$meta(property = "og:type", content = "website"),
    tags$meta(property = "og:url", content = share$url),
    tags$meta(property = "og:image", content = share$image),
    tags$meta(property = "og:description", content = share$description),

    # Twitter summary cards
    tags$meta(name = "twitter:card", content = "summary"),
    tags$meta(name = "twitter:site", content = paste0("@", share$twitter_user)),
    tags$meta(name = "twitter:creator", content = paste0("@", share$twitter_user)),
    tags$meta(name = "twitter:title", content = share$title),
    tags$meta(name = "twitter:description", content = share$description),
    tags$meta(name = "twitter:image", content = share$image)
  ),
  div(id = "header",
    div(id = "title",
      "R/Pharma 2019 schedule"
    ),
    div(id = "subtitle",
        "DRAFT - Subject to change"),
    div(id = "subsubtitle",
        "Code for this schedule forked from the timevis docs - a package by",
        tags$a(href = "http://deanattali.com/", "Dean Attali"),
        HTML("&bull;"),
        "Available",
        tags$a(href = "https://github.com/daattali/timevis", "on GitHub"),
        HTML("&bull;")
    )
  ),
  tabsetPanel(
    id = "mainnav",
    tabPanel(
      div(icon("users"), "Groups"),
      timevisOutput("timelineGroups")
    ),
    tabPanel(
      div(icon("question"), "Usage"),
      div(id = "usage-tab", includeMarkdown("www/help.md"))
    )
  ),
  div(class = "sourcecode",
      "The exact code for all the timelines in this app is",
      tags$a(href = "https://github.com/daattali/timevis/tree/master/inst/example",
             "on GitHub")
  )
)
