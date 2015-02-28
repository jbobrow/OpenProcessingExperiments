
int colorChange = 255;
int colorVar = 1;
int circVar = 240;

void setup() {
  size(480, 480);
  background(0);
}

void draw() {
  fill(colorChange);
//  Draw circles
  for(int i = 0; i <= 256; i++) {
    for(int n = 0; n <=256; n++) {
//  i and n cover circles going in both directions
      ellipse(circVar + (circVar * 2 * i), circVar + (circVar * 2 * n), circVar * 2, circVar * 2);
      ellipse(circVar + (circVar * 2 * n), circVar + (circVar * 2 * i), circVar * 2, circVar * 2);
      ellipse(circVar + (circVar * 2 * i), circVar + (circVar * 2 * i), circVar * 2, circVar * 2);
      ellipse(circVar + (circVar * 2 * n), circVar + (circVar * 2 * n), circVar * 2, circVar * 2);
    }
  }
}
//Circles get smaller every click and color alternates between white and black
void mouseClicked() {
  circVar /= 2;
  if (colorVar == 1) {
    colorChange = 0;
    colorVar ++;
  }
  else {
    colorChange = 255;
    colorVar --;
  }
}

