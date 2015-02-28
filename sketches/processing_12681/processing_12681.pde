
// Concept taken from the "Same Side Technique" example on this site:
// http://www.blackpawn.com/texts/pointinpoly/default.html

PVector p1, p2, a, b, c, cp1, cp2, p;

void setup() {
  smooth();
  p1 = new PVector(40, 20);
  p2 = new PVector(25, 50);
  a = new PVector(20,50);
  b = new PVector(50,10);
  c = new PVector(90,90);
  p = new PVector(mouseX,mouseY);
}

void draw() {
  background(128);
  p.set(mouseX,mouseY,0);
  triangle(a.x,a.y,b.x,b.y,c.x,c.y);
  PointInTriangle(p, a, b, c);
}

boolean SameSide(PVector p1, PVector p2, PVector a, PVector b) {
  b = PVector.sub(b,a);
  p1 = PVector.sub(p1,a);
  p2 = PVector.sub(p2,a);
 
  cp1 = b.cross(p1);
  cp2 = b.cross(p2);

  if ((cp1.dot(cp2)) >= 0) {
    return true;
  }
  else
    return false;
}

boolean PointInTriangle(PVector p,PVector a,PVector b,PVector c) {
  if (SameSide(p,a, b,c) && SameSide(p,b, a,c) && SameSide(p,c, a,b)) {
    fill(255,0,0);
    return true;
  }
  else
    fill(255,255,255);
  return false;
}


