#genes are rows
#input is raw counts
glm_pois: R(Y <- cbind($(Y1), $(Y2));
            x <- rep(c(0, 1), c(ncol(Y1), ncol(Y2)));
            results <- apply(Y, 1, FUN=function(y){
              fit <- glm(y~x, family="poisson");
              res <- summary(fit)$coefficients[2,];
              return(res[c(1, 2, 4)])
            });
            results <- data.frame(t(results));
            est <- results$Estimate;
            se <- results$Std..Error;
            p <- results$Pr...z..)
  $log_fold_change_est: est
  $s_hat: se
  $p: p



glm_quasipois: R(Y <- cbind($(Y1), $(Y2));
              x <- rep(c(0, 1), c(ncol(Y1), ncol(Y2)));
              results <- apply(Y, 1, FUN=function(y){
                fit <- glm(y~x, quasipoisson);
                res <- summary(fit)$coefficients[2,];
                return(res[c(1, 2, 4)])
              });
              results <- data.frame(t(results));
              est <- results$Estimate;
              se <- results$Std..Error;
              p <- results$Pr...t..)
  $log_fold_change_est: est
  $s_hat: se
  $p: p
