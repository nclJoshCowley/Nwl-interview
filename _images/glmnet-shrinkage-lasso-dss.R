# Requires `results`
# See
# * https://github.com/nclJoshCowley/LarynxCancerSurv (d29e30, v0.2)
# * L179 - L192 of "inst/reports/Radiomics/Radiomics-larynx-full.Rmd"

library(LarynxCancerSurv)

png("glmnet-shrinkage-lasso-dss.png", width = 960, height = 640)
par(cex = 2)

results$lasso |>
  (function(.x) .x["dss"])() |>
  purrr::iwalk(function(.cvglmnet, .nm) {
    plot(.cvglmnet$glmnet.fit, xvar = "lambda")
    abline(v = log(.cvglmnet$lambda.min), lty = "dashed")
    title(main = name_to_label(.nm, "lasso"), line = 3)
  })

dev.off()
