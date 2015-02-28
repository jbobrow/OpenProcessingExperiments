
//Lisa L, Loops, CP1 Mods 16/17

size(400,400);
smooth();
background(0);
stroke(46,185,191);

int w = 0;
int r = 200;
while(w < 400)
{
  line(0,0 + w,10 + w,400);
  line(400,0 + w,390 - w,400);
  line(400 - w,0,0,10 + w);
  line(0 + w,0,400,10 + w);
  w = w + 10;
}

noFill();
int x = 1;
float f = 255.0;
while(x < 300)
{
  stroke(12,225,175,f);
  ellipse(200,200,x,x);
  f = f - 255.0/300;
  x = x + 1;
}
