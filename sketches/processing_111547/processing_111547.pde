
 float diameter;
 color circleColor;
int colorCounter;
 float diameterOffset = 5;
PImage blurred1Image;
boolean filterApplied = false;
void setup()
{
  size(500, 500);
  blurred1Image = requestImage("Blurred1.JPG");
}
void draw()
{
  if (blurred1Image.width > 0)
  {
    imageMode(CENTER);
    if (filterApplied == false)
    {
      blurred1Image.filter(INVERT);
      filterApplied = true;
    }
  }
  image(blurred1Image, width * 0.5, height * 0.5, width, height);
  fill(0,0,0);
  ellipse(370, 215, 80, 80);
 
 fill(255, 255, 255);

 // Space between grid lines
  int gridSize = 50;
    
  // draw vertical lines
  int xx = 0;
  while (xx < width)
  {
    line(xx, 0, xx, height);
    xx += gridSize;
  }
    
  // draw horizontal lines
  int yy = 0;
  while (yy < height)
  {
    line(0, yy, width, yy);
    yy += gridSize;
 
  }
 // Increase or decrease Diameter of circle
  diameter = diameter + diameterOffset;
   
  // Increase our counter for the random color
  colorCounter += 5;
   
  // Make the diameter decrease when it hits the edge
  if (diameter >= width && diameter >= height)
  {
    diameterOffset = -20;
  }
   
  // Make the diameter increase when it's too small
  if (diameter <= 0)
  {
    diameterOffset = 2.5;
  }
   
  // Change the color only every 5th update frame.
  if (colorCounter >= 5)
  {
    circleColor = color(random(0, 255), random(0), random(255));
    colorCounter = 0;
  }
   
  // Draw littler concentric circles to fill up the diameter
  int newDiameter = 0;
  while (newDiameter < diameter)
  {
     // Set color for circle
    stroke(circleColor);
     
    noFill();
    ellipse(370, 215, newDiameter, newDiameter);
    newDiameter += 15;

  }
  float x = 370;
  float y = 215;
  float prevX = x;
  float prevY = y;
  strokeWeight(5);
  while (x < 500)
  {
 

    x += 5;
    y += random(-10, 10);
    fill(255, 255, 255);
    line(prevX, prevY, x, y);
    prevX = x;
    prevY = y;
  }
  fill(255, 255, 255);
  rect(340, 200, 15, 15, 7);
 rect(380, 200, 15, 15, 7);
 
 fill(255, 255, 255);
 rect(330, 230, 60, 10);
 
}


