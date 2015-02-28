
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/111766*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
PImage yoshihat;
PImage hal;
PImage zant;
PImage scoot;
PImage twili;
void setup() {
  size(600,800);
  yoshihat = requestImage("yoshi.jpg");
  hal = requestImage("Hope_of_Farmel.png");
  zant = requestImage("loz_zant_01.jpg");
  scoot = requestImage("Scooticon.png");
  twili = requestImage("Twilight_Emblem.gif");
}
void draw()
{
  float x = 300;
  float y = 800;
  float x2 = x;
  float y2 = y;
  strokeWeight (5);
  stroke(#000000);
  {
    tint(255);
    image(yoshihat, 0, 0, 600, 800);
    tint(255, 125);
    image(zant, 0, 0, 300, 800);
    tint(255, 45);
    image(hal, 300, 0, 300, 800);
    tint(255, 130);
    image(scoot, 300 + random (-10,10), 200 + random(-50,50), 300, 300);
    tint(255, 130);
    image(twili, 0 + random (-10, 10), 200 + random(-50,50), 300, 300);
  }
float x1 = 300;
float y1 = 0;
float x1a = x1;
float y1a = y1;
strokeWeight (5);
stroke(#EA0202);
while (y1 < 800)
{
  y1 += 5;
  x1 += random(-3, 3);
  line(x1a, y1a, x1, y1);
  x1a = x1;
  y1a = y1;
  noise(50, 50);
}
}


