
int maxCells = 200; 
float startradius = 40;
float minRadius = 5; 
 
float speed = 400;
int startTime, maxTime;
 
ArrayList Cells = new ArrayList(); 
 
void setup()
{
  size(900,600);
  background(0);
  frameRate(60); 
  noStroke();
 
  Cell C = new Cell(new PVector(width/2,height/2),null,startradius);
}
 
void metro(int maxTime)
{
    int elapsed = millis() - startTime;
    if (elapsed>maxTime)
    {
      int over = elapsed-maxTime;
      startTime=millis()-over;
      
      for (int c=0; c<Cells.size(); c++)
      {
        Cell C = (Cell) Cells.get(c); 
        if (Cells.size() < maxCells && C.radius > minRadius)
        {
          C.grow(); 
        }
      }
    }
}
 
void draw()
{
  background(178,228,15); 
  metro(int(speed));
  
  for (int c=0; c<Cells.size(); c++)
  {
    Cell C = (Cell) Cells.get(c); 
    C.render();
    //C.die(); 
  }
}
 
void mouseReleased()
{
    background(0); 
    Cells.clear(); 
    minRadius = random(5,15); 
    Cell C = new Cell(new PVector(mouseX,mouseY),null,random(startradius-5,startradius+15));
}
 
class Cell
{
  PVector pos; 
  float radius; 
 
  int child; 
  int age; 
  int maxAge = 20; 
  Cell parent; 
  
  float alpha = 0;
 
  Cell(PVector _pos, Cell _parent, float _radius)
  { 
    pos = _pos;
    parent = _parent;
    radius = _radius;
    age = 0; 
    child = 0;    
    Cells.add(this);   
  }
 
  void render ()
  {
    noStroke();
    fill(50,205-child*35,255,alpha); 
    ellipse(pos.x,pos.y,radius*2,radius*2); 
 
    if (parent == null) //  start cell (no parent)
    { 
      fill(255,alpha);
      ellipse(pos.x,pos.y,15,15); 
    }
 
    strokeWeight(1);
    stroke(255,alpha);
    
    if (parent != null)
    { 
      line(pos.x,pos.y,parent.pos.x,parent.pos.y); 
    }
 
    for  (int c=0; c<Cells.size(); c++)
    {
        
      Cell C = (Cell)  Cells.get(c);
      if (child<1)  //  last cell (no children)
      { 
        noStroke();
        fill(255,0,0,alpha/100);
        ellipse(pos.x,pos.y,5,5); 
      }
    }
    alpha += 5;
  }
 
 void grow()
 {
    float nextradius = radius*0.9; 
 
    for (int i=0; i<3; i++)
    { 
      boolean collide = false; // boolean switch for collisions
      float growAngle = int(random(8))*(PI/4); // (0, 45, 90, 135, 180, 225, 270 or 315)     
      PVector growPos = new PVector( pos.x +  cos(growAngle)*(radius+nextradius), pos.y + sin(growAngle)*(radius+nextradius)); 
      //  check collisions
      for  (int c=0; c<Cells.size(); c++)
      {
        Cell C = (Cell)  Cells.get(c);
        if (C != this  && growPos.dist(C.pos) < radius+C.radius) 
        { 
          collide = true; 
          nextradius*= 0.9; 
        }
      }
      if (! collide) 
      { 
        Cell newCell = new Cell(growPos,this,nextradius); 
        child++; 
        return; 
      }
    }
  }
 
    void die()
    {
 
      age++; 
      if (age > maxAge)
      {
        background(0); 
        Cells.clear(); 
        minRadius = random(5,15);
        Cell C = new Cell(new PVector(width/2+(random(-100,100)),height/2+(random(-100,100))),null,random(startradius-5,startradius+15)); // make new start cell
    }
  }
 
}
