
//Dominique A., User Input, CP1, Mod 16-17 
/**
 Click the left side of the mouse to "draw"
 Click the right side to finish drawing
*/ 

void setup()
{
  size(350,350);
}
void draw()
{
  strokeWeight(15);
  smooth();
  fill(0,0,0,10);
  rect(0,0,350,350);
  {
  }
   if(mouseButton == LEFT)
   {
    stroke(random(255),random(250),random(200),150);
    line(mouseX,mouseY,pmouseX,pmouseY);
    line(350-mouseX,350-mouseY,350-pmouseX,350-pmouseY);
    }
}
