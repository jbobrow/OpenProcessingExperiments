
float time = 0.0;
float bigness = 15;
float[][] d = new float[100][100];

void setup() {
  size(500, 500);
  rectMode(CENTER);
  background(255);
  fill(255);
  noStroke();
  smooth();
  for (int j=0;j<100;j++) {
    for (int i=0;i<100;i++) {
      d[j][i] = 0.0;
    }
  }
}
void draw() {
  background(255);
  for (int j=0;j<26;j++) {
    pushMatrix();
    translate(0, 20*j);
    for (int i=0;i<26;i++) {
      pushMatrix();
      d[j][i] += 0.1*cos(i+0.5*time);
      d[j][i] += 0.1*sin(j+0.5*time);
      rotate(time+0.1*d[j][i]);
      fill(max(255-50*d[i][j],0));
      rect(0, 0, bigness, bigness);
      popMatrix();
      translate(20, 0);
    }
    popMatrix();
  }
  time+=0.1;
}



