
Triangle t;
int marg = 40;

void setup() {
  size(600,400);
  smooth();
  textSize(10);
  textAlign(LEFT, CENTER);
  t = new Triangle();
}

void draw() {
  background(255);
  t.check();
}

class Triangle {
  PVector posA, posB, posC;
  PVector spdA, spdB, spdC;
  Triangle() {
    posA = new PVector(random(marg, width-marg), random(marg, height-marg));
    posB = new PVector(random(marg, width-marg), random(marg, height-marg));
    posC = new PVector(random(marg, width-marg), random(marg, height-marg));
    spdA = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    spdB = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
    spdC = new PVector(random(-0.5, 0.5), random(-0.5, 0.5));
  }
  void check() {
    posA.add(spdA);
    posB.add(spdB);
    posC.add(spdC);
    if(posA.x < marg || posA.x > width-marg) spdA.x *= -1;
    if(posB.x < marg || posB.x > width-marg) spdB.x *= -1;
    if(posC.x < marg || posC.x > width-marg) spdC.x *= -1;
    if(posA.y < marg || posA.y > height-marg) spdA.y *= -1;
    if(posB.y < marg || posB.y > height-marg) spdB.y *= -1;
    if(posC.y < marg || posC.y > height-marg) spdC.y *= -1;
    
    stroke(128, 128);
    offLine(posA, posC);
    offLine(posC, posA);
    offLine(posA, posB);
    offLine(posB, posA);
    offLine(posB, posC);
    offLine(posC, posB);
    
    if (mouseOver()) 
      fill(100,255,100,64);
    else 
      fill(255,64);
      
    stroke(64);
    beginShape();
      vertex(posA.x, posA.y);
      vertex(posB.x, posB.y);
      vertex(posC.x, posC.y);
    endShape(CLOSE);
    stroke(128, 128, 255);
    line(posA.x, posA.y, mouseX, mouseY);
    
    fill(128);
    text("A", posA.x+20, posA.y);
    text("B", posB.x+20, posB.y);
    text("C", posC.x+20, posC.y);
    text("M", mouseX+20, mouseY);
  }
  
  void offLine(PVector v1, PVector v2) { 
    PVector tmp = PVector.sub(v1, v2);
    tmp.normalize();
    tmp.mult(width); 
    line(v1.x, v1.y, v1.x+tmp.x, v1.y+tmp.y);
  }
  
  boolean mouseOver() {
    stroke(220);
    //for more on the math, check out http://en.wikipedia.org/wiki/Barycentric_coordinate_system_(mathematics)
    PVector posM = new PVector(mouseX, mouseY);
    PVector AC = PVector.sub(posC, posA);
    PVector AB = PVector.sub(posB, posA);
    PVector AM = PVector.sub(posM, posA);
    float dACAC = AC.dot(AC);
    float dACAB = AC.dot(AB);
    float dACAM = AC.dot(AM);
    float dABAB = AB.dot(AB);
    float dABAM = AB.dot(AM);
    float inv = 1/(dACAC*dABAB - dACAB*dACAB);
    float u = (dABAB*dACAM - dACAB*dABAM)*inv;
    float v = (dACAC*dABAM - dACAB*dACAM)*inv;
    
    int l=1;
    fill(128);
    text("AC.mag(): "+nfc(AC.mag(),2), 15, 15*l++);
    text("AB.mag(): "+nfc(AB.mag(),2), 15, 15*l++);
    text("AM.mag(): "+nfc(AM.mag(),2), 15, 15*l++);
    text("AC•AC: "+int(dACAC), 15, 15*l++);
    text("AC•AB: "+int(dACAB), 15, 15*l++);
    text("AC•AM: "+int(dACAM), 15, 15*l++);
    text("AB•AB: "+int(dABAB), 15, 15*l++);
    text("AB•AM: "+int(dABAM), 15, 15*l++);
    text("inv: "+nfc(inv,18), 15, 15*l++);
    if(u > 0) fill(64,180,64); else fill(180,64,64);    text("u: "+nfc(u,2), 15, 15*l++);
    if(v > 0) fill(64,180,64); else fill(180,64,64);    text("v: "+nfc(v,2), 15, 15*l++);
    if(u+v < 1) fill(64,180,64); else fill(180,64,64);  text("u + v: "+nfc(u+v,2), 15, 15*l++);
    
    return (u>0 && v>0 && u + v < 1);
  }
}

