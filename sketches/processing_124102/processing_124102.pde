
PImage img;
PImage img2;

void setup()
{
  size(500, 500);
  img = loadImage("buzz.jpg");
  img2 = loadImage("png.png");
}

void draw()
{
  background(0);
  imageMode(CORNER);
  tint(255, 153, 204);
  image(img, 0, 0);
  noTint();
  
  imageMode(CENTER);
  tint(255, mouseX/2);
  image(img2, mouseX, mouseY, 150, 150);
}



