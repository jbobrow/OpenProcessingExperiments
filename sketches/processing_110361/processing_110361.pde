
float x = 0;
float speed = 10;
color circleColor;
int colorTimer = 0;

// Variable to store loaded Image
PImage myImage;

PImage skullImage;

// Variable to keep track if we have already applied blur
boolean alreadyBlurred = false;

void setup()
{
  size(400, 400);
  
  // change how many times draw() happend a second.
  frameRate(30);
  
  // load an image that has ben drag and dropped
  // on the processing window
  myImage = requestImage("stoneskull.jpg");
  skullImage = loadImage("skull.jpg");
}

void draw()
{
  // First check that the image is loaded by checking the width
  if (myImage.width > 0)
  {
    // check if we already did this
    if (alreadyBlurred == false)
    {
      // Apply filter to the image
      myImage.filter(BLUR, 10);
      
      // if this is the first time set it to true to not happen again
      alreadyBlurred = true;
    }
    
    // Draw the image to the screen
    image(myImage, 0, 0, width, height);
  }
  image(skullImage, 0, 0, 100, 100);
  
  // Vertical grid lines going to the right
  int xx = 0;
  while (xx < width)
  {
    stroke(255, 0, 0);
    line(xx, 0, xx, height);
    xx += 10;
  }
  
  // Horizontal grid lines going down
  for(int yy = 0; yy < height; yy += 10)
  {
    stroke(0, 255, 0);
    line(0, yy, width, yy);
  }
  
  // count up each frame
  // reset to 0 after 10 counts
  colorTimer += 1;
  if (colorTimer > 10)
  {
    colorTimer = 0;
  }
  
  float radius = 50;
  if (x < radius)
  {
    speed = 10;
    fill(255, 0, 0);
  }
  else if (x >= width - radius)
  {
    speed = -10;
    fill(0, 0, 255);
  }
  else
  {
    //if (x % 50 == 0)
    if (colorTimer == 0)
    {
      circleColor = color(random(255), random(255), random(255));
    }
    fill(circleColor); 
  }
  
  if ((x > 200 || x < 50) && 10 == speed)
  {
    fill(255, 0, 255);
  }
  
  x += speed;
  
  ellipse(x, height/2, radius * 2, radius * 2);
  
  stroke(255);
  strokeWeight(10);
  float ly = 0.0;
  float lx = 0.0;
  while (lx < width)
  {
    float nextX = lx + random(10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  
  ly = 0.0;
  lx = 100.0;
  while (lx > 0)
  {
    float nextX = lx - random(10);
    float nextY = ly + random(50);
    line(lx, ly, nextX, nextY);
    ly = nextY;
    lx = nextX;
  }
  strokeWeight(1);
}


