
//Di T,14-15,CP1,StarLoopAnimation
int x = 0;
int y = 0;
int a = 0;
int b = 0;
int c = 0;
int d = 0;
int e = 0;
int f = 0;
int g = 0;
int h = 0;
int i = 0;
int j = 0;
int q = 0;

void setup()
{
size(300,300);
background(255);
noFill();
frameRate(60);
}

void draw()
{ 
  stroke(50-q,255-q,230-q);
  q = q + 1;
  
  translate(150,150);
  rotate(PI/2);
  if(x < 120)
  if(x > -30)
  line(-50,0+x,-50,0-x);

  if(x > -30)
  if(x < 120)
  line(50,0+x,50,0-x);
  x = x + 1;

  rotate(-PI/2);
  if(y < 120)
  if(y > -30)
  line(-50,0+y,-50,0-y);

  if(y > -30)
  if(y < 120)
  line(50,0+y,50,0-y);
  y = y + 1;
  
  rotate(PI/4);
  if(a < 120)
  if(a > -30)
  line(-50,0+a,-50,0-a);

  if(a > -30)
  if(a < 120)
  line(50,0+a,50,0-a);
  a = a + 1;
  
  rotate(PI/2);
  if(b < 120)
  if(b > -30)
  line(-50,0+b,-50,0-b);

  if(b > -30)
  if(b < 120)
  line(50,0+b,50,0-b);
  b = b + 1;
  
  rotate(PI/6);
  if(c < 120)
  if(c > -30)
  line(-50,0+c,-50,0-c);

  if(c > -30)
  if(c < 120)
  line(50,0+c,50,0-c);
  c = c + 1;
  
  rotate(PI/4);
  if(d < 120)
  if(d > -30)
  line(-50,0+d,-50,0-d);

  if(d > -30)
  if(d < 120)
  line(50,0+d,50,0-d);
  d = d + 1;
  
  rotate(PI/4);
  if(e < 120)
  if(e > -30)
  line(-50,0+e,-50,0-e);

  if(e > -30)
  if(e < 120)
  line(50,0+e,50,0-e);
  e = e + 1;
  
  rotate(PI/4);
  if(f < 120)
  if(f > -30)
  line(-50,0+f,-50,0-f);

  if(f > -30)
  if(f < 120)
  line(50,0+f,50,0-f);
  f = f + 1;
  
  rotate(PI/6);
  if(g < 120)
  if(g > -30)
  line(-50,0+g,-50,0-g);

  if(g > -30)
  if(g < 120)
  line(50,0+g,50,0-g);
  g = g + 1;
  
  rotate(PI/4);
  if(h < 120)
  if(h > -30)
  line(-50,0+h,-50,0-h);

  if(h > -30)
  if(h < 120)
  line(50,0+h,50,0-h);
  h = h + 1;
  
  rotate(PI/4);
  if(i < 120)
  if(i > -30)
  line(-50,0+f,-50,0-f);

  if(i > -30)
  if(i < 120)
  line(50,0+i,50,0-i);
  i = i + 1;
  
  rotate(PI/4);
  if(j < 120)
  if(j > -30)
  line(-50,0+j,-50,0-j);
  if(j < 120)
  if(j > -30)
  line(50,0+j,50,0-j);
  j = j + 1;
  
}
