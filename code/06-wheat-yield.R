# 小麦产量实验 Yields from a randomized complete block design
# 空间样本变差 page 276
library(nlme)
data(Wheat2) # Wheat Yield Trials
head(Wheat2)
str(Wheat2)

pdf(file = "Yields-Block.pdf", width = 10, height = 6)
plot(Wheat2)
dev.off()

m1 <- gls(yield ~ variety - 1, data = Wheat2) 

Variogram(m1, form = ~latitude + longitude)

pdf(file = "Yields-Variogram.pdf", width = 4*1.2, height = 3*1.2)
# plot(Variogram(m1,
#   form = ~latitude + longitude,
#   data = Wheat2, resType = "normalized"
# ), sigma = 1
# )

plot(Variogram(m1,
               form = ~latitude + longitude,
               maxDist = 32, resType = "normalized"
), xlim = c(0, 32), ylim = c(0.1,1.05),sigma = 1, grid = TRUE)
# abline(h=0.6,v=0)
dev.off()

# gls {nlme}  再考虑极大似然方法

# method: a character string. If "REML" the model is fit by maximizing the restricted log-likelihood. 
# If "ML" the log-likelihood is maximized. Defaults to "REML".
# 球形族
m2 <- update(m1,
  corr = corSpher(c(31, 0.2),
    form = ~latitude + longitude,
    nugget = TRUE
  )
)
m2
# 有理函数族
m3 <- update(m1,
  corr = corRatio(c(13, 0.2),
    form = ~latitude + longitude,
    nugget = TRUE
  )
)
m3
# 与 m2 不同的初值
m4 <- update(m1,
             corr = corSpher(c(28, 0.2),
                             form = ~latitude + longitude,
                             nugget = TRUE
             )
)
m4

plot(Variogram(m2, form = ~latitude + longitude, data = Wheat2),
  sigma = 1, grid = TRUE, scales = list(col = "black")
)
# 模型比较
anova( m2, m3, m4 )

bbmle::AICtab(m3, m4)

# So we are estimating 2 extra parameters as part of the spatial correlation structure, 
# but the AIC strongly supports adding this model complexity.

pdf(file = "heteroscedasticity.pdf", width = 6, height = 6)
# 检查异方差性
plot( m3, resid(., type = "n") ~ fitted(.),  abline = 0, grid = TRUE )
dev.off()

pdf(file = "normality.pdf", width = 6, height = 6)
# 正态性
qqnorm( m3, ~ resid(., type = "n") )
dev.off()


# 变差随距离的变化，可见空间成分提取的比较充分
pdf(file = "Yields-Variogram3.pdf", width = 8, height = 6)
plot(Variogram(m3, resType = "n"), ylim = c(0.1, .85))
dev.off()




Wheat2$res <- as.numeric(residuals(m2))
Wheat2$res <- as.numeric(residuals(m1))

library(ggplot2)
ggplot(Wheat2, aes(longitude, latitude, colour = res)) +
  geom_point(size = 5) + scale_color_gradient2()
