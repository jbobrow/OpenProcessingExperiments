
float a;
float u;
float r;
float s;
 
 
 
 
 
 
void setup() {
  size(800, 800);
  noStroke();
  smooth();
  background(255);
 
 
 
 
  pushMatrix();
 
  translate(width/2, height/2);
 
 
  scale(0.8+(u)*0.008);
 
 
  doit(new PVector(-width/2, 0), new PVector(-height, height/2));
 
  popMatrix();
}
 
 
void doit(PVector p1, PVector p2) {
 
  s+=0.4;
 
 
 
 
  float dist =0;
 
 
 
  dist = PVector.dist(p1, p2);
 
  r=dist;
 
  if (r>40) {
 
 
    PVector a, b, t, v;
 
    a =PVector.sub(p2, p1);
    a.mult(0.1);
 
 
 
    v=PVector.sub(p2, p1);
    v.mult(1/2);
    rotate(20);
    a.add(v);
 
 
 
    b = PVector.sub(p2, p1);
    b.mult(0.65);
    b.add(p1);
 
 
    rotate(radians(s*sin(90)));
 
    t=PVector.sub(p2, p1);
    t.mult(1/3.0);
    
    rotate(-radians(8));
    b.add(t);
 
    pushMatrix();
    translate(1, 10);
 
 
 
    if (dist<220) {
      stroke(190, r*.4);
      line(b.x, b.y, a.x, a.y);
    }
     
    fill(10+r*0.7, 200);
     
    ellipse(b.x, b.y, r*.05, r*.05);
 
    popMatrix();
 
 
    doit(a, b);
  }
 
  else {
  }
}

