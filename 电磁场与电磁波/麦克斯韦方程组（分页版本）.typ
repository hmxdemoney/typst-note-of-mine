#set document(title: "麦克斯韦方程组笔记")

#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 2.2cm),
  numbering: "1",
)

#set text(font: ("Libertinus Serif", "Songti SC", "PingFang SC"), size: 11pt, lang: "zh")
#set par(justify: true)
#set heading(numbering: "1.1")

// ---- 自定义样式：考研重点提示框 ----
#let keypoint(body) = block(
  width: 100%,
  fill: rgb("#FFF8E7"),
  stroke: (left: 3pt + rgb("#F0A500")),
  inset: (x: 10pt, y: 8pt),
  radius: 4pt,
  body,
)

// ---- 自定义样式：防跨页容器（保证一个知识点在一页内） ----
#let unbreak(body) = block(
  breakable: false,
  width: 100%,
  body
)

#align(center)[
  #text(size: 22pt, weight: "bold")[麦克斯韦方程组]
  #v(4pt)
]
#v(8pt)

#unbreak[
= 引言

方程组共四个方程，概括为"两散两旋"：

- 电场散度方程——高斯定律（电场的有源性）；
- 磁场散度方程——磁通连续性原理（磁场的无源性）；
- 电场旋度方程——法拉第电磁感应定律（磁生电）；
- 磁场旋度方程——安培–麦克斯韦定律（电生磁）。

每个方程都有*积分形式*和*微分形式*：

积分形式描述场在一个区域或回路上的整体性质,微分形式描述场在空间每一点的局域性质

两者通过高斯定理、斯托克斯定理互相转化。
]

#unbreak[
= 符号约定

#text(size: 10pt)[
#table(
  columns: (auto, 1.2fr, 2.2fr, 1.2fr),
  align: (center, left, left, center),
  inset: 5pt,
  table.header([符号], [名称], [含义], [单位]),
  [$arrow(E)$], [电场强度], [单位正电荷所受的力], [V/m],
  [$arrow(D)$], [电位移矢量（电通量密度）], [反映自由电荷对电场的贡献], [C/m²],
  [$arrow(B)$], [磁感应强度（磁通量密度）], [磁场对运动电荷的作用], [
    T \
    $"Wb"/"m"^2$ 、$"N"/("A" dot "m")$ 、$("V" dot "s")/"m"^2$
  ],
  [$arrow(H)$], [磁场强度], [反映传导电流对磁场的贡献], [A/m],
  [$rho$], [自由电荷体密度], [电场的源], [C/m³],
  [$arrow(J)$], [传导电流密度], [磁场的源之一], [A/m²],
  [$q$], [自由电荷量], [高斯定律的源量], [C],
  [$epsilon, mu, sigma$], [介电常数、磁导率、电导率], [描述介质的电磁性质], [F/m, H/m, S/m],
)]

补充约定：下标 $s$ 表示分界面上的面量——$rho_s$ 为自由面电荷密度（C/m²），$arrow(J_s)$ 为自由面电流密度（A/m）；$hat(n)$ 为分界面法向单位矢量（约定由介质 2 指向介质 1）。以上均采用国际单位制（SI）。
]

#v(1em)

#unbreak[
= 积分形式

**高斯定律（电场的有源性）。** 穿过任意闭合曲面的电位移通量等于该曲面所包围的自由电荷总量：

$ integral.cont_S arrow(D) dot dif arrow(S) = integral.triple_V rho dif V = Q $

物理意义：电场线起于正电荷、止于负电荷，自由电荷是电场的"源"。真空中为 $integral.cont_S arrow(E) dot dif arrow(S) = Q / epsilon_0$。

**磁通连续性原理（磁场的高斯定律）。** 穿过任意闭合曲面的磁通量恒为零：

$ integral.cont_S arrow(B) dot dif arrow(S) = 0 $

物理意义：磁力线是无头无尾的闭合曲线，磁场是"无源场"，自然界不存在磁单极子。

**法拉第电磁感应定律。** 穿过回路所围曲面的磁通量随时间变化时，回路中的感应电动势等于磁通量变化率的负值：

