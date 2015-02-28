
int x, y;
int[]xx=new int[100];
int[]yy=new int[200];

void setup() {
  size(600, 600);
}

void draw() {
  background(200);
  for (int i=99; i>0; i--) {
    xx[i]=xx[i-1];
    yy[i]=yy[i-1];
  }

  xx[0]=mouseX;
  yy[0]=mouseY;

  for (int i=99; i>0; i-=30) {
    pushMatrix();
    translate(xx[i], yy[i]);
    if (mousePressed) {
      background(mouseY);
    }

    fill(232, 28, 106);
    stroke(232, 28, 106);
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

    fill(232, 28, 106);
    stroke(232, 28, 106);
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
      line(5, 0, 1200, 0);
      text("HARAHETTA---!!", 120, -30);
    }
    popMatrix();
  }
}



