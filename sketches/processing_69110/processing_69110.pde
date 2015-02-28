
//Andy Li, CP1, Repeating Patterns, Mr. Simon

size(800,600);
background(0);
noFill();
smooth();
strokeWeight(3);

//orange layer
stroke(206,100,0);
int x = 10;
while(x < 251)
{
  ellipse(400-200,200-50,x,x);
  ellipse(400+200,200-50,x,x);
  x = x + 30;

}

//yellow layer
stroke(246,255,5);
int y = 13;
while(y < 251)
{
  ellipse(400-200,200-50,y,y);
  ellipse(400+200,200-50,y,y);
  y = y + 27;
}

//pupil
fill(0);
ellipse(400-200,200-50,70,70);
ellipse(400+200,200-50,70,70);

//mouth
fill(68);
ellipse(400,400,150,150);
noFill();

//hypno mouth
stroke(185);
int a = 400;
while(a < 801)
{
  ellipse(400,a,70,50);
  a = a + 30;
}

//hypno eye
stroke(0,30,147);
int w = 400-200;
int v = 200-180;
while(w < 801)
{
  ellipse(400-200,w,v,20);
  ellipse(400+200,w,v,20);
  w = w + 30;
  v = v + 10;
}
stroke(1,100,0);
int t = 403-200;
int u = 203-180;
while(t < 801)
{
  ellipse(403-200,t,u,20);
  ellipse(403+200,t,u,20);
  t = t + 30;
  u = u + 10;
}
