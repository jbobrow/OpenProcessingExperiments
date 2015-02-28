
PVector pos[], spd[];

//================================================================

void setup() {
  size(400, 400);
  smooth();
  rectMode(CENTER);
  colorMode(HSB);
  
  int cnt = 20;
  pos = new PVector[cnt];
  spd = new PVector[cnt];
  for (int i=0; i<cnt; i++) {
    pos[i] = new PVector(0, 0);
    spd[i] = new PVector(0, 0);
  }
}

//================================================================

void draw() {
  background(255);
  float r = 0.0;
  PVector m = new PVector(mouseX, mouseY);
  for (int i=pos.length - 1; i>=0; i--) {
    fill(255/pos.length*i, 255, 255);
    r += (sin((float)frameCount*0.01)*0.5);
    PVector v = PVector.sub(m, pos[i]);
    v.mult((float)sq(i+5)*.0001);
    spd[i].add(v);
    spd[i].mult(0.75);
    pos[i].add(spd[i]);
    pushMatrix();
      translate(pos[i].x, pos[i].y);
      rotate(r);
      rrect(0, 0, i*20, i*20, 0.25);
    popMatrix();
  }
}

//================================================================

void rrect(float posX, float posY, float szX, float szY, float cornerRatio) {
  float cornerSz = min(szX, szY)*cornerRatio;
  float k = cornerSz*4*(sqrt(2) - 1)/3; //kappa = 4*(sqrt(2) - 1)/3
  pushMatrix();
    translate(posX, posY);
    if (g.rectMode == CENTER) //
      translate(-szX/2, -szY/2);
    beginShape();
      vertex(szX - cornerSz, 0);
      bezierVertex(szX - cornerSz + k, 0, szX, cornerSz - k, szX, cornerSz); //vertex
      vertex(szX, szY - cornerSz);
      bezierVertex(szX, szY - cornerSz + k, szX - cornerSz + k, szY, szX - cornerSz, szY); //vertex
      vertex(cornerSz, szY);
      bezierVertex(cornerSz - k, szY, 0, szY - cornerSz + k, 0, szY - cornerSz); //vertex
      vertex(0, cornerSz);
      bezierVertex(0, cornerSz - k, cornerSz - k, 0, cornerSz, 0); //vertex
    endShape(CLOSE);
  popMatrix();
}

