



Polygon pent = new Polygon(new PVector(200,200), 50, 50, 5);
Polygon tri = new Polygon(new PVector(300,300), 50, 50, 3);
Polygon hexagon = new Polygon(new PVector(500,400), 50, 50, 6);

PVector axis1 = new PVector(1, -1);
PVector axis2 = new PVector(1, 1);

//ArrayList<Bool> cs = new ArrayList<Bool>();
boolean[] cs = new boolean[pent.sides + tri.sides];

ArrayList<Polygon> polygons = new ArrayList<Polygon>();

void setup()
{
  size(800, 480);

  polygons.add(pent);
  polygons.add(tri);
  polygons.add(hexagon);
  
}


void draw()
{
  background(0); 

  //UPDATE
//  box1.position = new PVector(mouseX, mouseY);
//  box1.Update();
//  box2.Update();
//  box1.rotation += .01;
  //box2.rotation -= .01;
  pent.position = new PVector(mouseX, mouseY);
  for (Polygon p: polygons) p.Update();  //pent.rotation += .01;
  CheckCollision();
 



  //DRAW

  for (Polygon p: polygons) p.draw();
}

void CheckCollision() {
  for (Polygon p1: polygons) {
    for (Polygon p2: polygons) {
      // Don't check if p1 and p2 are the same polygon:
      // Don't check if p2 has already been checked against every other polygon (including p1):
      if (p2.doneChecking == false && p1 != p2) {
        if (CheckOverlapAlongAllNormals(p1, p2)) {
          p1.colliding = true;
          p2.colliding = true;
        }
      }
    }
    p1.doneChecking = true;
  }
}
boolean CheckOverlapAlongAllNormals(Polygon p1, Polygon p2) {
  // Check for gap along any of p1's normals:
  for (PVector n : p1.ns) {
    MinMax mm1 = p1.projectAlongAxis(n);
    MinMax mm2 = p2.projectAlongAxis(n);

    if (mm2.min > mm1.max || mm1.min > mm2.max) return false;
  }
  // Check for gap along any of p2's normals:
  for (PVector n : p2.ns) {
    MinMax mm1 = p1.projectAlongAxis(n);
    MinMax mm2 = p2.projectAlongAxis(n);

    if (mm2.min > mm1.max || mm1.min > mm2.max) return false;
  }
  return true;
}

class OBB
{
  PMatrix2D matrix = new PMatrix2D();
  PVector position = new PVector();
  float rotation = 0;

  float halfW = 0;
  float halfH = 0;

  PVector tp1 = new PVector();
  PVector tp2 = new PVector();
  PVector tp3 = new PVector();
  PVector tp4 = new PVector();

  PVector n1 = new PVector();
  PVector n2 = new PVector();
  PVector n3 = new PVector();
  PVector n4 = new PVector();

  boolean colliding = false;


  OBB(PVector pos, float halfW, float halfH)
  {
    position = pos;
    this.halfW = halfW;
    this.halfH = halfH;
  }


  void Update()
  {
    matrix.reset();
    matrix.translate(position.x, position.y);
    matrix.rotate(rotation);

    //getting the translated points of the corners of our box
    matrix.mult(new PVector(-halfW, -halfH), tp1);
    matrix.mult(new PVector( halfW, -halfH), tp2);
    matrix.mult(new PVector( halfW, halfH), tp3);
    matrix.mult(new PVector(-halfW, halfH), tp4);
    
    n1 = new PVector(tp1.y - tp2.y, tp2.x - tp1.x);
    n2 = new PVector(tp2.y - tp3.y, tp3.x - tp2.x);
    n3 = new PVector(tp3.y - tp4.y, tp4.x - tp3.x);
    n4 = new PVector(tp4.y - tp1.y, tp1.x - tp4.x);
    
    n1.normalize();
    n2.normalize();
    n3.normalize();
    n4.normalize();
    
  }

  void draw()
  {
    if (colliding) fill(255, 0, 0);
    else fill(255);

    noStroke();

    beginShape();
    vertex(tp1.x, tp1.y);
    vertex(tp2.x, tp2.y);
    vertex(tp3.x, tp3.y);
    vertex(tp4.x, tp4.y);
    endShape();
  }


