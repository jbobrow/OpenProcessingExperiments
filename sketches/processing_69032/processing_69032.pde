
//Sydney C, Loops: Repeating Shapes, CP1 mods: 4/5
size(500,300);
smooth();
fill(0);
rect(0,0,500,145);
int l = 0;
float grey = 0;
while(l<901)
{
  stroke(0+grey);
  grey = grey + (255.0/700.0);
  line(l,0,0,l);
  l=l+1;
}
noFill();
int x = 10;
int y = 5;
int c = 255;
int s = 0;
int st = 0;
while(x < 290)
{
  stroke (c);
  ellipse(250,x,140-y,5);
  x = x + 3;
  y = y + 3;
  c = c - 2;
  ellipse(100,195,s,s);
  rect(325,130,s,s);
  s = s + 1;
  stroke (st);
  ellipse(100,95,s,s);
  rect(375,80,s,s);
  st = st + 2;
}
