
PImage myimage;

 
 
void setup()
{
  size (400, 400);
   
  myimage = requestImage ("mlk.jpg");
}
 
 
void draw()
{
  // check the size of your image to know if it has loaded
  // with requestImage()
  if (myimage.width > 0)
  {
    image(myimage, 0, 0, width, height);
    point(118, 170);
    stroke (#CCFFFF);
   
    point (209, 164);
    stroke(#CCFFFF);
    println ("x: " + mouseX + " y: " + mouseY);


  }
    
 
 for (int x = 0; x < width; x += 10)
 {
   stroke(255, 255, 255);
   strokeWeight(2);
   line (x, 0, x, height);
 }
 for (int y = 0; y < height; y += 20)
 {
   stroke (5, 8, 4);
   line (0, y, width, y);
 }
 filter(GRAY);
  
 //Draw line bit by bit (lx, ly) to (nextY, nextX)
 //but using random to offset the next positions
 //more randomly to "jiggle" the line
 stroke (255);
 strokeWeight(10);
 float ly = 0.0;
 float lx = 0.0;
 while (lx < width)
 {
   float nextX = lx + random (50);
   float nextY = ly + random(50);
   line (lx, ly, nextX, nextY);
   ly = nextY;
   lx = nextX;
 }
  
 lx = width/2;
 ly = height/2;
 for (int n = 0; n < 50; n +=1)
 {
   float nextX = lx + random (60, 20);
   float nextY = ly + random (50);
   line (lx, ly, nextX, nextY);
   ly = nextY;
   lx = nextX;
 }
 strokeWeight(10);
 strokeWeight(10);
  
 //apply filter to all images on the screen
 //filter(GRAY);
}




