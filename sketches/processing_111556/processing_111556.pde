
PImage BlueFalcon;
PImage CaptFalconDash;
PImage CaptFalconDive;

void setup()
{
  size(600, 600);
  frameRate(30);
  BlueFalcon = requestImage("Blue_Falcon.jpg");
  CaptFalconDash = requestImage("captain-falcon-big.png");
  CaptFalconDive = requestImage("250px-SSBB_Captain_Falcon_screenshot.jpg");
}

void draw()
{
if (BlueFalcon.width > 0);
image(BlueFalcon, 0, 0, width, height);
filter(POSTERIZE, 2);
{
 if(CaptFalconDash.width > 0);
}
   image(CaptFalconDash, 450, 350, 150, 150);
{
 if(CaptFalconDive.width > 0);
}
   image(CaptFalconDive, 0, 350, 150, 150);
 
{
{
stroke(0,0,0);strokeWeight(2);
for (int i = 0; i < 700; i = i+50) {
  line(0, i, 600, i);
}
}
{ 
stroke(0,0,0);
strokeWeight(2);
for (int i = 0; i < 850; i = i+50) {
  line(i, 600, i, 0);
}
}
}
{
 stroke(#FFFF00);
 strokeWeight(7);
 float ly = 400.0;
 float lx = 150.0;
 while (lx < 450)
    {
      float nextX = lx + 10;
      float nextY = ly + random(-50, 50);
      line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
    }
  }
  
 

}



