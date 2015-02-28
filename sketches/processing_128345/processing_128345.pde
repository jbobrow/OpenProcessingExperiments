
/* @pjs preload="JackFrostP4.PNG, snowscape.jpg";*/

PImage myimage;
PImage myimage2;
PImage myimage3;

void setup()
{
  size(500,500);
  myimage = requestImage("snowscape.jpg");
  myimage2 = loadImage("JackFrostP4.PNG");
  myimage3 = loadImage("FrostAce.jpg");
}

void draw()
{
  //check the size of your image to know if it has loaded
  //with requestImage()
  if (myimage.width > 0)
  {
    myimage.filter(GRAY);
    image(myimage, 0, 0, width, height);
  }
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(255);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y += 20)
  {
    line(0, y, width, y);
  }
  
  //Draw line bit by bit (lx,ly) to (nextY,nextX)
  // but using random to offset the next positions
  //more randomly to "jiggle" the line.
  stroke(255, 0, 0);
  strokeWeight(10);
  float ly = 100.0;
  float lx = 100.0;
  float noiseScale = 0.02;
  for(int x = 0; x < 100; x++) 
  {
    float r = random(250);
    stroke(r+5);
    line(100, r, 100+r, r);
  }
  strokeWeight(1);
  //filter(GRAY);
  tint(0,153, 204);
  //use @pjs preload if you use loadimage() to load the image
  image(myimage2, 250, 100, 100, 100);
  noTint();
  image(myimage3, 100, 100, 100, 100);
}


