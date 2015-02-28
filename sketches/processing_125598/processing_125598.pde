
PImage hintergrund;
PImage erste;
PImage zweite;
PImage dritte;
PImage vierte;
PImage klick;

void setup ()
{
  size (600, 500);
  hintergrund = loadImage ("Hintergrund.JPG");
  erste = loadImage ("Erste.JPG");
  zweite = loadImage ("Zweite.JPG");
  dritte = loadImage ("Dritte.JPG");
  vierte = loadImage ("Vierte.JPG");
  klick = loadImage ("Klick.JPG");
}

void draw ()
{
  image (hintergrund, 0, 0, 600, 500);
  if (mouseX >= 480 && mouseX <= 560 && mouseY >= 150 && mouseY <= 250)
  {
    image (erste, 0, 0, 600, 500);
  }
  
  if (mouseX >= 100 && mouseX <= 200 && mouseY >= 150 && mouseY <= 250)
  {
    image (zweite, 0, 0, 600, 500);
  }
  
  if (mouseX >= 280 && mouseX <= 360 && mouseY >= 100 && mouseY <= 150)
  {
    image (dritte, 0, 0, 600, 500);
  }
  
  if (mouseX >= 280 && mouseX <= 360 && mouseY >= 250 && mouseY <= 350)
  {
    image (vierte, 0, 0, 600, 500);
  }
  
  if (mousePressed == true)
  {
    image (klick, 0, 0, 600, 500);
  }
  
}


