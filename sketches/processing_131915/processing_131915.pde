
/* @pjs preload="VAC1.JPG"; */
PImage myImage;

void setup()
{
  size(900, 750);
  myImage = loadImage("VAC1.JPG");
}

void draw()
{
  image(myImage, 0, 0, width, height);
  myImage.filter(BLUR, 4);
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(150);
    line( x, 0, x, height);
  }
  for (int y = 0; y < height; y += 15)
  {
    stroke(200);
    line(0, y, width, y);
  }
  
  stroke(10);
  fill(200, 200, 0);
  triangle( 490, 340, 495, 330, 510, 340);
  triangle( 620, 335, 630, 320, 640, 335);
  
  
  stroke(255);
  strokeWeight(8);
  
  float lx = 210.0;
  float ly = 320.0;
  
  float endx = 190;
  float endy = 500;
  
  while (lx < endx && ly < endy)
  {
    float nextX = lx + random(10);
    float nextY = ly + random(20);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  
  strokeWeight(1);

}


