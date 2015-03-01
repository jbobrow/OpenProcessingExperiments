
void setup()
{
  size(900,920);
  background(0);
  loadPixels();

  for (int i = 0; i < pixels.length; i++)
  {
    
    int x = i % width;
    int y = (height-20)-floor(float(i) / width);
    int e = euclidGCDsteps(x,y);

    color c = color(255-(1.0*e)/14*255);
  
    pixels[i] = c;
  }
  updatePixels();
}

int euclidGCDsteps(int x, int y)
{
  int t;
  int steps = 0;
  if (x >= y)
  {
    while (y != 0)
    {
      t = y;
      y = x % y;
      x += t;
      steps++;
    }
  }
  else
  {
    return euclidGCDsteps(y,x);
  }
  return steps; 
}

void draw()
{
  drawCoordinates();
}

void drawCoordinates()
{
  PFont f;
  f = createFont("Arial",16,true);
  textFont(f,16); 
  
  String xcoord = str(mouseX);
  String ycoord = str((height-20)-mouseY);
  String gcd = str(euclidGCDsteps(mouseX,(height-20)-mouseY));
  String coordinate = "x= " + xcoord + "  y= " + ycoord + " GCD steps= " + gcd;

  stroke(0);
  fill(0);
  rect(0,height-20,width,20);
  
  stroke(255);
  fill(255);
  text(coordinate,0,height-4);

  
}
