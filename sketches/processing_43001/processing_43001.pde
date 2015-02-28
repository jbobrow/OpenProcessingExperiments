
void setup()
{
  size(500, 500);
  background(255);
  smooth();
  noStroke();
}

int rows = 500;
int cols = 500;

void draw()
{
  background(255);
  
  for(int i=0; i<rows; i+=15)
  {
    int s=0;
    for(int j=0; j<cols; j+=15)
    {
      pushMatrix();
      rectMode(CENTER);
      translate(250, -250);
      float d = dist(mouseX, mouseY, i, j);
      scale(d/150);
      fill(0);
      rotate(radians(45));
      rect(i, j, s+20, s+20);
      popMatrix();
    }
    s += 3;
  }
}

//static squares. if dist is zero, size is 20.

