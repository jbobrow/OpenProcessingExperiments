
PImage img;
PImage img2;
PImage img3;

void setup()
{
  size(700, 600);
  img = loadImage("skyline.jpg");
  img2 = loadImage("Fishzilla.png");
  img3 = loadImage("SkylineSmoke.jpg");
}

void draw () 
{

  image (img, 0, 0, 700, 600);
  image (img2,mouseX,mouseY);
  
  if (mousePressed)
{
image (img3,0,0,700,600);
}
}


