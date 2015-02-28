
float x=0;
int a=0;
int b=0;
int c=0;
int d=0;
int v=5;
int e=5;
void setup()
{
  size(600,600,P3D);
}
void draw()
{
  background(0,0,0);
  translate(0,0,0);
  noStroke();
  fill(155,0,0);
  smooth();
  strokeWeight(10);
  camera(350+a,350+b,300,0,0,0,0,1,0);
  rotateX(.1+x);
  rotateY(.1+x);
  x=x+.01;
  lights();
  //pointLight(0,255,0,0,0,0);
  sphere(100);
  
  camera(c+600,d,100,0,0,0,0,1,0);
  rotateY(.1+x);
  translate(200,0,0);
  rotateX(.1+x);
  strokeWeight(5);
  stroke(0,255,0);
  fill(0,0,255);
  //pointLight(255,255,255,c,d,300);
  box(50);
  
  translate(100,0,0);
  noStroke();
  fill(155,155,155);
  //pointLight(255,0,255,100+v,100+v,100+v);
  if(v<400)
  {
    v=-5;
  }
  sphere(25);
}
void mouseDragged()
{
  if (mouseButton==LEFT)
  {
    a=mouseX;
    b=mouseY;
  }
  if (mouseButton==RIGHT)
  {
    c=mouseX;
    d=mouseY;
  }
}

