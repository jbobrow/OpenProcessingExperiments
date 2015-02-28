
PImage hintergrund;
PImage erstes;
PImage zweites;
PImage drittes;
PImage logo;

void setup ()
{
  size(1000, 1000);
  hintergrund = loadImage ("Hintergrund0.JPG");
  erstes = loadImage ("erste1.JPG");
  zweites = loadImage ("zweite2.JPG");
  drittes = loadImage ("dritte3.JPG");
  logo = loadImage("KJGSZ14.JPG");
}

void draw ()
{
  image(hintergrund, 0, 0, 1000, 1000);
  
  if(mouseX >= 1 && mouseX <= 333 && mouseY >= 1 && mouseY <= 1000)  
  {
    
    image (erstes, 0, 0, 1000, 1000);
  }
  
  if(mouseX >= 334 && mouseX <= 666 && mouseY >= 1 && mouseY <= 1000)  
  {
    image (zweites, 0, 0, 1000, 1000);
  }
  
  if(mouseX >= 667 && mouseX <= 1000 && mouseY >= 1 && mouseY <= 1000)
  {
    image (drittes, 0, 0, 1000, 1000);
  }
  
  if(mousePressed == true)
  {
    image (logo, 0, 0, 1000, 1000);
  }
}
