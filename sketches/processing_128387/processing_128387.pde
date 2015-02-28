


PImage myimage;
PImage belt1;
PImage belt2;


void setup()
{
  size (500, 500);
  
  myimage = requestImage ("gsp.jpg");
  belt1 = requestImage ("belt.png");
  belt2 = requestImage ("belt2.png");
}


void draw()
{
  // check the size of your image to know if it has loaded
  // with requestImage()
  if (myimage.width > 0)
  {
    image(myimage, 0, 0, width, height);
    image(belt1, 450, 450, 150, 150);
    image(belt2, 350, 350, 150, 150);
  }
   

 for (int x = 0; x < width; x += 10)
 {
   stroke(255, 255, 255);
   strokeWeight(2);
   line (x, 0, x, height);
 }
 for (int y = 0; y < height; y += 20)
 {
   stroke (255, 0, 0);
   line (0, y, width, y);
 }
 filter(INVERT);
 
 //Draw line bit by bit (lx, ly) to (nextY, nextX)
 //but using random to offset the next positions
 //more randomly to "jiggle" the line
 stroke (255);
 strokeWeight(10);
 float ly = 0.0;
 float lx = 0.0;
 while (lx < width)
 {
   float nextX = lx + random (1, 10);
   float nextY = ly + random(50);
   line (lx, ly, nextX, nextY);
   ly = nextY;
   lx = nextX;
 }
 
 lx = width/2;
 ly = height/2;
 for (int n = 0; n < 10; n +=1)
 {
   float nextX = lx + random (1, 10);
   float nextY = ly + random (50);
   line (lx, ly, nextX, nextY);
   ly = nextY;
   lx = nextX;
 }
 strokeWeight(1);
 strokeWeight(1);
 
 //apply filter to all images on the screen
 //filter(INVERT);
}


