
int num = 60;
int[] x = new int[num];
int[] y = new int[num];

void setup()
{
  size(600,600);
  background(0);
  smooth();
  noStroke();
}

void draw()
{
  for (int i = x.length-1; i > 0; i--)
  {
    x[i] = x[i - 1];
    y[i] = y[i - 1];
  }
  x[0] = mouseX;
  y[0] = mouseY;
  
  for (int i = 0; i < x.length; i++)
  {
    fill(random(i * 7),0,0);
    ellipse(x[i], y[i], 40, 40);
  }
}


