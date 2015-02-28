
float theta=0;

void setup() {
  size(700, 700);
  background(0);
  smooth();
  colorMode(HSB);
}

void draw() {
  noStroke();
  fill(0,30);
  filter(DILATE);
  filter(BLUR,0.6);
  rect(0, 0, width, height);
  strokeWeight(1.6);
  theta+=0.2;
  int n=50;
  int kom=30;
  float angle=(2*PI)/n;
  noFill();
  stroke(230);

  translate(width/2, height/2);
  for (int j=0;j<n;j++) {
    beginShape();
    pushMatrix();
    rotate((angle*j));
    for (int i=-1;i<kom;i++) {
      float c=map(i*j, 0, 36*30, 0, 300);
      stroke(#FFEE27);
      curveVertex(sin(theta-i)*i, i*20);
    }
    endShape();
    popMatrix();
  }
}



