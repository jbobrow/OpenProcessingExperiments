
//import processing.opengl.*;

void setup()
{
  size(500,500/*OPENGL*/);
  background(255);
  smooth();
}

void draw()
{
  for(int i=0; i<8; i++)
  {
    for(int j=0; j<8; j++)
    {
      strokeWeight(1);
      noFill();
      stroke(mouseX,mouseY,50);
      ellipse(random(0,500),random(0,500),random(15,30),random(15,30));
    }
  }
}

void keyPressed(){
  save("w"+second() +".TIF");
}

