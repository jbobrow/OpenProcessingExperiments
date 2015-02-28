
float counter = 0;
void setup()
{
  size(500, 500);
  smooth();
  background(255);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
  noStroke();
ellipse(mouseX,mouseY,50,50);
   float h = map(sin(counter), -1, 1, 0, 360);
  fill(h, 100, 100);
  counter += 0.10;
  
}