$ integral.cont_L arrow(E) dot dif arrow(l) = - frac(dif, dif t) integral.double_S arrow(B) dot dif arrow(S) = - integral.double_S frac(dif arrow(B), dif t) dot dif arrow(S) = - frac(dif Phi, dif t) $

物理意义：变化的磁场可以激发电场（感应电场为涡旋电场），负号反映楞次定律。

**安培–麦克斯韦定律（全电流定律）。** 磁场强度沿闭合回路的环量等于穿过该回路的全电流（传导电流 + 位移电流）：

$ integral.cont_L arrow(H) dot dif arrow(l) = integral.double_S arrow(J) dot dif arrow(S) + frac(dif, dif t) integral.double_S arrow(D) dot dif arrow(S) = I + frac(dif Phi_D, dif t) $

物理意义：磁场既可以由传导电流激发，也可以由变化的电场（位移电流）激发。麦克斯韦引入位移电流密度

$ arrow(J_d) = frac(partial arrow(D), partial t) $

补全了安培环路定律，是麦克斯韦方程组的核心假设之一。
]

#v(1em)

#unbreak[
= 微分形式

**从积分形式到微分形式的数学工具。** 高斯定理（散度定理）与斯托克斯定理：

$ integral.cont_S arrow(F) dot dif arrow(S) = integral.triple_V (nabla dot arrow(F)) dif V $

$ integral.cont_L arrow(F) dot dif arrow(l) = integral.double_S (nabla times arrow(F)) dot dif arrow(S) $

将积分形式的面积分、线积分分别化为体积分、面积分，即得微分形式：

$ nabla dot arrow(D) = rho $

$ nabla dot arrow(B) = 0 $

$ nabla times arrow(E) = - frac(partial arrow(B), partial t) $

$ nabla times arrow(H) = arrow(J) + frac(partial arrow(D), partial t) $

说明：

- 微分形式描述场在每一点的局域性质，适用于场光滑（可微）的区域；在两种介质的分界面处场不连续，微分形式失效，此时应使用积分形式，并由此导出边界条件（见第 6 节）。
- 时变场中，两个散度方程可由两个旋度方程结合电荷守恒定律自动导出（只要初始时刻满足散度方程即可），故旋度方程是更基本的。
- 微分形式 + 边界条件 + 初始条件可唯一确定电磁场（唯一性定理，见 7.7 节）。

#keypoint[
  *记忆口诀：* 电场散度等于电荷（有源），磁场散度恒等于零（无源）；磁变生电负号记，电变生磁加位移。
]
]

#v(1em)

#unbreak[
= 本构关系

麦克斯韦方程组共有 $arrow(E)$、$arrow(D)$、$arrow(B)$、$arrow(H)$ 四个矢量未知量（12 个标量分量），但四个矢量方程只给出 8 个独立标量方程，方程组不封闭。必须补充描述介质电磁性质的*本构关系*（电磁性能方程）：

- 线性、各向同性介质：$arrow(D) = epsilon arrow(E)$，$arrow(B) = mu arrow(H)$，$arrow(J) = sigma arrow(E)$（欧姆定律的微分形式）；
- 各向异性介质（如晶体）：$arrow(D) = epsilon dot arrow(E)$，此时 $epsilon$ 为介电常数张量；
- 运动电荷形成的电流密度：$arrow(J) = rho arrow(v)$。

真空中的参数：$epsilon_0 = 8.854 times 10^(-12) "F/m"$，$mu_0 = 4 pi times 10^(-7) "H/m"$。

相对参数：$epsilon = epsilon_r epsilon_0$，$mu = mu_r mu_0$；理想介质 $sigma = 0$（无损耗），理想导体 $sigma -> infinity$（内部场恒为零）。

引入本构关系后，未知量只剩 $arrow(E)$、$arrow(H)$ 两个矢量，方程组封闭；在真空中取 $rho = 0$、$arrow(J) = 0$ 即得自由空间的电磁场方程，可导出波动方程（见 7.4 节）。
]

#v(1em)

#unbreak[
= 边界条件

