
PImage background;
PImage ryan;
 
void setup()
{
  print(key);
   size(720,480);
   smooth();
   noStroke();
   frameRate(20);
   background = loadImage("background.jpg");
   ryan = loadImage("ryan.png");
}
  
void draw()
{
  image(background,0,0);
  image(ryan, mouseX, mouseY);
}


