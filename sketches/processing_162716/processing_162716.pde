
int grid = 40;

void setup() {
  size(500, 500);
  background(57, 57, 57);

  for (int x=grid; x<=width-grid; x+=grid) {
    for (int y=grid-10; y<=height-grid; y+=grid-20) {
      noStroke();
      fill(49, 83, 139);
      rect(x, y, 13, 15, 2);
    }
  }
  for (int x2=grid; x2<=width-grid-40; x2+=grid) {
    for (int y2=grid; y2<=height-grid; y2+=grid-20) {
      noStroke();
      fill(237, 214, 120);
      rect(x2+18, y2+3, 13, 15, 3);
    }
  }
}

void draw() {
  //background(57,57,57);
  for (int x=grid; x<=width-grid; x+=grid) {
    for (int y=grid; y<=height-grid; y+=grid-20) {
      if (mouseX>x && mouseX<x+11) {
        if (mouseY>y && mouseY<y+13) {
          fill(108,146,206,100);
          ellipse(mouseX, mouseY, 9, 11);
        }
      }
    }
  }
    for (int x2=grid; x2<=width-grid-40; x2+=grid) {
    for (int y2=grid; y2<=height-grid; y2+=grid-20) {
      if (mouseX>x2+18 && mouseX<x2+30) {
        if (mouseY>y2+4 && mouseY<y2+19) {
          fill(57,57,57,100);
          ellipse(mouseX, mouseY, 9, 11);
        }
      }
    }
  }
}



