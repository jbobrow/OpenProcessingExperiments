
import fisica.util.nonconvex.*;
import fisica.*;
int m=10;
FWorld mundo;
FPoly crea_pierna() {
  FPoly p = new FPoly();
  p.vertex(-m, -m);
  p.vertex( m, -m);
  p.vertex( m, m*2);
  p.vertex( m*2, m*2);
  p.vertex( m*2, m*3);
  p.vertex(-m, m*3);
  return p;
}

FPoly crea_body() {
  FPoly b = new FPoly();
  b.vertex(-m*2, -m*2);
  b.vertex( m*2, -m*2);
  b.vertex( m*2, m*4);
  b.vertex( -m*2, m*4);
  return b;
}

FPoly crea_mano() {
  FPoly c = new FPoly();
 c.vertex(-m/2, -m*2);
 c.vertex( m/2, -m*2);
  c.vertex( m/2, m*2);
c.vertex( -m/2, m*2);
  return c;
}
void setup() {
  size(400, 400);
  smooth();

  Fisica.init(this);

  mundo = new FWorld();

 // Construyo la caja
  FPoly p1 = crea_pierna();
  p1.setPosition(width/2-15,height/2+40);
  mundo.add(p1);
  FPoly p2 = crea_pierna();
   p2.setPosition(width/2-15,height/2+40);
  mundo.add(p2);
   FPoly b =  crea_body();
  b.setPosition(width/2,height/2);
  mundo.add(b);
   FPoly c =  crea_mano();
  c.setPosition(width/2+25,height/2);
  mundo.add(c);
  FPoly c1 =  crea_mano();
 c1.setPosition(width/2-25,height/2);
  mundo.add(c1);
   FCircle capeza = new FCircle(40);
  capeza.setPosition(width/2,height/2-40);
  mundo.add(capeza);
  
  
  FDistanceJoint pernajoin = new FDistanceJoint(b, p1);
  pernajoin.setLength(0);
  pernajoin.setAnchor1(15,40);
  pernajoin.setAnchor2(-5,-10);
  
FDistanceJoint pernajoin2 = new FDistanceJoint(b,p2);
pernajoin2.setLength(0);
  pernajoin2.setAnchor1(-15,40);
  pernajoin2.setAnchor2(-5,-10);
  



FDistanceJoint muelle3 = new FDistanceJoint(b,c);
 muelle3.setLength(0);
  muelle3.setAnchor1(20,-10);
  muelle3.setAnchor2(-5,-10);
FDistanceJoint muelle4 = new FDistanceJoint(b,c1);
muelle4.setLength(0);
  muelle4.setAnchor1(-20,-10);
  muelle4.setAnchor2(5,-10);
  
  FDistanceJoint capezajoin = new FDistanceJoint(b,capeza);
capezajoin.setLength(0);
  capezajoin.setAnchor1(0,-20);
  capezajoin.setAnchor2(5,-20);
  
  
  
//mundo.add(muelle);
//mundo.add(muelle2);
mundo.add(muelle3);
mundo.add(muelle4);
mundo.add(capezajoin);
mundo.add(pernajoin);
mundo.add(pernajoin2);

 mundo.setEdges();  
  
  
}
void draw() 
{ 
  background(255);
  mundo.step();
  mundo.drawDebug();
}



