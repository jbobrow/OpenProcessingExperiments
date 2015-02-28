
final int num = 50;
int[] x = new int[num];
int[] y = new int[num];
 
void setup()
{
  size(600, 300);
  smooth();
}
 
void draw()
{
  background(204);

  // Shadow
  stroke(160);
  for(int i = 0; i < num - 1; i++)
  {
    strokeWeight(i + 1);
    line(x[i] + 10, y[i] + 10, x[i + 1] + 10, y[i + 1] + 10);
  }

  // Outline
  stroke(0);
  for(int i = 0; i < num - 1; i++)
  {
    strokeWeight(i + 10);
    line(x[i], y[i], x[i + 1], y[i + 1]);
  }
  
  // Fill
  stroke(255);
  for(int i = 0; i < num - 1; i++)
  {
    strokeWeight(i + 1);
    line(x[i], y[i], x[i + 1], y[i + 1]);
  }
}

void mouseMoved()
{
  for(int i = num - 1; i > 0; i--)
  {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX;
  y[0] = mouseY;
}

                                                                
