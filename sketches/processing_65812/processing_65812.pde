
float r=150;

void setup() {
  size(300, 300);
  background(0);
  noFill();
  stroke(0, 255, 0);
  //smooth();
}

void draw() {
  translate(width/2,height/2);
  drawSpirograph(8);
}
void drawSpirograph(float iterations){
  int rotations=0;
  for (float n=2;n>=.25;n-=.25) {
    ellipse(0, 0, r*2, r*n);
    if (n==.25 && rotations<iterations) {
      n=2;
      rotate(TWO_PI/iterations);
      rotations+=1;
    }
  }
}

