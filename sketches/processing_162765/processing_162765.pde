
int option =1;

void setup() {
  size(300, 300);
  smooth();
  noFill();
  stroke(70, 40, 40);
}

void draw() {
  background(30);

  if (option == 1) {
    for (int x = 40; x <= width-130; x +=20) {
      for (int y = 40; y <= width-130; y +=20) {
        line(x+50, y+50, mouseX, mouseY);
      }
    }
  }

  else if (option == 2) {
    background(30);
    for (int x = 40; x <= width-130; x +=40) {
      for (int y = 40; y <= height-130; y +=40) {
        ellipse(x+50, y+50, mouseX, mouseY);
        ellipse(x+50, y+50, mouseX, mouseY);
      }
    }
  }

  else if (option == 3) {
    for (int x = 40; x <= width-130; x +=15) {
      for (int y = 40; y <= height-130; y +=15) {
        line(x+mouseX, y+mouseY, width-130, height-130);
        line(x-mouseX, y+mouseY, width-130, height-130);
      }
    }
  }
}

void mousePressed() {
  option++;
  if (option > 3) option = 1;
}

