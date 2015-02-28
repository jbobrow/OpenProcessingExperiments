
ArrayList Dog=new ArrayList();
ArrayList Cat=new ArrayList();

float h;
PVector Craft;
class attractor extends Vec2D{
  float A, B;
  boolean C=true,run=true;
  int counterChilds;
  attractor(float tempA, float tempB)
  {
    super(tempA,tempB);
    A=tempA;
    B=tempB;
  }
  void drawattractor()
  {
    if (run)
    {
      if(C)
      {
        stroke(100,0,0);
        fill(100,0,0);
      }
      else
      {
        stroke(255,0,0);
        fill(255,0,0);
      }
      strokeWeight (1);  
      ellipse (A,B,2,2);
      line (A, B, 0, A, B, 30);
    }
  }
}

class earthpoint extends Vec2D{
  float A, B;
  boolean C=true,run=true;
  int counterChilds;
  earthpoint(float tempA, float tempB)
  {
    super(tempA,tempB);
    A=tempA;
    B=tempB;
  }
  void drawearthpoint()
  {
    if(run)
    {
      if(C)
      {
        stroke(0,0,100);
        fill(0,0,100);
      }
      else
      {
        stroke(0,0,255);
        fill(0,0,255);
      }
      strokeWeight (1);
      ellipse (A,B,2,2);
      line (A, B, 0, A, B, 30);
    }
  }
}
void Hug (float x,float y)
{
  float Craft=0;
  float [] hoch=new float[Dog.size ()];
  for (int i =0; i < Dog.size (); i=i+1)
  {
    attractor b = (attractor)Dog.get (i);
    hoch[i]=0;
    if(b.run)
    {
      PVector c=new PVector(b.A,b.B);
      PVector d=new PVector(x,y);
      PVector j= PVector.sub(c,d);
      float f=j.mag();
      float k=s5*f;
      float g=k+s6;
      hoch[i]=3/g;
    }
  }
  
  for (int i =0; i < Dog.size (); i=i+1)
  {
    Craft=Craft+hoch[i];
  }
  h=Craft*s4;
}

