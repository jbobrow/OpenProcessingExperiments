
/*
  Dec. 28, 2011    Jiansheng Feng...
  
  Adjustable parameters: density, initial speed, maximum speed, 
  aspect ratio, interaction range, power law...
*/


color Cerulean = color(29, 172, 214);
color Fuchsia = color (195, 100, 197);

int SizeX = 200;
int SizeY = 200;
color BackgroundColor = color(200);

int NumCells = 160;
float vinit = 2.0;
float vmax = vinit*3;
float TimeStep = 0.3;
float fRange = 18;
float lenA = 8;
float lenB = 6;

RLC cC;
ArrayList Cells;


void setup()
{
  size(SizeX, SizeY);
  background(BackgroundColor);
  smooth();
  Cells = new ArrayList();
  
  for (int j=0; j<NumCells; j++)
  { 
    int celltype = (random(10)<8) ? 1 : 2;
    Cells.add(new RLC(celltype, random(SizeX), random(SizeY), random(2*PI)));
  }
}


void draw()
{
  interact();
  
  background(BackgroundColor);
  
  for (int i=0; i<Cells.size(); i++)
  { 
    cC = (RLC) Cells.get(i);
    cC.gogo();
  }
}


void interact()
{
  RLC cellA;
  RLC cellB;
  PVector pAB;
  PVector pABnorm;
  float d;
  
  for (int i=0; i<Cells.size(); i++)
  {
    cellA = (RLC) Cells.get(i);
    for (int j=i+1; j<Cells.size(); j++)
    {
      cellB = (RLC) Cells.get(j);
      pAB = PVector.sub(cellB.XY, cellA.XY);
      d = pAB.mag();
      
      if (d < fRange)
      {
        pAB.normalize();
        if (d < 8)  {  d = 8;  }
        cellA.v.add(PVector.sub(PVector.div(pAB.cross(cellA.r).cross(pAB),d*cellA.L), pAB));
        cellB.v.add(PVector.add(PVector.div(pAB.cross(cellB.r).cross(pAB),d*cellB.L), pAB));
      }  
    }
  }
}


class RLC  // rod-like cell
{
  int Type;
  PVector XY;
  color C;
  float L;
  float t;
  PVector r;
  PVector v;
  
  RLC(int tempType, float Xinit, float Yinit, float tinit)
  {
    Type = tempType;
    XY = new PVector(Xinit, Yinit);
    t = tinit;
    
    if (Type == 1)
    {  C = Cerulean;
       L = lenA;  }    
    if (Type == 2)
    {  C = Fuchsia;
       L = lenB;  }
       
    r = new PVector(L*cos(t), L*sin(t)); 
    v = new PVector(vinit*cos(t), vinit*sin(t));
  }
  
  void gogo()
  {
    XY.add(PVector.mult(v, TimeStep));
    t = atan((v.y)/(v.x));
    r.x = L*cos(t);
    r.y = L*sin(t);
    if (v.mag() > vmax)
    {  v.mult(0.8);  }
    if (XY.x < 0)  
    {  XY.x += SizeX;  }
    if (XY.y < 0)  
    {  XY.y += SizeY;  } 
    if (XY.x > SizeX)  
    {  XY.x -= SizeX;  }
    if (XY.y > SizeY)  
    {  XY.y -= SizeY;  }
    
    strokeWeight(3);
    stroke(C);
    float a = L*cos(t)/2.0;
    float b = L*sin(t)/2.0;
    line(XY.x-a,XY.y-b, XY.x+a,XY.y+b);
  }
}



                
                                                                                                                                                                
