
PImage img;
PImage img2;

void setup()
{
  size(1000, 500);
  img = loadImage("bild1.JPG");
  img2 = loadImage("bild2.png");
}

void draw()
{
  
  image(img, 1000/2, 500/2);
  pushMatrix();
  translate(mouseX, mouseY);
  imageMode(CENTER);
  
  image(img2, 0, 0, 55, 100);
  popMatrix();
} 


