
//Ryan Coleman
//Project 1
//Sept 20


//Drawing basics

void setup () {
  size (500, 500);
  smooth ();
  colorMode(RGB, width, width, width, 100);
  background(0);
}

int lineOpacity = 100;
float rndHeight = random(50300);

void draw() {
  background(0);

// Set grid conditions, glowing lines

  if (lineOpacity >= 0) {
    strokeWeight(6);
    stroke(115, 210, 55, lineOpacity);
    for (int i = 100; i <= width-100; i += 100) {
      for (int y = 100; y <= height-100; y += 100) {
        frameRate(25);
        line (i, 0, i, height);
        line (0, y, width, y);
      }
    }
  }

  if (lineOpacity == 0) {
    lineOpacity = 100;
  }
  lineOpacity--;

  for (int i = 100; i <= width-100; i += 100) {
    for (int y = 100; y <= height-100; y += 100) {

      strokeWeight(4);
      stroke (200, 8);
      line (i, 0, i, height);
      line (0, y, width, y);
    }
  }

//Background shapes

  if (mousePressed) {
    frameRate(1);
    for (int Lx = 25; Lx <= width; Lx += 100) {
      for (int Ly = 25; Ly <= height; Ly += 100) {
        if (mousePressed) {
          if (mouseX < 250) {
            if (mouseY < 250) {
              noStroke();
              fill(random(width), 0, random(width), random(0, 50));
              rect (Lx, Ly, 50, 50);
            }
          }
        }
      }
    }
  }
}


