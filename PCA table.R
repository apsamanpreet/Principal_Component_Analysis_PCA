library(writexl)
library(stats)

pcdata <- data [,-1]

# Assuming your data is in a data frame called 'crop_data'
pca_result <- prcomp(scale(pcdata))

eigenvalues <- pca_result$sdev^2
variance_percent <- eigenvalues / sum(eigenvalues) * 100
cumulative_variance <- cumsum(variance_percent)
eigenvectors <- pca_result$rotation

# Create summary table
summary_table <- data.frame(
  PC = paste0("PC", 1:length(eigenvalues)),
  Eigenvalue = eigenvalues,
  Variance_Percent = variance_percent,
  Cumulative_Variance_Percent = cumulative_variance,
  eigenvector_values = eigenvectors
)

write_xlsx(summary_table, 'PCA.xlsx')
