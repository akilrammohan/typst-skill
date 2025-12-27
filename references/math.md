# Typst Math Mode Reference

## Basics

### Inline vs Block
```typst
Inline: $x + y = z$

Block (with spaces inside $):
$ x + y = z $
```

### Subscripts and Superscripts
```typst
$x^2$           // x²
$x_n$           // xₙ
$x^2_n$         // both
$x_(n+1)$       // grouped subscript
$x^(a+b)$       // grouped superscript
$sum_(i=1)^n$   // limits on operator
```

## Fractions and Roots

```typst
$a/b$                    // auto fraction
$(a+b)/(c+d)$           // parentheses preserved if needed
$frac(a, b)$            // explicit fraction
$dfrac(a, b)$           // display-style fraction

$sqrt(x)$               // square root
$root(3, x)$            // cube root  
$root(n, x)$            // nth root
```

## Operators and Functions

### Built-in Operators
```typst
$sin x$, $cos x$, $tan x$
$log x$, $ln x$, $exp x$
$lim_(x -> oo) f(x)$
$max$, $min$, $sup$, $inf$
$det A$, $dim V$, $ker T$
$gcd(a,b)$, $lcm(a,b)$
$mod$, $arg$
```

### Custom Operators
```typst
$op("myop")_(x -> 0) f(x)$
$op("sgn", limits: #true)_x$
```

## Large Operators

```typst
$sum_(i=1)^n x_i$
$prod_(i=1)^n x_i$  
$integral_0^1 f(x) dif x$
$integral.double$, $integral.triple$
$integral.cont$           // contour integral
$union.big_(i=1)^n A_i$
$sect.big_(i=1)^n A_i$
```

## Matrices and Vectors

```typst
// Matrix (semicolon = new row)
$mat(
  1, 2, 3;
  4, 5, 6;
  7, 8, 9;
)$

// With delimiters
$mat(delim: "[",
  a, b;
  c, d;
)$

// Column vector
$vec(x, y, z)$
$vec(delim: "(", x, y, z)$

// Augmented matrix
$mat(augment: #2,
  1, 2, 3;
  4, 5, 6;
)$
```

## Brackets and Delimiters

```typst
$( )$   $(x)$           // auto-scale by default
$[ ]$   $[x]$
${ }$   ${x}$           // escape: $\{ \}$
$|x|$                    // absolute value
$||x||$                  // norm
$floor(x)$              // floor
$ceil(x)$               // ceiling
$lr(( x ))$             // explicit sizing
$lr(size: #2em, [ x ])$ // manual size
```

## Cases and Piecewise

```typst
$f(x) = cases(
  x^2 "if" x >= 0,
  -x^2 "if" x < 0,
)$

$abs(x) = cases(
  x &"if" x >= 0,
  -x &"if" x < 0,
)$
```

## Alignment in Equations

```typst
// Alignment with &
$ x &= a + b \
    &= c + d $

// Multiple alignment points
$ a &= b &= c \
  d &= e &= f $
```

## Accents and Decorations

```typst
$hat(x)$        // x̂
$tilde(x)$      // x̃
$macron(x)$     // x̄ (overline single)
$overline(x y)$ // overline span
$underline(x)$  
$dot(x)$        // ẋ
$dot.double(x)$ // ẍ
$arrow(v)$      // vector arrow
$cancel(x)$     // strikethrough
$overbrace(1 + 2 + 3)^"text"$
$underbrace(1 + 2 + 3)_"sum"$
```

## Greek Letters

```typst
// Lowercase
$alpha$ $beta$ $gamma$ $delta$ $epsilon$ $zeta$
$eta$ $theta$ $iota$ $kappa$ $lambda$ $mu$
$nu$ $xi$ $omicron$ $pi$ $rho$ $sigma$
$tau$ $upsilon$ $phi$ $chi$ $psi$ $omega$

// Uppercase  
$Alpha$ $Beta$ $Gamma$ $Delta$ ... $Omega$

// Variants
$phi.alt$       // φ vs ϕ
$epsilon.alt$   // ε vs ϵ
$theta.alt$     // θ vs ϑ
```

## Relations and Arrows

```typst
// Comparison
$<$ $>$ $<=$ $>=$ $eq$ $!=$ $approx$ $equiv$
$subset$ $supset$ $subseteq$ $supseteq$
$in$ $in.not$ $prec$ $succ$

// Arrows
$->$ $<-$ $<->$ $=>$ $<=>$
$arrow.r$ $arrow.l$ $arrow.r.long$
$arrow.r.double$ $arrow.r.squiggly$
$|->$ (maps to)
```

## Binary Operators

```typst
$+$ $-$ $times$ $div$ $dot$ $dot.c$ (centered dot)
$plus.minus$ $minus.plus$
$ast$ $star$ $circle.small$
$union$ $sect$ $without$
$and$ $or$ $xor$
$compose$
```

## Text in Math

```typst
$x "is positive"$         // roman text
$x thin "for all" thin x$ // with spacing
$f: RR -> RR$             // blackboard bold auto
$"let" x = 5$
```

## Spacing

```typst
$a b$        // default spacing (multiplication)
$a thin b$   // thin space
$a med b$    // medium space  
$a thick b$  // thick space
$a quad b$   // quad space
$a #h(1em) b$ // explicit
```

## Font Styles

```typst
$bold(x)$       // bold
$italic(x)$     // italic (default for single letters)
$upright(x)$    // upright/roman
$sans(x)$       // sans-serif
$frak(x)$       // fraktur
$mono(x)$       // monospace
$bb(R)$         // blackboard bold (ℝ)
$cal(L)$        // calligraphic
$scripts(x)$    // script size
```

## Special Constants and Sets

```typst
$NN$ $ZZ$ $QQ$ $RR$ $CC$  // number sets
$emptyset$                 // ∅
$infinity$ or $oo$         // ∞
$planck.reduce$            // ℏ
$diff$ or $dif$            // differential d
$partial$                  // ∂
$nabla$                    // ∇
$forall$ $exists$
```

## Equation Numbering

```typst
#set math.equation(numbering: "(1)")

$ E = m c^2 $ <einstein>

From @einstein we see...

// Number alignment
#set math.equation(number-align: bottom)
```

## Common Patterns

### Derivatives
```typst
$(dif f)/(dif x)$
$(partial f)/(partial x)$
$f'(x)$, $f''(x)$
$dot(x)$, $dot.double(x)$
```

### Integrals
```typst
$integral_a^b f(x) dif x$
$integral.double_D f dif A$  
$integral.cont_C bold(F) dot dif bold(r)$
```

### Sums and Products
```typst
$sum_(n=0)^oo a_n x^n$
$prod_(i=1)^n x_i$
$limits(sum)_(i=1)^n$  // force limits above/below
```

### Linear Algebra
```typst
$det(A) = |A|$
$A^(-1)$, $A^T$, $A^*$ (conjugate transpose)
$tr(A)$
$angle.l u, v angle.r$  // inner product
$||v||$                  // norm
```

### Probability/Statistics
```typst
$EE[X]$, $"E"[X]$       // expectation
$PP(A)$, $Pr(A)$        // probability  
$Var(X)$                 // variance
$X tilde "Normal"(mu, sigma^2)$
```
