
void setup(){
  size(1000,1000,P3D);
  smooth();
  frameRate(10);
}

void draw(){
  PVector l = new PVector(0,0,1);
  PVector a = new PVector(mouseX, mouseY, random(100));
  PVector r = new PVector(random(100),random(100),random(100));
  PVector s = new PVector(random(100),random(100),random(100));
  
  PVector c = r.cross(s);
  float size = c.mag();
  c.div(size);
  float brightness = c.dot(l);
  
  fill(brightness*255, 100,0);
  beginShape();
  vertex(a.x,a.y,a.z);
  vertex(a.x+r.x,a.y+r.y,a.z+r.z);
  vertex(a.x+s.x,a.y+s.y,a.z+s.z);
  endShape();
}
