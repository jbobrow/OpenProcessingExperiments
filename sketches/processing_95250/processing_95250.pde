
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/74936*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
color p[];
int f;
void setup()
{
  p = loadPalette("Blues.gpl");
  size(200,200);
  noiseDetail(12);
}

void draw()
{
  f++;
  for(int i=0 ; i<width ; i++)
  {
    for(int j=0 ; j<height ;j++)
    {
      float x = map(i,0,width,-2,2);
      float y = map(j,0,height,1,0);
      float z = map(f,0,10,0,1);
      float t = lerp(-1,1,noise(x,y-z,z));
      x += t;
      float c = (1-x*x)*(1-y);
      int q = (int)constrain(lerp(0,p.length,c),0,p.length-1);
      set(i,j,p[q]);
    }
  }
}



