
PImage photo;

void setup()
{
  size(500, 500);
    photo = loadImage("s.png");
}

void draw()
{
  float angle = atan2(mouseY - 250, mouseX - 250);
  
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  imageMode(CENTER);
  image(photo, 0, 0);
  popMatrix();
}


