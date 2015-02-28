
int n=10;
float[] t=new float[n];
float[] t1=new float[n];
float[] x=new float[n];

void setup() {
  size(800, 200);
  background(255);
  for (int i=0;i<n;i++) {
    t[i]=random(1000);
    t1[i]=random(1000);
    x[i]=i*(width/n);
  }
}

void draw() {
if(mousePressed){
  fill(255);
  noStroke();
  rect(0, 0, 800, 200);
  }
  noFill();
  strokeWeight(0.5);
  for (int i=0;i<n;i++) {
    if (i>=n) {
      i=0;
    }
    stroke(map(mouseX, 0, 800, 0, 255), i*20, mouseY, i*20);
  }
  translate(-150, -35);
  scale(1.5); 
  waveLine();
}

void waveLine() {
  float[] nt=new float[n];
  float[] nt1=new float[n];
  beginShape(POLYGON);
  for (int i=0;i<n;i++) {
    nt[i]=map(noise(t[i]), 0., 1., 0., height);
    nt1[i]=map(noise(t1[i]), 0., 1., 0., width);
    curveVertex(x[i], nt[i]);
    t1[i]=t1[i]+0.004;
    t[i]=t[i]+0.003;
  }
  endShape();
}

