
/* @pjs preload="Reflection.jpg,Skeletor.jpg"; */

PImage myimage;
PImage myimage2;

void setup()
{
  size(750, 500);
  myimage = loadImage("Reflection.jpg");
  myimage2 = loadImage("Skeletor.jpg");

}

void draw()
{
  image(myimage, 0, 0, width, height);
  tint(#2390C1);
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(200);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y = y + 10)
  {
    stroke(200);
    line(0, y, width, y);
  }
  
  stroke(0);
  fill(0);
  line(348, 314, 430, 310);
  triangle(297, 194, 313, 183, 367, 197);
  
  strokeWeight(0);
  fill(180, 130, 152);
  triangle(383, 200, 386, 275, 355, 275);
  
  fill(91, 85, 123);
  quad(382, 171, 398, 383, 482, 311, 471, 162);
  quad(283, 228, 371, 222, 307, 330, 284, 282);
  
  fill(255, 0, 0);
  ellipse(339, 211, 20, 20);
  ellipse(435, 206, 20, 20);
  
  fill(109, 49, 44);
  quad(315, 321, 270, 448, 291, 498, 433, 433);
  quad(371, 351, 453, 500, 291, 500, 272, 432);
  quad(410, 398, 459, 334, 459, 373, 430, 450);
  
  float lx = 340;
  float ly = 211;
  
  float endx = 435;
  float endy = 208;
  
  while (lx < endx && ly > endy)
  {
    float nextX = lx + random(1, 10);
    float nextY = ly + random(20);
    line(lx, ly, nextX, nextY);
    stroke(#C42828);
    ly = nextY;
    lx = nextX;
  }
  
  if (mouseX > 325)
  {
    noTint();
    image(myimage2, 0, 0, width, height);
    myimage2.filter(INVERT);
  }
}

