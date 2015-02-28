
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  colorMode(HSB, 100);
  noLoop();
}

void draw() {
  //背景の緑
    for (int i = 0; i < 400; i++) {
    pushMatrix();
    translate(random(width), random(330, 400));
    rotate(random(PI));
    fill(40, 100, 100, 30);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
  //薄い緑
  for(int i = 0; i < 600; i++) {
    pushMatrix();
    translate(random(width), random(400, 500));
    fill(44, random(40, 100), 100, 70);
    ellipse(0, 0, 50, 50);
    popMatrix();
  }
  //赤
  for(int i = 0; i <800; i++) {
    pushMatrix();
    translate(random(width), random(350));
    fill(random(0, 3), 100, 100, 30);
    ellipse(0, 0, 40, 40);
    fill(0, 0, 100, 10);
    ellipse(0, 0, 40, 40);
    popMatrix();
  }
  //種
  for(int i= 0; i < 27; i++) {
    pushMatrix();
    translate(random(width), random(350));
    fill(random(85, 100), 0, 0, 80);
    rotate(random(PI/6));
    ellipse(0, 0, 8, 18);
    popMatrix();
}
}


