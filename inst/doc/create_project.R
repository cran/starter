## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(dplyr)

## ----proj-setup, message=FALSE------------------------------------------------
# loading packages
library(starter)

# specifying project folder location (folder does not yet exist)
project_path <- fs::path(tempdir(), "My Project Folder")

## ----proj-create--------------------------------------------------------------
create_project(
  path = project_path,
  open = FALSE # don't open project in new RStudio session
)

## ----readme, comment = "", echo=FALSE-----------------------------------------
readr::read_file(fs::path(project_path, "README.md")) %>% cat()

## ----gitignore, comment = "", echo=FALSE--------------------------------------
readr::read_file(fs::path(project_path, ".gitignore")) %>% cat()

## ----comment = "", echo=FALSE-------------------------------------------------
readr::read_file(system.file("project_templates/default_readme.md", package = 'starter')) %>% cat()

## ----my_template--------------------------------------------------------------
my_template <-
  list(
    gitignore = list(),
    readme = list(),
    rproj = list()
  )

## ----lst-readme, eval=FALSE---------------------------------------------------
#  readme <-
#    list(
#      template_filename = system.file("project_templates/default_readme.md", package = "starter"),
#      filename = "README.md",
#      glue = TRUE
#    )

## ----rproj, eval=FALSE--------------------------------------------------------
#  rproj <-
#    rlang::expr(list(
#      template_filename = system.file("project_templates/default_rproj.Rproj", package = "starter"),
#      filename = glue::glue("{folder_name}.Rproj"),
#      glue = FALSE
#    ))

## ----full-template------------------------------------------------------------
my_template <- 
  list(
    readme = rlang::expr(list(
      template_filename = system.file("project_templates/default_readme.md", package = "starter"), 
      filename = "README.md",
      glue = TRUE
    )),
    rproj = rlang::expr(list(
      template_filename = system.file("project_templates/default_rproj.Rproj", package = "starter"), 
      filename = glue::glue("{folder_name}.Rproj"),
      glue = FALSE
    )),
    gitignore = rlang::expr(list(
      template_filename = system.file("project_templates/default_gitignore.txt", package = "starter"), 
      filename = ".gitignore", 
      glue = TRUE
    ))
  )

## ----analysis, eval = FALSE---------------------------------------------------
#  analysis <-
#    list(
#      template_filename = "C:/project_templates/template_analysis.Rmd",
#      filename = "scripts/analysis.Rmd",
#      glue = FALSE
#    )

## ----label--------------------------------------------------------------------
attr(my_template, "label") <- "My 1st Project Template"

## ----unlink, include=FALSE, echo=FALSE----------------------------------------
unlink(project_path, recursive = TRUE)

## ----create_project-----------------------------------------------------------
create_project(
  path = project_path,
  template = my_template # metadata list created above
)

