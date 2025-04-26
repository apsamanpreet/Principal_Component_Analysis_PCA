library(factoextra)
library(FactoMineR)


pca_result <- PCA(data, scale.unit = TRUE, graph = FALSE)  # Scale the data

fviz_pca_biplot(pca_result, repel = TRUE,
                col.ind = "black", # Individuals color
                col.var = "blue", # Variables color
                title = "Biplot with 95% Confidence Ellipses") +
  stat_ellipse(color = "green",  # Correct way to set ellipse color
               level = 0.95, type = "t")
