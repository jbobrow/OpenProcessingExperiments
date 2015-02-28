
// Lucky Wen, Repeating Shapes, CP1 mods 16-17


size(600, 150);

size(600, 175);
float white = 0;
int po = 0;
while (po < 600)
{
  stroke(white);
  line(po, 0, po, 300);
  white = white + 255.0/600.0;
  po = po + 1;
}


noFill();
int m = 10;
int offset = 0;
while(offset < 500)
{
  ellipse(300 - offset,75,10,m);
  ellipse(300 + offset,75,10,m);
  m = m + 3;
  offset = offset + 3;
}

noFill();
int m2 = 5;
int offset2 = 0;
while(offset2 < 500)
{
  ellipse(300,75 - offset2,m2,m2);
  ellipse(300,75 + offset2,m2,m2);
  m2 = m2 + 10;
  offset2 = offset2 + 10;
}

// 1st l line down
fill(112,251,100);
stroke(33,170,167);
strokeWeight(5);
int p = 25;
while (p < 120)
{
  ellipse(50, p, 25, 25);
  p = p +10;
}


// L right

int x = 50;
while (x < 110)
{
  ellipse(x, 115, 25, 25);
  x = x + 10;
}


// U line down 1st

int y = 25;
while (y < 120)
{
  ellipse(145, y, 25, 25);
  y = y +10;
}

// U line right

int i = 145;
while (i < 200)
{
  ellipse(i, 115, 25, 25);
  i = i +10;
}

// U second line down
int u = 25;
while (u < 120)
{
  ellipse(195, u, 25, 25);
  u = u +10;
}

// C Top right
int t = 250;
while (t < 320)
{
  ellipse(t, 25, 25, 25);
  t = t +10;
}

// C line down
int r = 25;
while (r < 120)
{
  ellipse(250, r, 25, 25);
  r = r +10;
}

// C line right 2nd
int e = 250;
while (e < 320)
{
  ellipse(e, 115, 25, 25);
  e = e +10;
}

// K line diag up
int q =350;
int a = 65;
while (q < 410)
{
  ellipse(q,a, 25, 25);
  q = q +10;
  a = a-10;
}

// K line diag down
int s =350;
int d = 65;
while (s < 410)
{
  ellipse(s,d, 25, 25);
  s = s +10;
  d = d+10;
}

// K Line down
int w = 25;
while (w < 120)
{
  ellipse(350, w, 25, 25);
  w = w +10;
}

// Y 1st stoke
int f =440;
int g = 25;
while (f < 500)
{
  ellipse(f,g, 25, 25);
  f = f +10;
  g = g+10;
}

// Y last stroke
int h =450;
int j = 115;
while (h < 550)
{
  ellipse(h,j, 25, 25);
  h = h +10;
  j = j-10;
}
