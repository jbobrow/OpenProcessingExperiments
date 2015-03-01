
int particles=4000;
float[] x=new float[particles];
float[] y=new float[particles];
float theta=0;
float r;

void setup() {
  size(500, 500);
  background(0);

  for (int i=0; i<particles; i++) {
    x[i]=random(width);
    y[i]=random(height);
    }
  //  smooth(8);
}

void draw() {
  background(0);
  theta+=.03;
  rectMode(CENTER);
  for (int i=0; i<particles; i++) {
    strokeWeight(1.5);
    stroke(0);
    fill(#FFFFFF);
    pushMatrix();
    translate(x[i], y[i]);

    float d=map(dist(x[i], y[i], width/2, height/2), 0, width/2, -PI, PI);
    rotate(sin(theta-d));
    r=80+sin(theta-i)*40;
    rect(0, 0, 3, r);
    popMatrix();
  }
  if (frameCount%3==0) {
//    saveFrame();
  }
}

