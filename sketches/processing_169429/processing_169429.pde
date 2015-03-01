
boolean boton=false;
int r=#FFFFFF;
int g=#14FC1D;
int b=#1458FC;
int u=#D32DC3;
int h=#1274DB;
void setup()
{
size(500,500);
background(#68F5AF);
}
void draw()
{
  if (boton==true)
  {
  fill(r);
  stroke(0);
  strokeWeight(2);
  r=r+g+b;
  frameRate(7);
 float w;
  w=random(1,height);
  float x;
  x=random(1,height);
  float y;
  y=random(1,70);
  float z;
  z=random(1,70);
  rect(w,x,y,z);
  }
  else
  {
  fill(u);
 u=u+h;
  float m;
  m=random(1,width);
  float n;
  n=random(1,height);
  float o;
  o=random(1,70);
  float p;
  p=random(1,70);
  ellipse(m,n,o,p);
  }
   fill(#FC1428);
  rect(400,400,100,100);
}
  void mousePressed()
 {
  if(mouseX > 400 && mouseX < 500 && mouseY > 400 && mouseY < 500)
{
  boton = !boton;
fill(#68F5AF);
rect(0,0,500,500);
}
}
