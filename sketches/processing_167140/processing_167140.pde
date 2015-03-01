
// This sketch is modified based on this flocking sketch
//http://www.openprocessing.org/sketch/48729
//Still cannot get many parts

ArrayList cells = new ArrayList();
//From Reference: An ArrayList stores a variable number of objects. This is similar to making an array of objects, but with an ArrayList, items can be easily added and removed from the ArrayList and it is resized dynamically. This can be very convenient, but it's slower than making an array of objects when using many elements. Note that for resizable lists of integers, floats, and Strings, you can use the Processing classes IntList, FloatList, and StringList.
Cells cc;
int amount = 500;
float vinit = 4.0;
float vmax = vinit*5;
float timeStep = 0.3;
float range = 18;
float lenA = 8;
float lenB = 6;
void setup()
{
  size(400, 600);
  background(255);
  smooth();


  for (int i=0; i<amount; i++)
  {
    int type = (random(10)<8) ? 1 : 2;
    cells.add(new Cells(type, random(width), random(height), random(2*PI)));
  }
}

void draw()
{
  background(0);

  for (int i=0; i<cells.size(); i++)
  {
    cc = (Cells) cells.get(i);
    cc.update();
    cc.display();
  }
  cc.interact();
}
class Cells 
{
  
  int type;
  PVector pos;
  color c;
  float l;
  float t;
  PVector r;
  PVector v;
   
  Cells(int _type, float _x, float _y, float _t)
  {
    type = _type;
    pos = new PVector(_x, _y);
    t = _t;
     
    if (type == 1)
    {  c = (255);
       l = lenA;  }   
    if (type == 2)
    {  c = (150);
       l = lenB;  }
        
    r = new PVector(l*cos(t), l*sin(t));
    v = new PVector(vinit*cos(t), vinit*sin(t));
  }
  
  void interact()
{
  Cells cellA;
  Cells cellB;
  PVector pab;
  PVector pabnorm;
  float d;
   
  for (int i=0; i<cells.size(); i++)
  {
    cellA = (Cells) cells.get(i);
    for (int j=i+1; j<cells.size(); j++)
    {
      cellB = (Cells) cells.get(j);
      pab = PVector.sub(cellB.pos, cellA.pos);
      d = pab.mag();
       
      if (d < range)
      {
        pab.normalize();//??? what is this
        if (d < 8)  {  d = 8;  }
        cellA.v.add(PVector.sub(PVector.div(pab.cross(cellA.r).cross(pab),d*cellA.l), pab));
        cellB.v.add(PVector.add(PVector.div(pab.cross(cellB.r).cross(pab),d*cellB.l), pab));
   
    } 
    }
  }
}
   
  void update()
  {
    pos.add(PVector.mult(v, timeStep));
    t = atan((v.y)/(v.x));
    r.x = l*cos(t);
    r.y = l*sin(t);
    if (v.mag() > vmax)
    {  v.mult(0.8);  }
    if (pos.x < 0) 
    {  pos.x += width;  }
    if (pos.y < 0) 
    {  pos.y += height;  }
    if (pos.x > width) 
    {  pos.x -= width;  }
    if (pos.y > height) 
    {  pos.y -= height;  }
    
  }
  
  void display(){
     
    strokeWeight(1);
    stroke(c);
    float a = l*cos(t)/3.0;
    float b = l*sin(t)/3.0;
    line(pos.x-a,pos.y-b, pos.x+a,pos.y+b);
  }
}





