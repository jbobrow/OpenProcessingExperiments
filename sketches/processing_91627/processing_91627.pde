
/*

Pearlyn Lii
ID 3
12/28/13
Flocking - Particle System
___
  
Based on Jiansheng Feng's Flocking
Adjustable parameters: density, initial speed, maximum speed,
aspect ratio, interaction range, power law.
 
 */


color aqua = color(43, 191, 189);
color scarlet = color (255, 74, 74);

int amount = 260;
float vinit = 4.0;
float vmax = vinit*5;
float timeStep = 0.3;
float fRange = 18;
float lenA = 8;
float lenB = 6;

cellSystem cc;
ArrayList cells;

void setup()
{
  size(800, 800);
  background(0);
  smooth();
  cells = new ArrayList();

  for (int j=0; j<amount; j++)
  {
    int celltype = (random(10)<8) ? 1 : 2;
    cells.add(new cellSystem(celltype, random(width), random(height), random(2*PI)));
  }
}


void draw()
{
  background(0);

  for (int i=0; i<cells.size(); i++)
  {
    cc = (cellSystem) cells.get(i);
    cc.update();
    cc.display();
  }
  cc.interact();
}


class cellSystem 
{
  int type;
  PVector xy;
  color c;
  float l;
  float t;
  PVector r;
  PVector v;
   
  cellSystem(int _type, float xinit, float yinit, float tinit)
  {
    type = _type;
    xy = new PVector(xinit, yinit);
    t = tinit;
     
    if (type == 1)
    {  c = aqua;
       l = lenA;  }   
    if (type == 2)
    {  c = scarlet;
       l = lenB;  }
        
    r = new PVector(l*cos(t), l*sin(t));
    v = new PVector(vinit*cos(t), vinit*sin(t));
  }
  
  void interact()
{
  cellSystem cellA;
  cellSystem cellB;
  PVector pab;
  PVector pabnorm;
  float d;
   
  for (int i=0; i<cells.size(); i++)
  {
    cellA = (cellSystem) cells.get(i);
    for (int j=i+1; j<cells.size(); j++)
    {
      cellB = (cellSystem) cells.get(j);
      pab = PVector.sub(cellB.xy, cellA.xy);
      d = pab.mag();
       
      if (d < fRange)
      {
        pab.normalize();
        if (d < 8)  {  d = 8;  }
        cellA.v.add(PVector.sub(PVector.div(pab.cross(cellA.r).cross(pab),d*cellA.l), pab));
        cellB.v.add(PVector.add(PVector.div(pab.cross(cellB.r).cross(pab),d*cellB.l), pab));
      } 
    }
  }
}
   
  void update()
  {
    xy.add(PVector.mult(v, timeStep));
    t = atan((v.y)/(v.x));
    r.x = l*cos(t);
    r.y = l*sin(t);
    if (v.mag() > vmax)
    {  v.mult(0.8);  }
    if (xy.x < 0) 
    {  xy.x += width;  }
    if (xy.y < 0) 
    {  xy.y += height;  }
    if (xy.x > width) 
    {  xy.x -= width;  }
    if (xy.y > height) 
    {  xy.y -= height;  }
    
  }
  
  void display(){
     
    strokeWeight(5);
    stroke(c);
    float a = l*cos(t)/2.0;
    float b = l*sin(t)/2.0;
    line(xy.x-a,xy.y-b, xy.x+a,xy.y+b);
  }
}




