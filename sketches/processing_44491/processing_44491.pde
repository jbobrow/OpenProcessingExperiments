
void setup()
{
  size(300,200);
  frameRate(1);
}
int number_bars = int(random(50,150));
int bar=0;

void draw()
{
  background(255);
  for(int i =0; i<number_bars; i++)
  {
    bar = int(random(300));
    loadPixels();
    for(int x = bar; x<60000; x+=width)
    {
     pixels[x]=color(0);
      
    }
    updatePixels();
  }
  
  
}

