
PImage img2;
PImage img3;
PImage img4;

void setup()
{
  size(800, 500);
  img2 = loadImage("Hintergrund.jpg");
  img3 = loadImage("Mann.gif");
  img4 = loadImage("HIntergrund2.jpg");
}

void draw()
{
  background(0);
  imageMode(CORNER);
  if(mouseX >0&& mouseX <455)
  {
  image(img2, 0, 0);
  }
  else if(mouseX >455 && mouseX<800)
  {
    image(img4,0,0);
  }

  if (mouseX > 0 && mouseX <455)
  {
    imageMode(CENTER);
    tint(255);
    image(img3, mouseX, 420, 800, 500);
    noTint();
  }
  else if (mouseX >455 && mouseX <800)
    tint(255, mouseX/2);
  image(img3, mouseX, 420, 800, 500);
  noTint();
  
}



