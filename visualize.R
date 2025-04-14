# visualize.R
# Analyse en Composantes Principales (PCA) sur le jeu de données iris

# Chargement des bibliothèques nécessaires
if (!require(ggplot2)) {
  install.packages("ggplot2", repos='http://cran.us.r-project.org')
  library(ggplot2)
}

# Chargement des données iris (intégré à R)
data(iris)

# Préparation des données numériques pour la PCA
iris_numeric <- iris[, 1:4]

# Calcul de la PCA
pca_result <- prcomp(iris_numeric, scale. = TRUE)

# Création d'un dataframe pour ggplot2
pca_df <- as.data.frame(pca_result$x)
pca_df$Species <- iris$Species

# Visualisation : projection sur les deux premières composantes principales
ggplot(pca_df, aes(x = PC1, y = PC2, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(
    title = "PCA sur les données iris",
    x = "Composante principale 1",
    y = "Composante principale 2"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# Enregistrement du graphique
ggsave("iris_pca_plot.png", width = 7, height = 5)

