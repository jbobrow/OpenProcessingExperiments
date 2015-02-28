
float theta=0;
float t=40;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  for (float i=0; i<TWO_PI; i+=0.5) {
    pushMatrix();
    rotate(theta+i);
    line(0, 0, t, 0);
    for (float j=0; j<TWO_PI; j+=0.5) {
      pushMatrix();
      translate(t,0);
      rotate(-theta-j);
      line(0, 0, t, 0);
      for (float g=0; g<TWO_PI; g+=0.6){
        pushMatrix();
        translate(t,0);
        rotate(theta+g);
        line(0,t,0,0);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
    endShape();
    theta+=0.005;
  }
  void mousePressed() {
  if (mouseButton == LEFT) {
      t+=t/20;
  }
  if (mouseButton == RIGHT){
    t-=t/20;
  }
  }