  MinMax projectAlongAxis(PVector axis)
  {
    MinMax mm = new MinMax();

    float d1 = tp1.dot(axis);
    float d2 = tp2.dot(axis);
    float d3 = tp3.dot(axis);
    float d4 = tp4.dot(axis);
    float d5 = position.dot(axis);

    mm.min = d1;
    mm.max = d1;
    mm.center = d5;

    if (d2 < mm.min) mm.min = d2;
    if (d3 < mm.min) mm.min = d3;
    if (d4 < mm.min) mm.min = d4;


    if (d2 > mm.max) mm.max = d2;
    if (d3 > mm.max) mm.max = d3;
    if (d4 > mm.max) mm.max = d4;
    return mm;
  }
}



class Polygon
{
  PMatrix2D matrix = new PMatrix2D();
  PVector position = new PVector();
  float rotation = 0;

  float halfW = 0;
  float halfH = 0;

  int sides = 3;
  float angle = 90;
  int counter = 0;
  ArrayList<PVector> mps = new ArrayList<PVector>();
  ArrayList<PVector> tps = new ArrayList<PVector>();
  ArrayList<PVector> ns = new ArrayList<PVector>();


  boolean doneChecking = false;
  PVector previousPosition = new PVector();
  float previousRotation = 0;
  boolean sleeping = false;
  boolean colliding = false;

  Polygon(PVector pos, float halfW, float halfH, int sides)
  {
    position = pos;
    this.halfW = halfW; 
    this.halfH = halfW;
    if (sides > 2) this.sides = sides;
    else this.sides = 4;

    angle = (2*PI) / sides;

    for (int i = 0; i < sides; i++)
    {
      float tempAngle = i * angle;
      mps.add(new PVector( halfW *cos(tempAngle), halfH * sin(tempAngle)));
      tps.add(new PVector());
      ns.add(new PVector());
      
    }
  }


  
  void Update()
  { 
    doneChecking = false;
    colliding = false;
    sleeping = false;
    
    if (previousRotation == rotation && previousPosition.x == position.x && previousPosition.y == position.y) {
      sleeping = true;
      return;
    }
    previousPosition = position.get();
    previousRotation = rotation;
    
    
    counter = 0;
    matrix.reset();
    matrix.translate(position.x, position.y);
    matrix.rotate(rotation);

   
    
    for (int i = 0; i < mps.size(); i++) {
      matrix.mult(mps.get(i), tps.get(i));
    }

    int a = 0;
    int b = 0;
    
    //normalize
    ns = new ArrayList<PVector>();

    for (int i = 0; i < tps.size(); i++) {
      int j = i + 1;
      if (i >= tps.size() - 1) j = 0;
      PVector n = new PVector(tps.get(i).y - tps.get(j).y, tps.get(j).x - tps.get(i).x); 
      ns.add(n);
    }
  }
  
  
  void draw()
  {
    
    for (PVector n: ns) 
    {
      if (!sleeping) n.normalize(); // inefficient!
      stroke(255, 0,0 );
      PVector pp = PVector.mult(n, -100);
      pp.add(position);
      line(position.x, position.y, pp.x, pp.y);
    }
    
    fill(255);
    if (sleeping) fill(128);
    if (colliding) fill(255, 0, 0);
    noStroke();
    
    beginShape();
    for (PVector tp : tps)
    {
      vertex(tp.x, tp.y);
    }
    endShape();
    
    
    
  }
  
  MinMax projectAlongAxis(PVector axis)
  {
    MinMax mm = new MinMax();

    int i = 0;
    for (PVector tp : tps) {
      float d = tp.dot(axis);
      if (i == 0) {
        mm.min = d;
        mm.max = d;
      } 
      else {
        if (d < mm.min) mm.min = d;
        if (d > mm.max) mm.max = d;
      }
      i++;
    }
    return mm;
    
    
  }
}

class MinMax
{
  float min = 0;
  float max = 0;
  float center =0;
}




