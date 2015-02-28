
class Vert
{
  PVector pos;
  boolean used=false;
  Vert(float x, float y){pos = new PVector(x,y);}
}

Spring Img2Spring(PImage img, int startVertex,boolean makeClosed, int everyNth)
{
  // create ArrayList of black pixels
  int count=0;
   Vert V;
   ArrayList Points,sorted;
   img.loadPixels();
   Points = new ArrayList();
   for(int j=0;j<img.height;j++) for (int i=0;i<img.width;i++)
   {
     if (img.pixels[j*img.width+i]==color(0))         Points.add(new Vert(i,j));
   }
  sorted = new ArrayList();
  sorted = SortVert(Points,startVertex);
  Spring S;
  S = new Spring();
  PVector center=new PVector(mouseX-img.width/2,mouseY-img.height/2);
    
  V = (Vert) sorted.get(0);
  S.firstPoint(PVector.add(center,V.pos));
  for (int i=1;i<sorted.size()-1;i++)
  {
    V = (Vert) sorted.get(i);
    if(i%everyNth==0) S.addPoint(PVector.add(center,V.pos));
  }
  V = (Vert) sorted.get(sorted.size()-1);
  S.lastPoint(PVector.add(center,V.pos),makeClosed);
  return S;
}

ArrayList SortVert(ArrayList Unsorted, int start)
  {
    Vert V,VT,BV;
    ArrayList Sorted;
    float mind,d;
    Sorted = new ArrayList();
    V = (Vert) Unsorted.get(start);
    Sorted.add(V);
    V.used=true;
    while (Sorted.size()<Unsorted.size())
      {
        mind=100000000;
        V=(Vert) Sorted.get(Sorted.size()-1);
        BV=V;
        for (int i=0;i<Unsorted.size();i++)
          {
            VT = (Vert) Unsorted.get(i);
            if (!VT.used)
              {
                d = V.pos.dist(VT.pos);
                if (d<mind)
                  {
                    mind=d;
                    BV=VT;
                  }
              }
          }
         BV.used=true;
         Sorted.add(BV);
      }
    return Sorted;
  }

