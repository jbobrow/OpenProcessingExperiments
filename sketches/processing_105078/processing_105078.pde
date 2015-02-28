
int x, y;
void setup() {
  size(600, 600);
  //translate(20, 50);
}
  void draw() {
    background(255);
    y=0;
    for (int k=0; k<10; k++) { //k=tateno kurikaesi no kazu
      x=0;
      for (int i=0; i<10; i++) { //i=yoko no kurikaesi no kazu
        charactor(x, y);
        x=x+mouseX; //yoko no kannkaku
      }
      y=y+mouseY; //tate no kannkaku
    }
  }

void charactor(int a, int b) {
  pushMatrix();
  translate(a,b);
  scale(0.4);
    if (mousePressed) {
      background(255);
    }

    fill(a, b, mouseX);
    stroke(a, b, 100);
    if (mousePressed) {
      fill(255, 226, 3);
    }
    ellipse(13, -30, 45, 10);
    ellipse(23, -15, 45, 10);
    ellipse(26, 0, 45, 10);
    ellipse(23, 15, 45, 10);
    ellipse(13, 30, 45, 10);
    fill(255);
    stroke(13, 255, 164);
    ellipse(0, 0, 90, 80);

    stroke(0, 0, 0);
    fill(0);
    if (mousePressed) {
      fill(232, 28, 106);
      stroke(232, 28, 106);
    }
    ellipse(5, 0, 5, 5);
    ellipse(35, 0, 5, 5);
    fill(191, 17, 17);
    stroke(191, 17, 17);
    rect(13, 10, 20, 7);
    line(13, 10, 13, 30);

    fill(a, b, mouseX);
    stroke(a, b, mouseX);
    if (mousePressed) {
      fill(255, 226, 3);
    }
    ellipse(-15, -30, 45, 10);
    ellipse(-25, -15, 45, 10);
    ellipse(-27, 0, 45, 10);
    ellipse(-25, 15, 45, 10);
    ellipse(-15, 30, 45, 10);

    if (mousePressed) {
      stroke(255, 226, 3);
      textSize(20);
      textAlign(CENTER, BOTTOM);
      line(5, 0, 600, 0);
      text("HARAHETTA---!!", 120, -30);
    }
popMatrix();
}


