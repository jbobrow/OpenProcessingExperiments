
float mouseDist;

void setup() {
  size(600, 600);
}

void draw() {
  mouseDist= dist(mouseX, mouseY, width/2, height/2);
  background(150);
  if (mouseDist <= 100) {
    for (int i = 0; i<255; i++) {
      fill(random(i), random(i), random(i));
      stroke(random(i), random(i), random(i));
      ellipse(mouseX, mouseY, 25, 25);
    }
  }
  else {
    if (mouseDist <= 200) {
      for (int i=0; i<255; i++) {
        fill(random(i), random(i), random(i));
        ellipse(mouseX, mouseY, 75, 75);
      }
    }

    else {
      if (mouseDist <= 300) {
        for (int i=0; i<255; i++) {
          fill(random(i), random(i), random(i));
          ellipse(mouseX, mouseY, 125, 125);
        }
      }
      else {
        if (mouseDist <= 400) {
          for (int i=0; i<255; i++) {
            fill(random(i), random(i), random(i));
            ellipse(mouseX, mouseY, 175, 175);
          }
        }
        else {
          if (mouseDist <= 500) {
            for (int i=0; i<255; i++) {
              fill(random(i), random(i), random(i));
              ellipse(mouseX, mouseY, 225, 225);
            }
          }
          else {
            if (mouseDist <= 600) {
              for (int i=0; i<255; i++) {
                fill(random(i), random(i), random(i));
                ellipse(mouseX, mouseY, 275, 275);
              }
            }
          }
        }
      }
    }
  }
}
