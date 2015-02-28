
PImage img1;
PImage img2;
PImage img3;

void setup()

{
  size(700, 500);
  img1 = loadImage("Kartoffel1.JPG");
  img2 = loadImage("Kartoffel6.JPG");
  img3 = loadImage("Schäler.PNG");
}

void draw ()
{ 
  imageMode(CORNER);
  image(img1, 0, 0, 700, 500);
{
  if (mousePressed == true)
  {image (img2, 0, 0, 700, 500);
  noTint();
  }
  
  imageMode(CENTER);
  image(img3, mouseX, mouseY, 200, 200);
}
}


