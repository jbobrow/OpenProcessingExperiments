
int num = 50;
float r, inc, corner, sz;
boolean effectOn, effect=true;

void setup() {
  size(400, 400);
  rectMode(CENTER);
  r = TWO_PI/num;
}

void draw() {
  background(20);
  fill(230);

  pushMatrix();
  translate(width/2, height/2);
  rotate(inc);

  for (int i=0; i<num; i++) {
    pushMatrix();
    rotate(i*r);
    shadowRect(27+(i%5)*25, (i%4)*15, 120, sz, #eeeeee, #606060, effect);
    popMatrix();
  }
  popMatrix();
 
  corner = 50;  
  sz = map(sin(inc*4),-1,1,25,50);

  inc += 0.0523/2;
  
}

void shadowRect(float x, float y, float h, float w, color fillCol, color glowCol, boolean effectOn) {
  noFill();
  if (effectOn) {
    for (int i=0; i<5; i++) {
      strokeWeight((2+i)*(2+i));
      stroke(glowCol, 10);
      rect(x, y, w, h, corner);
    }
  }
  fill(fillCol);
  noStroke();
  rect(x, y, w, h, corner);
}

