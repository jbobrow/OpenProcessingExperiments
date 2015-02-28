
float diameter;
color circleColor;
int colorCounter;
float diameterOffset = 10;
PImage myImage;

void setup()
{
  size(400, 200);
  frameRate(30);
  diameter = 10;
  colorCounter = 0;
  circleColor = color(255);
  
  // load image into variable. 
  // Drag and drop onto processing to be able
  // to reference your image by name.
  myImage = requestImage("skull.jpg");
}

void draw()
{
  // draw image in background 
  // after checking to make sure it's loaded.
  if (myImage.width > 0)
  {
    image(myImage, 0,0, width, height);
  }
  
  // Set grid color to black
  stroke(0);
  
  // Space between grid lines
  int gridSize = 50;
  
  // draw vertical lines
  int x = 0;
  while (x < width)
  {
    line(x, 0, x, height);
    x += gridSize;
  }
  
  // draw horizontal lines
  int y = 0;
  while (y < height)
  {
    line(0, y, width, y);
    y += gridSize;
  }
  
  // another way to draw vertical lines
  for (x = 0; x < width; x += gridSize)
  {
    // Set grid color to red to see difference
    stroke(255, 0, 0);
    line(x, 0, x, height);
  } 
 
  // Increase or decrease Diameter of circle
  diameter = diameter + diameterOffset;
  
  // Increase our counter for the random color
  colorCounter += 1;
  
  // Make the diameter decrease when it hits the edge
  if (diameter >= width && diameter >= height)
  {
    diameterOffset = -10;
  }
  
  // Make the diameter increase when it's too small
  if (diameter <= 0) 
  {
    diameterOffset = 10;
  }
  
  // Change the color only every 5th update frame.
  if (colorCounter >= 5)
  {
    circleColor = color(random(50, 255), random(100), random(100));
    colorCounter = 0;
  }
  
  // Draw littler concentric circles to fill up the diameter
  int newDiameter = 0;
  while (newDiameter < diameter)
  {
     // Set color for circle
    stroke(circleColor);
    
    noFill();
    ellipse(width/2, height/2, newDiameter, newDiameter);
    newDiameter += 20;
  }
}


