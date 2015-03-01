
float p = 4;
int n = 20;

void setup() {
  size(500, 500);
  rectMode(CENTER);
}

void draw() {
  fill(255,70);
  translate(width/2, height/2);
  noStroke();
  rect(0, 0, width, height);
  for (int i = 0; i < n; i++) {

    float theta = 360/n;
    rotate(radians(theta));
    //for (int j = 0; j < 4; j++){
    for (float x = -p*100; x < p*100; x+=p) {
      stroke(x/2,200,210);
      float y = sq(x)/mouseX+mouseY/2;
      point (x, y);
    }
  }
}

