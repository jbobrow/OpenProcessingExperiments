
// Keana Moezzi, CP1, Rotating Cube

float a= 0;
float b= 0.5;
float c= random(0, 255);
float d= random(0, 255);
float e= random(0, 255);
void setup()
{
  size(500, 500, P3D);
}
void mousePressed()
{
  c= random(0, 255);
  d= random(0, 255);
  e= random(0, 255);
  
}
void draw()
{
  background(c, d, e);


  if (mousePressed==true)
 {
    pointLight(255, 52, 179, mouseX, mouseY, pmouseX);
    translate(mouseX, mouseY, 0);
    rotateX(a);
    rotateY(b);
    fill(255, 52, 179);
    box(150);
    a=a+.02;
    b=b+.05;
   
  }
}
