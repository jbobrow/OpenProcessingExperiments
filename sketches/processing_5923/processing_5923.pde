
int num = 100;
float maxVel = 2;
float[] x = new float[num];
float[] y = new float[num];
float[] xv = new float[num];
float[] yv = new float[num];
float distance;
float maxDistance;

void setup() {
  size(300,300);
  maxDistance = dist(0,0,width,height);
  smooth();
  stroke(0,255,0,40);
  noFill();
  strokeWeight(1);
  for (int i=0; i<num; i++) {
    x[i] = random(0,width);
    y[i] = random(0,height);
    xv[i] = random(-maxVel,maxVel);
    yv[i] = random(-maxVel,maxVel);
  }
}

void draw() {
  background(0);
  for (int i=0; i<num; i++) {
    distance = dist(mouseX,mouseY,x[i],y[i]);
    float xs = distance*1.75;
    ellipse(x[i],y[i],xs,xs);
    if ((x[i] < 0) || (x[i] > width)) {
      xv[i] *= -1;
    }
    if ((y[i] < 0) || (y[i] > height)) {
      yv[i] *= -1;
    }
    x[i] += xv[i];
    y[i] += yv[i];
  }
}


