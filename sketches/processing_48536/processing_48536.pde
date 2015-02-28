
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  //frameRate(30);
}

void draw()
{
  strokeWeight(5);
  fill(random(255), random (255), random (255), 50);
  //line(width/2,height/2, pmouseX,pmouseY);
  ellipse(mouseX, mouseY, 50,50);
}


