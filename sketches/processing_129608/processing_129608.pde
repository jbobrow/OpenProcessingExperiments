
/* @pjs preload="somebros.jpg"; */
PImage myimage;



void setup()

{
  size(500,500);
  
  myimage = requestImage("somebros.jpg");
  
}

void draw()
{
  if (myimage. width > 0)
  {
    image(myimage, 0, 0, width, height);
  }
  filter(POSTERIZE,5);
  
  for (int x = 0; x < width; x += 20)
  
  {
    stroke(0);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 20)
  {
    stroke(#FFFFFF);
    line(0, y, width, y);
  }
  
  stroke(255);
  strokeWeight(10);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
  
    
  float nextX = lx + random(15);
  float nextY = ly + random(55);
  line(lx, ly, nextX, nextY);
  ly = nextY;
  lx = nextX;
  
  }
  lx = width/2;
  ly = height/2;
  for (int n = 0; n < 10; n +=1)
  
  strokeWeight(5);
  
}




