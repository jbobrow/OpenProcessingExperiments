
int num = 260;
float r, inc;
boolean effectOn, effect;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  r = TWO_PI/num;
  //frameRate(5);
}

void draw() {
  background(20);
  fill(195);

  pushMatrix();
  translate(width/2, height/2);
  rotate(inc);

  for (int i=0; i<num; i++) {
    pushMatrix();
    rotate(i*r);
    shadowRect((i%5)*85, (i%4)*25, 10, 850, #eeeeee, #606060, effect);
    popMatrix();
  }
  popMatrix();

  inc +=0,152/2;
  
  if (frameCount%100==0) {
    effect = !effect;
  }
  
  //if (frameCount%4==0 && frameCount<281) saveFrame("image-####.gif");

}

void shadowRect(float x, float y, float h, float w, color fillCol, color glowCol, boolean effectOn) {
  noFill();
  if (effectOn) {
    for (int i=0; i<5; i++) {
      strokeWeight((2+i)*(2+i));
      stroke(glowCol, 10);
      rect(x, y, w, h);
    }
  }
  fill(fillCol);
  noStroke();
  rect(x, y, w, h);
}

