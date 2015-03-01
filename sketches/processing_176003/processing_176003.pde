
class Hexagon
{
  float x, y;
  float newx, newy;
  float rad, inner_rad;
  int sides = 6;
  float sin_step;
  float sin_bisector;
  PVector[] outer, inner;
  PVector bisect;
  float bisect_rad;
  boolean split = false;
  Hexagon(float _x, float _y, float _r)
  {
    //set these 'offscreen'
    //so that the while loop works below.
    // while loop is what keeps these things
    //propogating onstage and not going off screen.
    newx = -10;
    newy = -10;
    x = _x;
    y = _y;
    rad = _r;
    inner_rad = rad*random(.33, .85);
    sin_step = TWO_PI/sides;
    sin_bisector = sin_step*.5;
    outer = new PVector[sides];
    inner = new PVector[sides];
    for (int i = 0; i<sides; i++)
    {
      float tx = sin(i*sin_step)*rad;
      float ty = cos(i*sin_step)*rad;
      tx+=x;
      ty+=y;
      outer[i] = new PVector(tx, ty);
      tx = sin(i*sin_step)*inner_rad;
      ty = cos(i*sin_step)*inner_rad;
 
      tx+=x;
      ty+=y;
      inner[i] = new PVector(tx, ty);
    }
    bisect = new PVector(0,0);
    bisect = PVector.mult(PVector.add(outer[0],outer[1]),.5);
    PVector center = new PVector(x,y);
    center.sub(bisect);
    bisect_rad = center.mag();
   // println("rad to bisect_rad ratio is "+bisect_rad/rad);
  }
  void display()
  {
 
    //draw the outer hexagon
    stroke(#464A55);
    noFill();
    beginShape();
    for (int i = 0; i < sides; i++)
    {
     stroke(#464A55);
      vertex(outer[i].x, outer[i].y);
      if(i%2 ==0)
      {
        stroke(#FFFFFF);
       vertex(x,y);
     
       vertex(outer[i].x,outer[i].y);
         stroke(#464A55);
       vertex(outer[i].x,outer[i].y);
      }
    }
    endShape(CLOSE);
    //draw the innter hexagon
    noStroke();
    fill(#464A55, 80);
    beginShape();
    for (int i = 0; i < sides; i++)
    {
 
      vertex(inner[i].x, inner[i].y);
    }
    endShape(CLOSE);
  }
  void addhex()
  {
    if (!split)
    {
      split = true;
      while (newx < 0 || newy < 0 || newx > width || newy > height)
      {
        float side = int(random(6));
        side = side*sin_step+sin_bisector;
        newx = x+ (sin(side)*bisect_rad*2);
        newy = y+ (cos(side)*bisect_rad*2);
      }
      add_hexagon(newx, newy, rad);
    }
  }
}
boolean saving = false;
ArrayList hexes;
int gens = 0;
int gen_limit = 1340;
float rad = 15;
void setup()
{
 
 // size(2400, 1200, PDF, "hexes.pdf");
   size(500,500,P3D);
  smooth();
  //rad = 50;
  hexes = new ArrayList();
  hexes.add(new Hexagon(width/2, height/2, rad));
  // noLoop();
  strokeWeight(1);
}
 
void draw()
{
  background(255);
  for (int i = 0; i < hexes.size (); i++)
  {
    Hexagon h = (Hexagon) hexes.get(i);
    h.display();
  }
  if (gens < gen_limit)
  {
    Hexagon h = (Hexagon) hexes.get(hexes.size()-1);
    h.addhex();
  }
 
//  if(gens >=gen_limit)
//  exit();
if(saving)
  {
    endRaw();
   // endRecord();
    exit();
  }
}
 
void add_hexagon(float _nx, float _ny, float _rad)
{
  if (gens < gen_limit)
  {
    hexes.add(new Hexagon(_nx, _ny, _rad));
 
    gens++;
   // println("making generation "+gens);
  }
  
}
void mouseReleased()
{
    hexes = new ArrayList();
    gens = 0;
    hexes.add(new Hexagon(width/2,height/2,rad));
}

