grep("teal", rownames(installed.packages()), value = TRUE) |>
  append("\n\n # # # TEAL FAMILY # # # ", after = 0L) |>
  append("\n\n") |>
  cat(sep = "\n")
