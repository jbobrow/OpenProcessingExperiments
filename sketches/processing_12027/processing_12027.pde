
float x1 = 200;
float y1 = 64;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  drawFern();
}
  void drawFern(){
    drawStem();
    drawLeavesLeft();
    drawLeavesRight();
  }
  void drawStem() {
    fill(90, 55, 17);
    rect(x1, y1, 5, 295);
  }
  void drawLeavesLeft() {
    float leafL = 12;
    float leafW = 60;

    fill(36, 95, 20);
    float leafx = 200;
    float leafy = 350;
    for (int x = 0; x < 40; x++) {
      beginShape();
      vertex (leafx, leafy);
      vertex (leafx, leafy - leafL);
      vertex (leafx - leafW, leafy - leafL/2);
      leafy = leafy - leafL;
      leafW -= 1.5;
      leafL -=.25;
      endShape();
    }
  }
  void drawLeavesRight() {
    fill(36, 95, 20);
    float leafL = 12;
    float leafW = 60;
    float leafx = 205;
    float leafy = 350;
    for (int x = 0; x < 40; x++) {
      beginShape();
      vertex (leafx, leafy);
      vertex (leafx, leafy - leafL);
      vertex (leafx + leafW, leafy - leafL/2);
      leafy = leafy - leafL;
      leafW -= 1.5;
      leafL -=.25;
      endShape();
    }
  }


