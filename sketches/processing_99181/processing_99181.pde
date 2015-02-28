
float columnNumber;
 
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(10);
}
 
void draw()
{
  columnNumber = random(width);
 
  strokeWeight(300);
  stroke(random(255), random(255), random(255));
  line(0, 0, columnNumber, height/6);
  line(0, height, columnNumber, height/6);
}
