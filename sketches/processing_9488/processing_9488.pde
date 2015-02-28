
/* 
** Bezier Study
**
** by Chinchbug
*/

int count = 10;  //number of bezier structures
int CPCount = 4; //number of control points per structure
Curvy curvies[];

void setup() {
  size(640,480);
  background(0);
  colorMode(HSB, 100);
  smooth();
  fill(0,5);  
  curvies = new Curvy[count];
  for(int i=0; i<count; i++) curvies[i] = new Curvy();
}

void draw() {
  noStroke();
  rect(0,0,width,height);
  for (int i=0; i<count; i++) curvies[i].drawMe();
}

class Curvy {
  ControlPoint cp[];
  float c;
  
  Curvy () {
    cp = new ControlPoint[CPCount];
    for (int i=0; i<CPCount; i++) cp[i] = new ControlPoint();
    c = random(100);
  }
  
  void drawMe() {
    stroke(c,50,100);
    c+=random(2);
    if (c>100) c=0;
    PVector temp[];
    temp = new PVector[CPCount+1];
    for (int i=0; i<CPCount; i++) {
      temp[i] = new PVector(cp[i].loc.x, cp[i].loc.y);
      temp[i].div(2);
    }
    temp[CPCount] = new PVector(cp[0].loc.x, cp[0].loc.y);
    temp[CPCount].div(2);
    for (int i=0; i<CPCount-1; i++) temp[i].add(temp[i+1]);
    temp[CPCount-1].add(temp[CPCount]);
    for (int i=0; i<CPCount-1; i++)
      bezier(temp[i].x, temp[i].y, cp[i+1].loc.x, cp[i+1].loc.y, cp[i+1].loc.x, cp[i+1].loc.y, temp[i+1].x, temp[i+1].y);    
    bezier(temp[CPCount-1].x, temp[CPCount-1].y, cp[0].loc.x, cp[0].loc.y, cp[0].loc.x, cp[0].loc.y, temp[0].x, temp[0].y);
    for (int i=0; i<CPCount; i++) cp[i].moveMe();
  }
}

class ControlPoint {
  PVector loc, vel;
  ControlPoint() {
    loc = new PVector(random(width),random(height));
    vel = new PVector(random(10)-5,random(10)-5);
    vel.limit(3);
  }
  
  void moveMe() {
    loc.add(vel);
    if ((loc.x <= 0) || (loc.x > width-2)) vel.x *= -1.0;
    if ((loc.y <= 0) || (loc.y > height-2)) vel.y *= -1.0;
  }
}

