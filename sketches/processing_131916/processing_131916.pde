
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
  triangle( 585, 339, 590, 325, 595, 339);
  triangle( 570, 338, 575, 330, 585, 338);
  
  fill(100);
  ellipse(300, 210, 80, 140);
  
  fill(0, 100, 120);
  quad(240, 550, 400, 550, 400, 750, 240, 750);
  
  float lx = 240;
  float ly = 280;
  float endx = 200;
  float endy = 480;
  while (lx > endx && ly < endy)
  {
    float nextX = lx + random(10);
    float nextY = ly + random(20);
    line(lx, ly, nextX, nextY);
    stroke(200);
    ly = nextY;
    lx = nextX;
  }
  
  float lx2 = 390;
  float ly2 = 280;
  float endx2 = 430;
  float endy2 = 480;
  while (lx2 < endx2 && ly2 < endy2)
  {
    float nextX2 = lx2 + random(10);
    float nextY2 = ly2 + random(20);
    line(lx2, ly2, nextX2, nextY2);
    stroke(255);
    ly2 = nextY2;
    lx2 = nextX2;
  }
  strokeWeight(1);

}


