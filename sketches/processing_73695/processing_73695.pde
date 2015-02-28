
float a=0;
float b=0;
float changeb=3;
void setup()
{
  size(300,300,P3D);
  noCursor();
}
void draw()
{
  background(172);
  translate(mouseX,mouseY,-50);
  strokeWeight(2);
  //noStroke();
  rotateX(a);
  rotateY(a);
  rotateZ(a);
  a=a+.05;
  if(mousePressed == true)
  {
    fill(255,0,255,50);
    sphere(b);
    b=b+changeb;
    {
      if(b>width-150)
      {
        changeb=-3;
      }
      if(b<0)
      {
        changeb=3;
      }
    }
  }
  else
  {
    fill(255,255,255,50);
    sphere(100);
  }
}
