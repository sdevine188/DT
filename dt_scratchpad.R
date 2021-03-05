library(tidyverse)
library(DT)

# https://rstudio.github.io/DT/
# https://rstudio.github.io/DT/010-style.html

# create datatable
starwars %>% select(name, homeworld, sex, height, mass, skin_color, eye_color, species) %>% 
        datatable(filter = "top", options = list(pageLength = 5, autoWidth = TRUE,
                                         columnDefs = list(list(targets = 8, visible = FALSE)))) %>%
        formatStyle(table = ., columns = 1:8, target = "row", lineHeight = "30%") %>%
        formatStyle(table = ., columns = 1, target = "cell", color = "", 
                    backgroundColor = "#00cc66", fontWeight = "bold", 
                    fontSize = "6px") %>%
        formatStyle(table = ., columns = c("homeworld", "mass"), target = "cell", color = "", 
                    backgroundColor = "#ff9900", fontWeight = "italic", 
                    fontSize = "15px") %>%
        formatStyle(table = ., columns = "sex", valueColumns = "species", target = "cell", 
                    backgroundColor = styleEqual(levels = c("Human", "Droid"), values = c("#00ccff", "#cccc00")))
