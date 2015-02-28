
PImage a;
void setup() {
  size(500, 327);
  a = loadImage("a.jpg"); 
  
}

void draw()
{
  background(a);
  stroke (mouseY, 100, mouseX, 500);
  float maxStroke =5;
  strokeWeight (maxStroke);
  fill(mouseY, 25, mouseX, 30);
  
  //elipses
  ellipse(mouseX, mouseY, 40, 40);
  ellipse(mouseY, mouseX, 40, 40);
  ellipse(mouseX, mouseY, 80, 80);
  ellipse(mouseY, mouseX, 80, 80);
  
  //puntos
  point(pmouseX, pmouseY);
  point(pmouseY, pmouseX);
  point(10, pmouseY);
  point(pmouseY, 10);
  point(100, pmouseY);
  point(pmouseY, 100);
  point(90, pmouseX);
  point(pmouseX, 90);
  
  
  //lineas
  line (0, 10, mouseX, mouseY);
  line (0, 10, mouseY, mouseX);
  line (mouseX, mouseY, 1000, 0);
  line (mouseY, mouseX, 0, 1000);
 }



