
PImage hintergrund;
PImage geist;
 
void setup()
{
  size(1118,500);
  hintergrund = loadImage("hintergrund.jpg");
  geist = loadImage("geist.png");
}
 
void draw()
{
  background(0);
  image(hintergrund, 0, 0);
 
  float transparenz = map(mouseX, 0, 200, 0, 255);
 
  tint (255, transparenz);
 
  image(geist, mouseX-50, 100);
}