在两种介质分界面处，电磁场由积分形式取极限得到四个边界条件（$hat(n)$ 由介质 2 指向介质 1）：

$ hat(n) times (arrow(E_1) - arrow(E_2)) = 0 $

即电场强度切向分量连续。

$ hat(n) times (arrow(H_1) - arrow(H_2)) = arrow(J_s) $

即磁场强度切向分量跃变等于自由面电流密度（无面电流时切向连续）。

$ hat(n) dot (arrow(D_1) - arrow(D_2)) = rho_s $

即电位移矢量法向分量跃变等于自由面电荷密度（无面电荷时法向连续）。

$ hat(n) dot (arrow(B_1) - arrow(B_2)) = 0 $

即磁感应强度法向分量连续。

#keypoint[
  *记忆口诀：* E 切向、B 法向恒连续；H 切向看面电流，D 法向看面电荷。
]

**特例：理想导体表面。** 理想导体内部 $arrow(E) = 0$、$arrow(B) = 0$，时变场不能透入导体。取介质 2 为理想导体，则表面上 $hat(n) times arrow(E) = 0$，$hat(n) dot arrow(B) = 0$，$hat(n) times arrow(H) = arrow(J_s)$，$hat(n) dot arrow(D) = rho_s$。即理想导体表面只能存在面电流和面电荷（高频电磁波在导体表面反射即源于此）。
]

// 考研补充内容较多，强制从新一页开始排布，确保整齐
#pagebreak(weak: true)

= 考研补充

#unbreak[
== 静电场与恒定磁场的特例

- **静电场**（$partial / partial t = 0$，且无磁场）：由 $nabla times arrow(E) = 0$ 知电场为保守场，可引入标量电位 $phi$：

$ arrow(E) = - nabla phi $

代入 $nabla dot arrow(D) = rho$ 得泊松方程；无源区（$rho = 0$）为拉普拉斯方程：

$ nabla^2 phi = - rho / epsilon，nabla^2 phi = 0 $

- **恒定磁场**（$partial / partial t = 0$，恒定电流）：由 $nabla dot arrow(B) = 0$ 可引入矢量磁位 $arrow(A)$：

$ arrow(B) = nabla times arrow(A) $

在库仑规范 $nabla dot arrow(A) = 0$ 下满足 $nabla^2 arrow(A) = - mu arrow(J)$（矢量泊松方程）。

- **静态场能量密度**：$w_e = 1/2 epsilon E^2 = 1/2 arrow(E) dot arrow(D)$，$w_m = 1/2 mu H^2 = 1/2 arrow(B) dot arrow(H)$。
]

#v(1em)

#unbreak[
== 电流连续性方程与位移电流

对安培–麦克斯韦方程两边取散度，利用 $nabla dot (nabla times arrow(H)) = 0$：

$ nabla dot arrow(J) + frac(partial, partial t) (nabla dot arrow(D)) = 0 $

即得电流连续性方程（电荷守恒定律的微分形式）：

$ nabla dot arrow(J) = - frac(partial rho, partial t) $

若没有位移电流项，则 $nabla dot arrow(J) = 0$ 恒成立，与电荷守恒矛盾（例如电容器充电回路中，穿过极板间电位移通量的变化恰对应位移电流）。可见*位移电流的引入正是为了保证电流连续与电荷守恒*。

#keypoint[
  *考研常考：* 平行板电容器充电时，位移电流 $I_d = epsilon S frac(dif E, dif t) = C frac(dif U, dif t)$，数值上等于传导电流。
]
]

#v(1em)

#unbreak[
== 时谐电磁场的相量形式

时谐场即随时间按正弦（余弦）规律变化的场，可写成相量（复振幅）与 $e^(upright(j) omega t)$ 之积取实部：

$ arrow(E) = "Re" [ arrow(dot(E)) e^(upright(j) omega t) ] $

时域中的 $partial / partial t$ 对应相量域中的乘法 $upright(j) omega$。于是时谐场的麦克斯韦方程组（导电媒质、无外源）为：

$ nabla times arrow(dot(E)) = - upright(j) omega mu arrow(dot(H)) $

