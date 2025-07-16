#' Get variable names, labels, and optional summary stats
#' Idea was that RSTudio unlike STATA has not a variable viewer which quickly
#' lets you see the variables with corresponding variable labels
#' This function returns a table of variable names and their variable labels,
#' with optional summary statistics like mean, range, and missing percentage.
#'
#' @param data A data frame
#' @param stats Logical, whether to include mean and range (for numeric vars)
#' @param missings Logical, whether to include missing value percentage
#'
#' @return A data frame with variable names, labels, and optional stats
#' @export
#'
#' @importFrom sjlabelled get_label
#' @importFrom dplyr rowwise mutate ungroup
pauli_table <- function(data, stats = FALSE, missings = FALSE) {

    labels <- sjlabelled::get_label(data, def.value = NA)

    label_df <- data.frame(
        variable = names(labels),
        label = unname(labels),
        stringsAsFactors = FALSE
    )

    if (stats || missings) {
        label_df <- label_df %>%
            dplyr::rowwise() %>%
            dplyr::mutate(
                mean = if (stats && is.numeric(data[[variable]])) {
                    format(round(mean(data[[variable]], na.rm = TRUE), 2), nsmall = 2, scientific = FALSE)
                } else {
                    NA_character_
                },
                range = if (stats && is.numeric(data[[variable]])) {
                    rng <- range(data[[variable]], na.rm = TRUE)
                    paste0("[", rng[1], ", ", rng[2], "]")
                } else {
                    NA_character_
                },
                missing_percent = if (missings) {
                    round(mean(is.na(data[[variable]])) * 100, 1)
                } else {
                    NA_real_
                }
            ) %>%
            dplyr::ungroup()
    }

    print(label_df)
    return(label_df)
}
