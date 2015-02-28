
PImage hintergrund;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

void setup()
{
  size (800, 533);
  hintergrund = loadImage("hintergrund.jpg");
  img2 = loadImage("bild_4.png");
  img3 = loadImage("bild_5.png");
  img4 = loadImage("bild_7.png");
  img5 = loadImage("bild_6.png");
  img6 = loadImage("bild_8.png");
}
void draw ()
{
  image(hintergrund, 0, 0);

{
  if (mouseY <=100)
  {
  image(img2, 400, -65);
  }
  
  if(mouseY >100 && mouseY <=150)
  {
    image(img3, 325, -60);
  }
  if(mouseY >150 && mouseY <=200)
  {
    image(img3, 250, -20);
  }
  if(mouseY >200 && mouseY <=250)
  {
    image(img4, 250, -20);
  }
  if(mouseY >250 && mouseY <=300)
  { 
    image(img5, 250, -20);
  }
  if(mouseY >300 && mouseY <=350)
  {
    image(img6, 300, 0);
  }
  if(mouseY >350 && mouseY <=400)
  {
    image(img6, 380, 0);
  }
  if(mouseY >400 && mouseY <=450)
  {
    image(img4, 410, 0);
  }
  if(mouseY >450 && mouseY <= 533)
  {
    image(img2, 410, 30);
  }
}
}