$ nabla times arrow(dot(H)) = (sigma + upright(j) omega epsilon) arrow(dot(E)) = upright(j) omega epsilon_c arrow(dot(E)) $

$ nabla dot arrow(dot(E)) = 0 $，$ nabla dot arrow(dot(H)) = 0 $

其中复介电常数

$ epsilon_c = epsilon - upright(j) sigma / omega $

实部反映介质的极化，虚部反映介质的导电损耗（$sigma != 0$ 时）。有损耗介质可全部用复介电常数等效处理。

无源、无耗介质中，由相量方程消去 $arrow(dot(H))$ 得亥姆霍兹方程：$nabla^2 arrow(dot(E)) + k^2 arrow(dot(E)) = 0$，其中波数 $k = omega sqrt(epsilon mu)$。
]

#v(1em)

#unbreak[
== 无源区：波动方程与均匀平面波

由微分形式的麦克斯韦方程组（$rho = 0$，$arrow(J) = 0$）消去 $arrow(H)$（对法拉第方程取旋度，利用矢量恒等式 $nabla times (nabla times arrow(E)) = nabla (nabla dot arrow(E)) - nabla^2 arrow(E)$），得波动方程：

$ nabla^2 arrow(E) - epsilon mu frac(partial^2 arrow(E), partial t^2) = 0 $

$arrow(H)$ 满足同样的方程。沿 $+z$ 方向传播的均匀平面波（相量形式）：$arrow(dot(E)) = arrow(E_0) e^(-upright(j) k z)$，$arrow(dot(H)) = arrow(H_0) e^(-upright(j) k z)$。

#keypoint[
  *均匀平面波的关键参数（必背）：*

  - 相位常数（波数）$k = omega sqrt(epsilon mu) = 2 pi / lambda$（rad/m）；
  - 相速 $v_p = omega / k = 1 / sqrt(epsilon mu)$，真空中 $v_p = c approx 3 times 10^8 "m/s"$；
  - 波长 $lambda = 2 pi / k = v_p / f$；
  - 波阻抗 $eta = E / H = sqrt(mu / epsilon)$，真空中 $eta_0 = 120 pi approx 377 Omega$。
]

均匀平面波的性质：

- $arrow(E)$、$arrow(H)$ 与传播方向互相垂直（横电磁波，TEM 波），且三者满足右手关系，能量沿 $arrow(E) times arrow(H)$ 方向传播；
- 无耗介质中 $arrow(E)$、$arrow(H)$ 同相位，振幅比恒为 $eta$；等相位面为平面且面上场强相等；
- 介质中相速小于真空光速：$v_p = c / sqrt(epsilon_r mu_r)$。

导电媒质中的平面波（了解）：传播常数为复数 $gamma = alpha + upright(j) beta$，场按 $e^(-gamma z)$ 随距离衰减；趋肤深度 $delta = 1 / alpha$，良导体中 $delta = sqrt(2 / (omega mu sigma))$。
]

#v(1em)

#unbreak[
== 电磁能量与坡印廷定理

电磁场能量密度（线性介质）：

$ w = 1/2 arrow(E) dot arrow(D) + 1/2 arrow(H) dot arrow(B) = 1/2 epsilon E^2 + 1/2 mu H^2 $

能流密度矢量（坡印廷矢量）：单位时间内穿过单位面积的能量，$arrow(S) = arrow(E) times arrow(H)$（W/m²）。

坡印廷定理（电磁能量守恒）的微分形式：

$ nabla dot (arrow(E) times arrow(H)) = - frac(partial, partial t) (1/2 arrow(E) dot arrow(D) + 1/2 arrow(H) dot arrow(B)) - arrow(E) dot arrow(J) $

积分形式：

$ integral.cont_S (arrow(E) times arrow(H)) dot dif arrow(S) = - frac(dif, dif t) integral.triple_V (1/2 arrow(E) dot arrow(D) + 1/2 arrow(H) dot arrow(B)) dif V - integral.triple_V arrow(E) dot arrow(J) dif V $

物理意义：流入闭合面的功率 = 体积内电磁场能量的增加率 + 焦耳热损耗功率（能量守恒）。

