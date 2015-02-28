
int largo = 20;
int c = 0;
int maxRadius = 4 * largo;

void setup() 
{
  size(300, 300);
  frameRate(30);
}

void draw() 
{
  stroke(255);
  for (int x = 0; x < width; x += largo) 
  {
    // Center of current square (x)
      float cx = x + largo / 2;
      println ( cx );
    for (int y = 0; y < height; y += largo)
    {
      // Center of current square (y)
      float cy = y + largo / 2;//30
      // Distance between mouse and current square
      float d = dist(mouseX, mouseY, cx, cy);         
      int c = 0; // Default to black
      if (d < maxRadius) // If close enough of mouse
      {
        // Compute a gray level proportional to distance
        c = int(255 * (1 - d / maxRadius));
      }
      fill(c);
      rect(x, y, largo-1, largo-1);
    }
  } 
} 

  

