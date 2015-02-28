
// To draw a bigger fractal, modify myw and myh and th (triangle height) accordingly
// Always make sure th is less than myh, and that the ratio between myw and myh is kept more or less constant
int myw = 300;
int myh = 260;
int th = 250;

// To stop the recursion, we can define a max level of depth of the fractal
int maxLevel = 5;
// Or, we can set that we want the length of a side to be always MORE OR EQUAL this value
int minDist = 4;

// Handle each level of the fractal
void handleLevel(int p1x, int p1y, int p2x, int p2y, int p3x, int p3y, int level)
{
   // Pick the color: Green for odd levels, Blue for even
   if (level % 2 == 0) fill(0,255,0);
   else fill(0,0,255);
   
   // The level basically involves drawing a triangle at the midpoints
   int pm1x = (p1x + p2x) / 2;
   int pm1y = (p1y + p2y) / 2;
   int pm2x = (p2x + p3x) / 2;
   int pm2y = (p2y + p3y) / 2;
   int pm3x = (p3x + p1x) / 2;
   int pm3y = (p3y + p1y) / 2;
   
   triangle(pm1x, pm1y,
      pm2x, pm2y,
      pm3x, pm3y);
   
   // We choose to proceed with the next iteration only if BOTH conditions are met
   if (level < maxLevel && (abs(pm1x - p1x) >= minDist) )
   {
      // For each level, we launch 3 triangles, which will eventually launch 3 triangles each, and so on
      // Choosing the right points is a bit tricky, luckily it's not OpenGL therefore they will be drawn even if the order of the vertices is not ccw!
      handleLevel(p1x, p1y, pm1x, pm1y, pm3x, pm3y, level + 1);
      handleLevel(pm1x, pm1y, p2x, p2y, pm2x, pm2y, level + 1);
      handleLevel(pm2x, pm2y, p3x, p3y, pm3x, pm3y, level + 1);
   }
}

void setup()
{
// Apparently, Carmack did not put brackets on separate lines. Unfortunately, I am not Carmack :( He can!
  size(myw, myh);
  background(0);  //set background white
  
  // Draw first, big triangle
  // The side of an equilateral triangle -> height * (2 / sqrt(3))
  int side = th * 1.155;
  int halfside = side / 2;
  
  // p1 is bottom-left, then ccw order
  int p1x = (myw / 2) - halfside;
  int p1y = 5;
  int p2x = (myw / 2) + halfside;
  int p2y = 5;
  int p3x = (myw / 2);
  int p3y = p1y + th;
  
  noStroke();
  fill(255,0,0);
  // Draw the first big outern triangle in red
  triangle(p1x, p1y, p2x, p2y, p3x, p3y, 1);
  // Then handle fractal levels from 1 onwards
  handleLevel(p1x, p1y, p2x, p2y, p3x, p3y, 1);
  
}

void draw()
{
   //draw function loops 

}
