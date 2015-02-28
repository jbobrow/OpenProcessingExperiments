
/*
Sketch: 4Kad
By: Maxime Beauchemin
On: 4/20/09
What it does: First prototype for a Kadelioscope, the Kaledioscope function will evolve to divide the screen 
using a dynamic parameter but that's it for now. 
I also render rectangle random saturated rectangles and clicking the mouse generates circles.

*/

int numCopies =4;
void setup()
{
  size(600,600);
  background(0);
  colorMode(HSB, 1);
  smooth();
  frameRate(50);
}

void draw()
{
  println(frameRate);
  fill(0, 0.02);
  rect(0,0,width,height);


    fill(random(1),1,1);

    rect(random(width/2), random(height/2), random(100), random(100))  ;
    
  if (mousePressed)
  {
    int x=mouseX;
    int y=mouseY;
    if (x > width/2) x=width-x;
    if (y > height/2) y=height-y;
    fill(random(1),1,1);
    int sizeCircle=(int)random(200)+50;
    ellipse(x, y, sizeCircle,sizeCircle)  ;
  }
  KaledioscopeIt(4);
}

void KaledioscopeIt(int nbSection)
{
  //This copies what's at 9 oclock clockwise from there
  if (nbSection==4)
  {
    loadPixels();
    //int nbPixelsZone = (width*height)/4;
    for(int x=0; x<width/2;x++)
    {
      for(int y=0; y<height/2;y++)
      {
        pixels[PixelPos(width-x-1, y)] = pixels[x+y*width];
        pixels[PixelPos(x, height-y-1)] = pixels[x+y*width];
        pixels[PixelPos(width-x-1, height-y-1)] = pixels[x+y*width];
      }
    }
    updatePixels();
  }
}

int PixelPos(int x, int y)
{
  return (width * y) + x;
}

