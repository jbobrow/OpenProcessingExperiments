
color alive = color(0);
color dead  = color(204);
int[] offsets={-1,0,1,-1,1,-1,0,1};
void setup()
{
  size(512,512);
  offsets[0]-=width;
  offsets[1]-=width;
  offsets[2]-=width;
  offsets[5]+=width;
  offsets[6]+=width;
  offsets[7]+=width;
  loadPixels();
  for(int p=0 ; p< pixels.length ; p++)
  {
    int die = int(random(1,8));
    pixels[p] = (die==1)?alive:dead;
  }
  updatePixels();
}

void draw()
{
  loadPixels();
  int[] n = new int[pixels.length];
  
  for(int p=0 ; p< pixels.length ; p++)
  {
    n[p]=0;
    for(int f=0; f<offsets.length; f++)
    {
      int px = constrain(p+offsets[f],0,pixels.length-1);
      n[p]+= (pixels[px]==alive)?1:0;
    }
  }
  for(int p=0 ; p< pixels.length ; p++)
  {
    if(pixels[p]==alive)
    {
      if(n[p]<2) pixels[p]=dead;
      if(n[p]>3) pixels[p]=dead;
      if(n[p]==2||n[p]==3) pixels[p]=alive;
    }
    else
    {
      if(n[p]==3) pixels[p]=alive;
    }
  }
  updatePixels();
}

