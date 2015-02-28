
int row = 0;

color an = color(255);
color ab = color(0);
void setup()
{
  size(500, 500);
  stroke(255);
  background(0);
  for(int i = 1; i < width; i++)
  {
    float muenze = random(100);
    if(muenze <20)
    {
      set(i,0, an);
    }
  }
  
}



void draw()
{
  for(int x = 1; x < width; x++)
  {
    color links = get(x-1,row);
    color mitte = get(x,row);
    color rechts = get(x+1,row);
    if(links == ab && mitte == an && rechts == ab)
   {
     set(x+1, row+1, an);
     set(x-1, row+1, an);
   }
   else if(links == ab && mitte == ab && rechts == an)
   {
     set(x+1, row+1, an);
   }
   else if(links == an && mitte == ab && rechts == ab)
   {
     set(x-1, row+1, an);
   }
   else if(links == an && mitte == an && rechts == ab)
   {
     set(x-1, row+1, ab);
     set(x+1, row+1, ab);
   }
     
     
     
     
  }
  row++;
  if(row >= height)
  {
    noLoop();
  }
  
}

