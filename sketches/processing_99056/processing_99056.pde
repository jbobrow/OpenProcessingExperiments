
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  frameRate(50);
}
void draw()
{
  strokeWeight(2);
  quad ( mouseX, mouseY, pmouseX, pmouseY, width/175, height/50, 75, 150);
  fill(255, 0, random(255));
}
