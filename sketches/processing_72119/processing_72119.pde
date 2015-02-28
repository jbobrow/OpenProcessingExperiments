
//Derek King, Ticklish Penguin, CP1 mods 14-15 
//http://dereklucca.webs.com/Scary Face.html

PImage porch;
PImage face;
void setup()
{
  size(500, 500);
  porch = loadImage ("http://oldpicture.tk/wp-content/uploads/black-screen_22_1.jpg");
  face = loadImage ("http://www.scarymazegames.net/scary-pictures/seriously_scary.jpg");
}
void draw()
{
  if (mousePressed == false)
  {
    image(porch, 10, 10, 480, 480);
  }
  else 
  {
    image(face, (random(25)), random(25), 500, 500);
  }
}
