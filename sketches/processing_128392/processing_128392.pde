
/* @pjs preload="sonic.gif, stoneskull.jpg"; */

PImage myimage;
PImage myimage2;

void setup()
{
  size(500, 300);
  
  myimage = loadImage("stoneskull.jpg");
  myimage2 = requestImage("sonic.gif");
  myimage.filter(BLUR, 8);
}

void draw()
{
  // use @pjs preload if you use loadImage() to load the image
  image(myimage, 0, 0, width, height);
  
  // check the size of your image to know if it has loaded
  // with requestImage()
  if (myimage2.width > 0)
  {
    // set tint to blue and then reset. using tint with filters seems to be buggy currently.
    tint(0, 153, 204); 
    image(myimage2, width/2, height/2, 100, 100);
    noTint();
  }
  
  for (int x = 0; x < width; x += 10)
  {
    stroke(255);
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y = y + 20)
  {
    stroke(255,0,0);
    line(0, y, width, y);
  }
  
  // Draw line bit by bit (lx, ly) to (nextY, nextX)
  // but using random to offset the next positions
  // more randomly to "jiggle" the line.
  stroke(255);
  strokeWeight(10);
  
  // start position
  float ly = 0.0;
  float lx = 0.0;
  
  // end position
  float endx = 100.0;
  float endy = 200.0;
  
  // only draw until we've exceeded the end position
  // && means 'and' and that both things have to be true
  while (lx < endx && ly < endy)
  {
    float nextX = lx + random(1, 10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }

  strokeWeight(1);
  
  // apply filter to all images on the screen
  //filter(GRAY); 
}

