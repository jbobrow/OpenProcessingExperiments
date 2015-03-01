
void setup()
{
  size(900,920);
  background(0);
  loadPixels();

  for (int i = 0; i < pixels.length; i++)
  {
    int e = 0;
    int min = 0;
    int x = i % width;
    int y = (height-20)-floor(float(i) / width);
    if (y >= 0)
    {
      e = euclidGCD(x,y);
    }
    int l=0;
    if (x > y)
    {
      l = x;
    }
    else
    {
      l = y;
    }
   
    if (x > y)
    {
      min = y;
    }
    else
    {
      min = x;
    }
    
    color c = color((1.0*e)/min * 255); 
  
    pixels[i] = c;
  }
  updatePixels();

}

int euclidGCD(int x, int y)
{
  if (y == 0)
  {
    return x;
  }
  else if (x >= y && y > 0)
  {
    return euclidGCD(y,(x%y));
  }
  else 
  {
    return euclidGCD(y,x);
  }  
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
  String gcd = str(euclidGCD(mouseX,(height-20)-mouseY));
  String coordinate = "x= " + xcoord + "  y= " + ycoord + " GCD= " + gcd;

  stroke(0);
  fill(0);
  rect(0,height-20,width,20);
  
  stroke(255);
  fill(255);
  text(coordinate,0,height-4);

  
}
