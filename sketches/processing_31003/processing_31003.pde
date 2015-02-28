
// constants
int BX = 32;
int BY = 32;
int BDX = 8;
int BDY = 8;
int NS = 255;

// globals
int[] starsX = new int[NS];
int[] starsY = new int[NS];

// setup
void setup()
{
  size(640, 320);
  smooth();
  for (int i = 0; i < NS; i++)
  {
    starsX[i] = (int)random(width);
    starsY[i] = (int)random(height);  
  }  
  frameRate(30);
}

// draw
void draw()
{
  noStroke();
  fill(255 - (mouseX / 2.5));
  rect(0, 0, width, height);
  textSize(96);
  textAlign(CENTER);
  fill((255 - (mouseX / 2.5) - 4));  
  text("NIGHTFALL", width / 2, (height / 2) - 10);  

  int x, y;
  fill(255);  
  for (int i = 0; i < NS; i++)
  {
    rect(starsX[i], starsY[i], 1, 1);
  }

  stroke(100);
  strokeWeight(8);
  fill(255);
  ellipse(540, 60, BX * 3, BY * 3);
  noStroke();
 
  // buildings 
  int remainingX = width;
  int currX = BX / 2;
  int rbWidth;
  int rbHeight;
  float angle = 0;

  while (remainingX >= BX)
  {
    rbWidth = 1;
    rbHeight = 1 + abs((int)(sin(angle) * 5));
    currX = drawBuilding(currX, height - (rbHeight * (BY - BDY)) - BDY, rbWidth, rbHeight);
    remainingX = width - currX;
    angle += TWO_PI/12.0;
  }
}

// draw building
int drawBuilding(int x, int y, int bx, int by)
{
  int sx = x;
  int sy = y;

  for (int i = 0; i < by; i++)
  {
    x = sx;
    for (int j = 0; j < bx; j++)
    {
      fill(100);
      rect(x, y, BX, BY);
      fill(200);
      rect(x + BDX, y + BDY, BX - (2 * BDX), BY - (2 * BDY));    
      x += BX - BDX;
    }
    y += BY - BDY;
  }

  return x;
}


