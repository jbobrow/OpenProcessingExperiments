
ArrayList Dog=new ArrayList();
float h;
PVector Craft;
class attractor {
  float A, B;
  int counterChilds;
  attractor(float tempA, float tempB)
  {
    A=tempA;
    B=tempB;
  }
  void drawattractor()
  {
    strokeWeight (2);
    stroke(255,0,0);
    fill(255,0,0);
    ellipse (A,B,2,2);
    line (A, B, 0, A, B, 50);
  }
}

void Hug (float x,float y)
{
  float Craft=0;
  float [] hoch=new float[Dog.size ()];
  for (int i =0; i < Dog.size (); i=i+1)
  {
    attractor b = (attractor)Dog.get (i);
    PVector c=new PVector(b.A/s7*10,b.B/s7*10);
    PVector d=new PVector(x,y);
    PVector j= PVector.sub(c,d);
    float f=j.mag();
    float k=s5*f;
    float g=k+s6;
    //print(f);
    hoch[i]=3/g;

  }
  for (int i =0; i < Dog.size (); i=i+1)
  {
    Craft=Craft+hoch[i];
  }
  h=Craft*s4;
}

