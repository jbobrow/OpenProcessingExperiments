
void setup()
{
  size(400, 600);
  background(random(255),random (255),random (255));
  smooth();
  frameRate(10);
  strokeWeight(1);
}
void draw()
{
  // fill(125, (75), (210));
 //line(width/2, height/2, mouseX, mouseY);
  //ellipse(mouseX, mouseY, 1, 5);
}
void mouseDragged()
{
  stroke(2, 2, 2);
  fill(random (255), random(255), random(255));
  line(width/2, height/2, mouseX, mouseY);
  triangle(random(20), random(150), random(220), random(50), random(320), random(150));
  triangle(random (150), random(320), random (50), random(220), random (150), random (20));
}
