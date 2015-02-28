
/*
Don't get dizzy!
**/
float r=0;
float g=110;
int r1=1;
float g1=145.000/255.000;
void setup() 
{ 
  size(400,400); 
  background(0);
}
void draw() 
{
}
void mouseDragged()
{
  noStroke();
  fill(0,0,0,4);
  rect(0,0,600,600);
  if (r<255)
  {
    stroke(r,g,255);
    strokeWeight(1);
    line(200,200,mouseX,mouseY);
    line(200,200,400-mouseX,400-mouseY);
  }
  r=r+r1;
  g=g+g1;
  if (r>254)
  {
    r1=-r1;
    g1=-g1;
  }
  if (r<1)
  {
    r1=-r1;
    g1=-g1;
  }
}
