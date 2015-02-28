
int numRods = 11;
class Lightning
{
  float[] a;
  PVector[] loc;
  public Lightning()
  {
    a=new float[numRods];
    loc=new PVector[numRods];
    a[0]=random(PI*2);
    for(int i=1;i<numRods-1;i++)
    {
      a[i]=random(a[i-1]-1.5,a[i-1]+1.5);
    }
    loc[1]=new PVector(width/2+15*cos(a[0]),height/2+15*sin(a[0]));
    for(int i=2;i<numRods;i++)
    {
      loc[i]=new PVector(loc[i-1].x+30*cos(a[i-1]),loc[i-1].y+30*sin(a[i-1]));
    }
  }
  void show()
  {
    stroke(255,215,0);
    line(width/2,height/2,loc[1].x,loc[1].y);
    for (int i=1;i<numRods-2;i++)
    {
      line(loc[i].x,loc[i].y,loc[i+1].x,loc[i+1].y);
    }
    lightnings.remove(this);
  }
}

