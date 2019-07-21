function(input, output, session) {
  if(is.null(g_table)){
    prepData(session, inputdata, timevisDataGroups, g_table)
  }

  output$timelineGroups <- renderTimevis({
    timevis(
      data = inputdata,
      groups = timevisDataGroups,
      options = list(editable = FALSE))
  })

  output$full_schedule <- render_gt({
    g_table
  })

}
