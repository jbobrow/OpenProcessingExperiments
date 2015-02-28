
import processing.opengl.*;

void setup()
{
 size(1000,750);
  smooth();
  noStroke();
  background(255,255,255);

}

void draw()
{
  float r = sin(frameCount*10)*50;
  if(mousePressed)
  {
    fill(random(255),240,0);
    ellipse(mouseX,mouseY,r,r);
    rect(mouseX,mouseY,r,r);


  }
}



