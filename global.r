library(timevis)
library(gt)
library(googlesheets)
library(dplyr)

prepData <- function(session, inputdata, timevisDataGroups, g_table) {
  progress <- Progress$new(session)
  ## hand built timevis -----------
  progress$set(value = 0, message = 'Loading timevis datapoints')
  inputdata <<- tibble(
    content = factor(),
    start = factor(),
    end = factor(),
    group = factor(),
    type = factor()
    ) %>%
    ### Day 1 ------------------------

    add_row(
      content = "Registration",
      start = "2019-08-21 08:00:00",
      end = "2019-08-21 10:00:00",
      group = "concourse",
      type = "range"
    ) %>%

    add_row(
      content = "Shiny Reproducibility",
      start = "2019-08-21 08:00:00",
      end = "2019-08-21 10:00:00",
      group = "rm1",
      type = "range"
    ) %>%
    add_row(
      content = "R Validation Hub",
      start = "2019-08-21 08:00:00",
      end = "2019-08-21 10:00:00",
      group = "rm2",
      type = "range"
    ) %>%
    add_row(
      content = "Artificial neural networks",
      start = "2019-08-21 08:00:00",
      end = "2019-08-21 10:00:00",
      group = "rm3",
      type = "range"
    ) %>%

    add_row(
      content = "Break",
      start = "2019-08-21 10:00:00",
      end = "2019-08-21 10:15:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Shiny Reproducibility",
      start = "2019-08-21 10:20:00",
      end = "2019-08-21 12:00:00",
      group = "rm1",
      type = "range"
    ) %>%
    add_row(
      content = "R Validation Hub",
      start = "2019-08-21 10:20:00",
      end = "2019-08-21 12:00:00",
      group = "rm2",
      type = "range"
    ) %>%
    add_row(
      content = "Artificial neural networks",
      start = "2019-08-21 10:20:00",
      end = "2019-08-21 12:00:00",
      group = "rm3",
      type = "range"
    ) %>%

    add_row(
      content = "Lunch",
      start = "2019-08-21 12:00:00",
      end = "2019-08-21 12:55:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Machine Learning",
      start = "2019-08-21 13:00:00",
      end = "2019-08-21 15:00:00",
      group = "rm1",
      type = "range"
    ) %>%
    add_row(
      content = "Plotly",
      start = "2019-08-21 13:00:00",
      end = "2019-08-21 15:00:00",
      group = "rm2",
      type = "range"
    ) %>%
    add_row(
      content = "Pipeline toolkit",
      start = "2019-08-21 13:00:00",
      end = "2019-08-21 15:00:00",
      group = "rm3",
      type = "range"
    ) %>%

    add_row(
      content = "Break",
      start = "2019-08-21 15:00:00",
      end = "2019-08-21 15:15:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Machine Learning",
      start = "2019-08-21 15:20:00",
      end = "2019-08-21 17:00:00",
      group = "rm1",
      type = "range"
    ) %>%
    add_row(
      content = "Plotly",
      start = "2019-08-21 15:20:00",
      end = "2019-08-21 17:00:00",
      group = "rm2",
      type = "range"
    ) %>%
    add_row(
      content = "Pipeline toolkit",
      start = "2019-08-21 15:20:00",
      end = "2019-08-21 17:00:00",
      group = "rm3",
      type = "range"
    ) %>%

    add_row(
      content = "Speakers dinner",
      start = "2019-08-21 18:00:00",
      end = "2019-08-21 21:00:00",
      group = NA,
      type = "background"
    ) %>%

    ## Day 2 ---------------------
    add_row(
      content = "Registration",
      start = "2019-08-22 08:00:00",
      end = "2019-08-22 09:15:00",
      group = "concourse",
      type = "range"
    ) %>%

    add_row(
      content = "Breakout TBD",
      start = "2019-08-22 08:00:00",
      end = "2019-08-22 08:45:00",
      group = "rm1",
      type = "range"
    ) %>%
    add_row(
      content = "Breakout TBD",
      start = "2019-08-22 08:00:00",
      end = "2019-08-22 08:45:00",
      group = "rm2",
      type = "range"
    ) %>%
    add_row(
      content = "Breakout TBD",
      start = "2019-08-22 08:00:00",
      end = "2019-08-22 08:45:00",
      group = "rm3",
      type = "range"
    ) %>%

    add_row(
      content = "Talks",
      start = "2019-08-22 09:00:00",
      end = "2019-08-22 10:50:00",
      group = "rm1",
      type = "range"
    ) %>%

    add_row(
      content = "Break",
      start = "2019-08-22 10:50:00",
      end = "2019-08-22 11:10:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Talks",
      start = "2019-08-22 11:10:00",
      end = "2019-08-22 12:30:00",
      group = "rm1",
      type = "range"
    ) %>%

    add_row(
      content = "Lunch",
      start = "2019-08-22 12:30:00",
      end = "2019-08-22 13:30:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Talks",
      start = "2019-08-22 13:30:00",
      end = "2019-08-22 15:30:00",
      group = "rm1",
      type = "range"
    ) %>%

    add_row(
      content = "Break",
      start = "2019-08-22 15:30:00",
      end = "2019-08-22 15:50:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Talks",
      start = "2019-08-22 15:50:00",
      end = "2019-08-22 17:35:00",
      group = "rm1",
      type = "range"
    ) %>%

    add_row(
      content = "Reception",
      start = "2019-08-22 18:00:00",
      end = "2019-08-22 19:30:00",
      group = NA,
      type = "background"
    ) %>%

      ### Day 3 ------------------------
    add_row(
      content = "Registration",
      start = "2019-08-23 08:00:00",
      end = "2019-08-22 09:15:00",
      group = "concourse",
      type = "range"
    ) %>%

    add_row(
      content = "Breakout TBD",
      start = "2019-08-23 08:00:00",
      end = "2019-08-23 08:45:00",
      group = "rm1",
      type = "range"
    ) %>%
    add_row(
      content = "Breakout TBD",
      start = "2019-08-23 08:00:00",
      end = "2019-08-23 08:45:00",
      group = "rm2",
      type = "range"
    ) %>%
    add_row(
      content = "Breakout TBD",
      start = "2019-08-23 08:00:00",
      end = "2019-08-23 08:45:00",
      group = "rm3",
      type = "range"
    ) %>%

    add_row(
      content = "Talks",
      start = "2019-08-23 09:00:00",
      end = "2019-08-23 10:50:00",
      group = "rm1",
      type = "range"
    ) %>%

    add_row(
      content = "Break",
      start = "2019-08-23 10:50:00",
      end = "2019-08-23 11:10:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Talks",
      start = "2019-08-23 11:10:00",
      end = "2019-08-23 12:30:00",
      group = "rm1",
      type = "range"
    ) %>%

    add_row(
      content = "Lunch",
      start = "2019-08-23 12:30:00",
      end = "2019-08-23 13:30:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Talks",
      start = "2019-08-23 13:30:00",
      end = "2019-08-23 15:30:00",
      group = "rm1",
      type = "range"
    ) %>%

    add_row(
      content = "Break",
      start = "2019-08-23 15:30:00",
      end = "2019-08-23 15:50:00",
      group = NA,
      type = "background"
    ) %>%

    add_row(
      content = "Talks",
      start = "2019-08-23 15:50:00",
      end = "2019-08-23 17:25:00",
      group = "rm1",
      type = "range"
    ) %>%

    add_row(
      content = "Drinks offsite",
      start = "2019-08-23 17:45:00",
      end = "2019-08-23 20:00:00",
      group = NA,
      type = "background"
    )
  ## room mapping -----------
  progress$set(value = 0.4, message = 'Loading room mapping')
  timevisDataGroups <<- data.frame(
      id = c("concourse", "rm1", "rm2","rm3"),
      content = c("Concourse", "Room A", "Room B","Room C")
    )
  ## loading schedule -----------
  progress$set(value = 0.9, message = 'Pulling schedule from gsheet')
    #token <- gs_auth()
    # saveRDS(token, file = "googlesheets_token.rds")
    # to create .httr-oauth in rds format
    # token <- gs_auth()
    # saveRDS(token, file = "googlesheets_token.rds")
    suppressMessages(gs_auth(token = "googlesheets_token.rds", verbose = FALSE))
    extract_key_from_url(
      "https://docs.google.com/spreadsheets/d/1BVCW8XrR9DdGK_F0stTeWa7AFAlpXjims05VEmwgRjY/edit#gid=1383678347"
    )
    workbook_key <- "1BVCW8XrR9DdGK_F0stTeWa7AFAlpXjims05VEmwgRjY"
    workbook <- gs_key(workbook_key)


    schedule <- workbook %>%
      gs_read(
        ws = "2019_Schedule Revised",
        range = cell_rows(2:100))

    schedule_data <- schedule %>%
      mutate(
        date = as.Date(date)
      ) %>%
      # if date missing - delete
      filter(
        !is.na(date)
      )


    # Create a gt table based on a preprocessed `countrypops`
    g_table <- schedule_data %>%
      mutate(
        Date = paste(date,"-", weekdays(date)),
        Time = paste0(start_time," - ",end_time),
        Title = `talk/workshop_desc`,
        Speaker = speaker
      ) %>%
      dplyr::select(
        Date,
        Time,
        Title,
        Speaker
      ) %>%
      mutate(
        Speaker = case_when(
          is.na(Speaker) ~ "",
          TRUE ~ Speaker
        )
      ) %>%
      gt(
        rowname_col = "Time",
        groupname_col = "Date"
      ) %>%
      tab_header(title = "R/Pharma schedule")
  progress$close()
}

source("utils.R")