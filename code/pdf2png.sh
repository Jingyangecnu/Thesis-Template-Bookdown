# PDF 转 PNG 格式
convert -quality 100 -density 300x300 figures/matern-3d.pdf figures/matern-3d.png
convert -quality 100 -density 300x300 figures/map-loaloa.pdf figures/map-loaloa.png

convert -quality 100 -density 300x300 figures/bessel.pdf figures/bessel.png
convert -quality 100 -density 300x300 figures/Yields-Variogram.pdf figures/Yields-Variogram.png

# 优化 PNG 图片

optipng -o5 figures/*.png
convert -quality 100 -density 300x300 figures/one-dim-gp-exp.pdf figures/one-dim-gp-exp.png
convert -quality 100 -density 300x300 figures/one-dim-gp-exp-quad.pdf figures/one-dim-gp-exp-quad.png

convert -quality 100 -density 300x300 figures/profile-phitausq.pdf figures/profile-phitausq.png

convert -quality 100 -density 300x300 figures/binom-without-nugget-geoRglm.pdf figures/binom-without-nugget-geoRglm.png

