
PImage img1;
PImage img2;
float x_coord;
float y_coord;

void setup()
{
    size(400,400);
    img1 = loadImage("remy1.jpg");
    img2 = loadImage("remy2.jpg");

}

void draw() {
  
  if(mouseX < width/2)
  {
    background(255);
    image(img2, 0, 0);
  }
  else
  {
    background(255);
    image(img1, 0, 0);
  }
  
}


