library(timevis)
library(gt)

source("ui-helpers.R")

fluidPage(
  title = "R/Pharma 2019 schedule",
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet"),
    # bigger loading box
    tags$style(
      HTML(".shiny-notification {
              height: 100px;
              width: 800px;
              position:fixed;
              top: calc(50% - 50px);;
              left: calc(50% - 400px);;
            }
           "
      )
    ),
    # Favicon
    tags$link(
      rel = "shortcut icon",
      type="image/x-icon",
      href="http://rinpharma.com/favicon-32x32.png"
      ),

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
        "Code for this schedule was forked from an app originally built by",
        tags$a(href = "http://deanattali.com/", "Dean Attali"),
        HTML("&bull;")
    )
  ),
  tabsetPanel(
    id = "mainnav",
    tabPanel(
      div(icon("calendar"), "Full schedule"),
      gt_output("full_schedule")
    ),
    tabPanel(
      div(icon("clock"), "Timeline"),
      timevisOutput("timelineGroups")
    ),
    tabPanel(
      div(icon("question"), "Notes"),
      div(id = "usage-tab", includeMarkdown("www/help.md"))
    )
  ),
  div(class = "sourcecode",
      "Return to the conference site via",
      tags$a(href = "http://rinpharma.com",
             "clicking here (it will go to rinpharma.com")
  )
)
