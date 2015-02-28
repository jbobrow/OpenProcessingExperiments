

int n=100;
float[] t=new float[n];
float[] t1=new float[n];

void setup() {
  size(800, 200);
  background(255);
  for (int i=0;i<n;i++) {
    t[i]=random(1000);
    t1[i]=random(1000);
  }
}

void draw() {
  fill(255, 30);
  noStroke();
  rect(0, 0, 800, 200);
  noFill();
  strokeWeight(0.3);
  stroke(0, 60);
  translate(-150, -35);
  scale(1.5);
  //for (int i=0;i<800;i+=20) {
  waveLine();
  // }
}

void waveLine() {
  float[] nt=new float[n];
  float[] nt1=new float[n];
  beginShape(POLYGON);
  for (int i=0;i<n;i++) {
    nt[i]=map(noise(t[i]), 0., 1., 0., height);
    nt1[i]=map(noise(t1[i]), 0., 1., 0., width);
    curveVertex(nt1[i], nt[i]);
    t1[i]=t1[i]+0.0015;
    t[i]=t[i]+0.001;
  }
  endShape();
}

