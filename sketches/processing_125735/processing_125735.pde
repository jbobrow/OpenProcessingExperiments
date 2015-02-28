
PImage img;
PImage img2;
PImage img3;

void setup()
{
  size(600, 400);
  img = loadImage("Hintergrund.jpg");
  img2 = loadImage("Donut_Ganz.png");
  img3 = loadImage("Donut_Angebissen.png");
}

void draw()
{
  background(255);
  
  image(img, 0, 0);
  
  if (mousePressed == true) {
    image(img3, 190, 160);
  } 
  else {
    image(img2, 190, 160);
  }
}



