
/* @pjs preload="photo.JPG"; */

PImage myimage;

void setup()
{
  size(500,700);
  
  myimage = loadImage("photo.JPG");
}
void draw()
{
 {
   image(myimage, 0, 0, width, height);
 }
   image(myimage, width, height);
   filter(BLUR, 2);

 for (int x = 0; x < width; x += 50)
{
  stroke(3);
  line(x, 0, x, height);
}
  for (int y = 0; y < height; y += 50)
  {
    stroke(3);
    line(0, y, width, y);
  }
    
    stroke(50);
    strokeWeight(10);
    float ly = 350;
    float lx = 150;
    
    float endx = 450;
    float endy = 700;

    while (lx < 250)
    {
    float nextY = ly + random(70);
    float nextX = lx + random(75);
    line(lx, ly, nextX, nextY);
      ly = nextY;
      lx = nextX;
     }
strokeWeight(1);
  
  fill(145, 200, 0);
 quad(50, 50, 50, 100, 100, 50, 100, 100);
 quad(300, 100, 350, 150, 300, 150, 350, 100);
 
 fill(250, 0, 0);
 triangle(250, 500, 300, 500, 275, 650);
}
{
  
}



