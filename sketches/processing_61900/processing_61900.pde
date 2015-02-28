
float x;

public void setup() {
  size(500, 500);
  smooth();
  noStroke();
}

public void draw() {
  // 1, 2, 3번 모두 같은 말이다.
  // // 1번.
  // if (x < height / 2) {
  // x += 10;
  // } else if (x > height) {
  // x = 0;
  // } else {
  // x += 1;
  // }
  // // 2번.
  // if (x >= height / 2 && x <= height) {
  // x += 1;
  // } else if (x > height) {
  // x = 0;
  // } else {
  // x += 10;
  // }
  // 3번.
  if (x < height / 2 || x > height) {
    if (x < height / 2) {
      x += 10;
    } 
    else {
      x = 0;
    }
  } 
  else {
    x += 1;
  }
  fill(255, 255);
  rect(0, 0, width, height);
  fill(0);
  ellipse(x, height / 2, 100, 100);
}
