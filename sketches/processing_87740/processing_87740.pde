
snow s1=new snow();
star st1=new star();
void setup()
{
  int i;
  size(500,500);
  for(i=1;i<=100;i++)
  {
    s1.New(i);
  }
  for(i=1;i<=200;i++)
  {
    st1.New(i);
  }
}

void draw()
{
  int i;
  fill(0,0,0,10);
  stroke(0);
  rect(0,0,500,500);
  for(i=1;i<=100;i++)
  {
    s1.update(i);
  }
  for(i=1;i<=200;i++)
  {
    st1.update(i);
  }
}

class snow
{
  float[] x=new float[151];
  float[] y=new float[151];
  snow()
  {
    
  }
  void New(int i1)
  {
    x[i1]=random(0,500);
    y[i1]=random(0,500);
  }
  void update(int i2)
  {
    y[i2]=y[i2]+random(0.1,0.7);
    stroke(255);
    fill(255);
    ellipse(x[i2],y[i2],5,5);
    if(y[i2]>500)
    {
      y[i2]=-10;
    }
  }
}

class star
{
  float[] x=new float[301];
  float[] y=new float[301];
  star()
  {
    
  }
  void New(int i1)
  {
    x[i1]=random(0,500);
    y[i1]=random(0,500);
  }
  void update(int i2)
  {
    point(x[i2],y[i2]);
  }
}
