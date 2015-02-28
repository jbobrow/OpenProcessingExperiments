
int sizeX = 500;
int sizeY = 400;
int bleedLength = 5;

void setup()
{
  
  size(sizeX, sizeY);

}

void draw()
{
  
  frameRate(5);
  background(#000000);

  for (int x = 0; x <= sizeX - bleedLength; x = x + bleedLength)
  {
    
    int depth = int( random(sizeY) );
    rect(x, 0, bleedLength, depth);
    noStroke();
    fill(#FF0000);
    
  }
   
}

