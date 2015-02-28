
Eddy[x_, y_, s_, n_, th_, R_] := 
Translate[
  {Thickness[th], Line[
    Table[
     If[R == 0,
       TransformationFunction[IdentityMatrix[3]], 
       ReflectionTransform[{0, 1}]]
      [{If[Or[Mod[i, 4] == 0, Mod[i, 4] == 1],
        Floor[(i + 1)/4], s - Floor[i/4]],
        If[Or[Mod[i, 4] == 0, Mod[i, 4] == 3],
        Floor[Abs[(i - 1)]/4], s - Floor[i/4]]}],
     {i, 0, n, 1}]]},
  {x, y}]

G[pr_, th_, o_, h_, s_, n_, X_, Y_, t_] :=
 Graphics[{
   Table[
    Eddy[1 + X*x, 1 + Y*y, s, n, th, Mod[x, 2]],
    {x, 0, 8, 1}, {y, 0, 8, 1}],
   Translate[
    Table[
     {Opacity[o], Thickness[th], 
      Line[
       Table[{{i - j*i, j*i}, {i - j*(i - h), h - j*h + j*i}},
       {i, -h, h, 1}]]},
     {j, 0, 1}],
    {-t, -t}]},
  PlotRange -> {{0, pr}, {0, 7/5 pr}}, ImageSize -> {500, 700}]

Manipulate[
 G[40, .011, 1, 60, 5.25, 11, 7.2, 7.2, t],
 {t, 1, 1/30, -1/30}]
