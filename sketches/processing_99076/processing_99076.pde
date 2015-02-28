
void setup()
{  size(400, 600);
  background(0, 0, 0);
  smooth();
  frameRate(60);
}
void draw()
{
  fill(0, 0, 0, 25);
  rect(0, 0, width, height);
  
  stroke(255, 255, 255);
  line(0, 0, mouseX, mouseY);
  
  fill(random(255), random(255), 255);
  textSize(random(36));
  textAlign(CENTER);
  text("Seniors 2013\n The best\n you've ever seen", mouseX, mouseY);
  
}
