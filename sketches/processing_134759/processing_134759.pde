
void setup()
{
  size (450, 1000);
}

void draw()
{
  int x=15 ;
  float n = 1.618;
  float y = 0.618;
  background(255);
  smooth();
  strokeWeight(5);
  line (x/n/n, 0, x/n/n, mouseY/y);
  line (x / n, 0, x/n, mouseY);
  line (x, 0, x, mouseY*y);
  line (x*n, 0, x*n, mouseY*y*y);
  line (x*n*n, 0, x*n*n, mouseY*y*y*y);
  line (x*n*n*n, 0, x*n*n*n, mouseY*y*y*y*y);
  line (x*n*n*n*n, 0, x*n*n*n*n, mouseY*y*y*y*y*y);
  line (x*n*n*n*n*n, 0, x*n*n*n*n*n, mouseY*y*y*y*y*y*y);
  line (x*n*n*n*n*n*n, 0, x*n*n*n*n*n*n, mouseY*y*y*y*y*y*y*y);
  line (x*n*n*n*n*n*n*n, 0, x*n*n*n*n*n*n*n, mouseY*y*y*y*y*y*y*y*y);
}


