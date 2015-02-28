
//Di Tang, StarLoops, CP1 mods 14-15
size(300,300);
background(0);
noFill();
smooth();

translate(-100,-100);
noFill();
int m = 0;
while( m < 400)
{
  ellipse(250,250,m,m);
  stroke(50-m,255-m,230-m);
  m = m + 1;
}

stroke(0);
translate(250,250);
rotate(PI/2);
int x = 0;
while( x < 140)
{
  line(-50+x,-185,-50+x,185);
  x = x + 50;
}

rotate(-PI/2);
int y = 0;
while( y < 150)
{
  line(-50+y,-185,-50+y,185);
  y = y + 50;
}

rotate(PI/4);
int a = 0;
while( a < 150)
{
  line(-50+a,-185,-50+a,185);
  a = a + 50;
}

rotate(PI/2);
int b = 0;
while( b < 150)
{
  line(-50+b,-185,-50+b,185);
  b = b + 50;
}

rotate(PI/6);
int c = 0;
while( c < 150)
{
  line(-50+c,-185,-50+c,185);
  c = c + 50;
}

rotate(PI/4);
int d = 0;
while( d < 150)
{
  line(-50+d,-185,-50+d,185);
  d = d + 50;
}

rotate(PI/4);
int e = 0;
while( e < 150)
{
  line(-50+e,-185,-50+e,185);
  e = e + 50;
}

rotate(PI/4);
int f = 0;
while( f < 150)
{
  line(-50+f,-185,-50+f,185);
  f = f + 50;
}

rotate(PI/6);
int g = 0;
while( g < 150)
{
  line(-50+g,-185,-50+g,185);
  g = g + 50;
}

rotate(PI/4);
int h = 0;
while( h < 150)
{
  line(-50+h,-185,-50+h,185);
  h = h + 50;
}

rotate(PI/4);
int i = 0;
while( i < 150)
{
  line(-50+i,-185,-50+i,185);
  i = i + 50;
}

rotate(PI/4);
int j = 0;
while( j < 150)
{
  line(-50+j,-185,-50+j,185);
  j = j + 50;
}

int k = 1;
while (k < PI/32)
{
  line(130,-100,-130,100);
}
