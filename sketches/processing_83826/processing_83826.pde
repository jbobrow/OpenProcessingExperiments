
void setup()
{
  size(400,600);
  background(0,0,0);
  smooth();
  frameRate(5);
}
void draw()
{
  fill(0,0,0,75);
  stroke(0,65,255);
  line(0,0,mouseX,mouseY);
  textSize(40);
  textAlign(CENTER);
  text("Merry Christmas",400,400);
}
