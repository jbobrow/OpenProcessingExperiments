

float speed = 0.0008;
float r = 3.145;
float branchLength = 95;
int numBranches = 6;

void setup() 
{
  size(800,600);
  background(#111111);
  smooth();
}

void draw() 
{
  fill(#111111, 12);
  rect(0, 0, width, height);
  
  fractal(width/2, height/1.8, -HALF_PI, numBranches);
  r += speed;
}

void fractal(float x, float y, float a, int c) 
{
  float nx = x + branchLength  * cos(a);
  float ny = y + branchLength  * sin(a);
  
  if (c >= 1 && c != 6) {
    strokeWeight(1);
    stroke(#ffffff, 150);
    line(x, y, nx, ny);
  }

  if (c < numBranches) {
    stroke(#19888C, 90);
    fill(#ffffff, 250);
    ellipse(x, y, 5, 5);
    
    noStroke();
    stroke(#2EF7FF, 20);
    fill(#19888C, 8);
    ellipse(x, y, 100, 100);
  }
  
  if (c > 0) {
    fractal(nx, ny, (a + r / 3) * -3, c - 1);
    fractal(nx, ny, (a - r / 3) * -3, c - 1);
  } 
}



