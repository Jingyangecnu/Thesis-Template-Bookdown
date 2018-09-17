<!-- 2002 年 Venables, W. N. 和 Ripley, B. D. 实现惩罚拟似然估计
检验环境和基因效应在空间相关性中的存在性 [@spaMM2014]， 流行现象的时空分析[@surveillance2017]。  -->

以具体例子介绍统计概念

```{r spatial-point-patterns,fig.cap="空间点模式",fig.subcap=c("立体透视图","平面 image 图"),out.width="45%",echo=FALSE}
knitr::include_graphics(path = c(
  "figures/spatial-point-patterns-1.png",
  "figures/spatial-point-patterns-2.png"
))
```

另一种表示方式是平面的 image 图像


修正的第三类贝塞尔函数

```r
exp(0.5)*besselK(0.5,20)
besselK(0.5,20,expon.scaled = T)
```

参考文献引用样式 张浩等 右上角标号

-----

# 先验分布

- non-informative prior 无信息先验
- Jeffreys' prior
- vague/flat/diffuse priors 模糊/扁平

《SAS 手册》贝叶斯先验分布章节

stackexchange <https://stats.stackexchange.com/questions/7497/is-a-vague-prior-the-same-as-a-non-informative-prior>
维基百科 <https://en.wikipedia.org/wiki/Prior_probability>

《高等数理统计》 无信息先验分布 page 368--372


# Stan 平台

比较详细地介绍 微分几何 如何做 HMC 

MCSE 蒙特卡罗标准误差 有效样本 Rhat 等量

为什么用 分位点而不用 RMSE 均方误差  均方偏差 MS

Hoffman, M. D. and Gelman, A. (2014). The No-U-Turn Sampler: adaptively setting path lengths in Hamiltonian Monte Carlo. Journal of Machine Learning Research. 15:1593–1623.


## 拉普拉斯近似

https://stats.stackexchange.com/questions/353716
Constant of Laplace approximation

## 鞍点近似

saddlepoint approximation

https://stats.stackexchange.com/questions/191492

## INLA 

INLA software can handle thousands of Gaussian latent variables, but only up to 15 hyperparameters, because INLA software uses CCD for hyperparameters. If MCMC is used for hyperparameters, then it’s possible to handle more hyperparameters. For example, GPstuff allows use of MCMC instead of CCD for hyperparameters, and Daniel Simpson would like to get Laplace approximation to Stan so that he could handle thousands of hyperparameters.

INLA 软件能处理上千个高斯随机效应，但最多只能处理 15 个超参数，因为 INLA 使用 CCD 处理超参数，如果使用 MCMC 处理超参数，就有可能处理更多的超参数，如 GPstuff 使用 MCMC 而不是 CCD 处理超参数，Daniel Simpson 想把 Laplace approximation 带入 Stan，这样他就可以处理上千个超参数

# 文献综述

大大加长


# 数值模拟和数据分析

STAN

随机游走 MH 算法

Langevin-Hastings 算法

HMC 算法

STAN 理论

spBayes、geoCount

MCMC

PrevMap/MCML/Low-Rank


分层线性模型 (Hierarchical linear Model，简称 HLM，又称多层线性模型，Multilevel Linear Model)
模型名称多样性格式参照 线性混合效应模型

重新安排引用名称 chp:  sec:  小写字母 - 短横线连字符
处理一些引用缺失引起的警告

## 近似似然函数

近似方法 [@Pinheiro1995]


## 其它概率编程框架

什么是 probabilistic programming language

PyMC3

NIMBLE [@nimble2017]

## INLA 框架

集成嵌套拉普拉斯近似 (Integrated Nested Laplace Approximations，简称 INLA)

介绍模型

https://www.flutterbys.com.au/stats/tut/tut12.9.html


## 其它采样方法

M-H/Gibbs

<https://alexey.radul.name/ideas/2017/inference-by-quadrature/>

吉布斯采样器 [@Ritter1992] 基于采样的方法计算边际密度 [@Gelfand1990]

## 高斯马尔科夫随机场

高斯马尔科夫随机场 (Gaussian Markov Random Fields，简称 GMRF) 是一个随机向量服从多元正态分布，并且随机向量具有马尔科夫性，即 $x_i \perp x_j | \mathbf{x}_{-ij},i\neq j$，其中记号 $-ij$ 表示除了 $i$ 和 $j$ 以外的其它所有元素。

分析，模拟和预测空间过程 [@RandomFields2015]

Warning messages:
1: The label(s) related-algrithms not found
2: The label(s) tab:binomal-LRvsMCML, tab:binomal-MCMCvsSTAN not found
3: The label(s) fig:matern-3d not found
4: The label(s) related-algrithms not found
5: The label(s) eq:likelihood-approx not found
6: The label(s) eq:likelihood-approx not found
7: The label(s) eq:sim-sglmm, eq:sim-sglmm not found
8: The label(s) eq:sim-sglmm not found
9: The label(s) eq:exp-matern not found
10: The label(s) fig:reg-gp, fig:irreg-gp not found
11: The label(s) tab:binomal-LRvsMCML, tab:binomal-MCMCvsSTAN not found
12: The label(s) tab:loaloa-estimation1 not found


平面 r^2  

----

## 基于 Stan 的 R 包

- hBayesDM: hierarchical Bayesian modeling of Decision-Making tasks 任务决策的贝叶斯分层建模 <https://github.com/CCS-Lab/hBayesDM> <https://rpubs.com/CCSL/hBayesDM> 


```r
tools::dependsOnPkgs('rstan',installed = available.packages())
```
```
 [1] "adnuts"          "BANOVA"          "bayesLopod"      "beanz"          
 [5] "bmlm"            "BMSC"            "breathteststan"  "brms"           
 [9] "clinDR"          "CopulaDTA"       "ctsem"           "DeLorean"       
[13] "dfped"           "dfpk"            "dgo"             "DrBats"         
[17] "edstan"          "eggCounts"       "evidence"        "fergm"          
[21] "gastempt"        "ggfan"           "glmmfields"      "gppm"           
[25] "GPRMortality"    "hBayesDM"        "HCT"             "idealstan"      
[29] "idem"            "JMbayes"         "MADPop"          "MCMCvis"        
[33] "MIXFIM"          "projpred"        "prophet"         "RBesT"          
[37] "rstanarm"        "rstansim"        "shinystan"       "survHE"         
[41] "themetagenomics" "tmbstan"         "trialr"          "varian"         
[45] "walker"          "ESTER"           "pollimetry"      "psycho"         
[49] "tidyposterior"   "walkr"           "tidymodels"     
```