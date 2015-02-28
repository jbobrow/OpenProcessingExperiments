
// Homework 8
// Hyunjook
// Hyunjoo 2012 Copyrights
// Press any key to change the color
// Press down with mouse to stop the loop
// Release the mouse to start the loop

color Col;

void setup(){
  size(500,500);
  smooth();
  Col = color(random(255), random(255), random(255));
}

void draw() {
  background(255);
  drawC();
}

void drawC()
{
  int x = 10; 
  noStroke();
  
  while (x < width)
  {
      fill (Col,20);
      ellipse(x,width/2,mouseX,mouseY);
      x = x+50;
    }
}
  
void keyPressed()
{
  Col = color(random(255), random(255), random(255));
}

void mousePressed() 
{
  noLoop();
}

void mouseReleased()
{
  loop();
}
  

