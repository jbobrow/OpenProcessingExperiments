
int d = 0;
int dim = 10;


void setup () {
  size(480, 420);
  smooth();
  background(0);
}

void draw() {
  if (mousePressed) {
    noFill();
    stroke(random(255),random(255),mouseX,100);
    ellipse(mouseX, mouseY, dim + d, dim + d);
  }

  if (mousePressed && (mouseButton == RIGHT)) {
    background(0);
  }

  if(keyPressed) {

    if (key == 'q' || key == 'Q') {
      d = d + 1;
    }

    if (key == 'a' || key == 'A') {
      d = d - 1;
    }
    
    d = constrain(d,0,300);
    
  }
}


