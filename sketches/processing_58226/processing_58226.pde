

float x = 0;

void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  baton(300,20);
  x += 0.01;
}


void baton(float len, float r) {
  len *= 0.66;
  r *= 0.66;
  
  if (len > 20) {
    pushMatrix();
    rotate(x);
    line(len/2, 0, -len/2, 0);
    ellipse(len/2,0,r,r);
    ellipse(-len/2,0,r,r);
    translate(-len/2,0);
    baton(len,r);
    popMatrix();
    
    pushMatrix();
    rotate(x);
    line(len/2,0,-len/2,0);
    ellipse(len/2,0,r,r);
    ellipse(-len/2,0,r,r);
    translate(len/2,0);
    baton(len,r);
    popMatrix();
  }
}


