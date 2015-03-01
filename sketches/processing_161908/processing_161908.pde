
int parameter = 20;
int c = 0;
int i = 100;
int maxRadius = 4 * parameter;
 
void setup()
{
  size(500, 500);
  frameRate(40);
}
 
void draw()
{
  stroke(255);
  for (int x = 0; x < width; x += parameter) // draws the squares across
  {
      // Center of current x square
      float cx = x + parameter / 2;
    for (int y = 0; y < height; y += parameter) // draws the squares down
    {
      // Center of current y square
      float cy = y + parameter / 2;//30
      // Distance between mouse and current square
      float d = dist(mouseX, mouseY, cx, cy);        
      int c = 100; // Default to black
      if (d < maxRadius ) // If close enough of mousePressed location
      {
        // Compute a grayscale color proportional to distance
        c = int(255 * (1 - d / maxRadius));
       
      }
      fill(i); // Provide the color
      rect(x,y,parameter-1,parameter-1); // Color the rectangles
      
      if (mousePressed) {
      fill(c); // Change the color
      rect(x, y, parameter-1, parameter-1); // Re-color the rectangles
      }
    }
  }
}

