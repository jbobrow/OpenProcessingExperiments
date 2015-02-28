
// Josh Newby
// Aesthetics and Semantics with Matt Zywica
// Final Animation
// 5.1.13

// screen dimensions
int width = 400;
int height = 400;
 
// initializing arrays
int[] deltaX = new int[10];
int[] deltaY = new int[10];
int[] posX = new int[10];
int[] posY = new int[10];
int[] siz = new int[10];
 
// color randomizing
color[] col = {
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250)),
  color(random(28, 138), random(42, 72), random(80, 250))
};

// creating tanslucent background 
void setup() {
  background(32,48,50);
  smooth();
  noStroke();
  size(width, height);
  createDeltaVals(10);
  createXYpositions(10);
  createSize(10);
}
 
void draw() 
{
  fill (32,48,50, 98);
  rect (-1, -1, width + 1, height + 1);
  for (int i = 0; i < 10; i++) 
  {
    fill(col[i]);
    ellipse((int)posX[i], (int) posY[i], (int)siz[i], (int) siz[i]);
    posX[i] += deltaX[i];
    posY[i] += deltaY[i];
 
    if (posX[i] + siz[i]/2 > width)
    deltaX[i] = -deltaX[i];
    if (posX[i] -siz[i]/2 < 0)
    deltaX[i] = -deltaX[i];
    if (posY[i] + siz[i]/2 > height)
    deltaY[i] = -deltaY[i];
    if (posY[i] - siz[i]/2 < 0)
    deltaY[i] = -deltaY[i];
  }
}
 
 
void createDeltaVals(int k) {
  for (int i = 0; i<k; i++) {
    deltaX[i] = (int)random(5, 10);
    deltaY[i] = (int)random(5, 10);
  }
}
 
void createXYpositions(int k) {
  for (int i = 0; i<k; i++) {
    posX[i] = (int)random(0, width);
    posY[i] = (int)random(0, height);
  }
}
 
void createSize(int k) {
  for (int i = 0; i<k; i++) {
    siz[i] = (int)random(10, 70);
  }
}
