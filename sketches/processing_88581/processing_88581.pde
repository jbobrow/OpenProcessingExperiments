
//Jenny H. CP1, mods 14-15, 3D Shapes
import processing.opengl;
float r = 255;
float b = 0;
int g = 1;
float y = 0;
float change = .25;

float xoff = 5.1;
float yoff = 0.1;
void setup ()
{
  size (500, 500, OPENGL);
  smooth();
  noStroke();
}
 
void draw ()
{
  background (random(0,22),random(0,2),random(0,22));
    xoff = xoff + 0.01;
  yoff = yoff + 0.01;
  float n = noise(xoff) * width;
    float m = noise(yoff) * height;
  translate (250, 250, 0);

pointLight (random(38,39),random(45,54),50, n-250, m-250,m+100);

  
  if (mousePressed == true) {
    
     pointLight (random(48,49),0,26, mouseX-250,mouseY-250,300);}
  
  rotateX (0);
  rotateY (y);
  y = y + 0.004;
  r = r + 1;
  g = g + 5;
  b = b + 20;
  
  sphere (100);


}