#keypoint[
  *时谐场的复坡印廷矢量：* $arrow(dot(S)) = 1/2 arrow(dot(E)) times arrow(dot(H))^*$，平均能流密度 $arrow(S_"avg") = 1/2 "Re" [ arrow(dot(E)) times arrow(dot(H))^* ]$。考研常要求用相量计算平均能流密度。
]
]

#v(1em)

#unbreak[
== 位函数与规范

由 $nabla dot arrow(B) = 0$ 可引入矢量磁位 $arrow(A)$：$arrow(B) = nabla times arrow(A)$；代入法拉第方程得 $nabla times (arrow(E) + partial arrow(A) / partial t) = 0$，可引入标量电位 $phi$：

$ arrow(E) = - nabla phi - frac(partial arrow(A), partial t) $

规范的选择：

- **洛伦兹规范**：

$ nabla dot arrow(A) + epsilon mu frac(partial phi, partial t) = 0 $

（时谐场中 $nabla dot arrow(dot(A)) = - upright(j) omega epsilon mu arrow(dot(phi))$）。在此规范下 $arrow(A)$、$phi$ 满足对称的达朗贝尔方程；

- **库仑规范**：$nabla dot arrow(A) = 0$，静态场常用。

达朗贝尔方程（有源区的波动方程）：

$ nabla^2 arrow(A) - epsilon mu frac(partial^2 arrow(A), partial t^2) = - mu arrow(J) $

$ nabla^2 phi - epsilon mu frac(partial^2 phi, partial t^2) = - rho / epsilon $
]

#v(1em)

#unbreak[
== 唯一性定理（了解）

在给定区域 $V$ 内，若已知：① 初始时刻的场分布；② 边界 $S$ 上的切向电场（或切向磁场），则区域内的电磁场唯一确定。此定理保证解的存在性与唯一性，是求解边值问题的理论依据。
]

#pagebreak(weak: true)

#unbreak[
= 总结一览表

#text(size: 10pt)[
#table(
  columns: (1.9fr, 2fr, 2.4fr),
  align: (left, center, center),
  inset: 5pt,
  table.header([方程], [微分形式], [积分形式（全形式见第 3 节）]),
  [高斯定律（电场有源）], [$nabla dot arrow(D) = rho$], [$integral.cont_S arrow(D) dot dif arrow(S) = Q$],
  [磁通连续性（磁场无源）], [$nabla dot arrow(B) = 0$], [$integral.cont_S arrow(B) dot dif arrow(S) = 0$],
  [法拉第电磁感应定律], [$nabla times arrow(E) = - partial arrow(B) / partial t$], [$integral.cont_L arrow(E) dot dif arrow(l) = - dif Phi / dif t$],
  [安培–麦克斯韦定律], [$nabla times arrow(H) = arrow(J) + partial arrow(D) / partial t$], [$integral.cont_L arrow(H) dot dif arrow(l) = I + dif Phi_D / dif t$],
)]

其中 $Phi$ 为磁通量，$Phi_D$ 为电位移通量。真空中 $epsilon = epsilon_0$、$mu = mu_0$，无源时 $rho = 0$、$arrow(J) = 0$。
]

#v(1em)

#unbreak[
= 常见考点提醒

- 能写出四个方程的微分形式与积分形式，并能说明各自的物理意义与"两散两旋"的对称性。
- 会用高斯定理、斯托克斯定理由积分形式推导微分形式，由积分形式取极限推导边界条件（常考推导题）。
- 边界条件：会判断切向/法向分量的连续性，掌握理想导体表面的特例。
- 位移电流：会写出 $arrow(J_d) = partial arrow(D) / partial t$，计算平行板电容器中的位移电流。
- 时谐场：会用相量形式列方程，会算复介电常数与平均坡印廷矢量。
- 均匀平面波：会计算 $k$、$lambda$、$v_p$、$eta$、$delta$ 等参数，判断传播方向。
- 会由麦克斯韦方程组推导波动方程（经典推导题）。
- 了解麦克斯韦方程组的历史意义：预言电磁波、统一光与电磁波、位移电流保证电荷守恒。
]