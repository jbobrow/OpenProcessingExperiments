
//Kevin T. Computer Programming 1, 16-17
size(600,600);
background(0);
noFill();
stroke(255,0,0,60);
int w = 0;
while (w < 500)
{
  ellipse(300,300,w,150);
  w = w+10;
}
int l = 0;
while (l < 500)
{
  ellipse(300,300,150,l);
  l = l+10;
}
translate(300,300);
rotate(PI/4);
int x = 0;
while(x<500)
{
  ellipse(0,0,x,150);
  x=x+10;
}
int y=0;
while(y<500)
{
  ellipse(0,0,150,y);
  y=y+10;
}
rotate(-PI/4);
translate(-300,-300);
stroke(0,0,255,40);
int a = 10;
while (a<500)
{
  int b = 10;
  while (b<500)
  {
    ellipse(300,300,a,b);
    b=b+20;
  }
  a=a+20;
}
stroke(255,255,255,30);
int q = 0;
while(q<600)
{
  ellipse(300,300,q,100);
  q=q+10;
}
int e = 0;
while (e<600)
{
  ellipse(300,300,100,e);
  e=e+10;
}
translate(300,300);
rotate(PI/4);
int o=0;
while(o<600)
{
  ellipse(0,0,o,100);
  o=o+10;
}
int p=0;
while(p<600)
{
  ellipse(0,0,100,p);
  p=p+10;
}
rotate(-PI/4);
translate(-300,-300);
stroke(255,57,246,25);
int g = 0;
while(g<600)
{
  int h =0;
  while(h<600)
  {
    line(g,h,300,300);
    h=h+30;
  }
  g=g+30;
}
