
void setup() {
  size(800, 800);
  smooth();
  noStroke();
  frameRate(120);
}

float t = 0;
float J = 400;
float K = 400;
float R=0;
float r=0;
float F=0;

void draw() {
  r=random(.000001, .005);
  translate(J, K);
  fill(22-t, 255, 0+t);
  rotate(R*F);
  ellipse(0, 0-t, 25, 25);
  t=t+1;
  R=R+r;

  if (50-(t/5)==0) {
    ellipse(0, 0-t+10, 75, 75);
    fill(215, 142, 242);
    ellipse(0, 0-t+10, 40, 40);
    t=0;
    R=0;
    F=random(-1, 1);
    J=mouseX;
    K=mouseY;
  }
}


