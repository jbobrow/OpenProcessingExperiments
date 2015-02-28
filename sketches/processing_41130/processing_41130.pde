
void setup() {
  size(400, 400);
  strokeWeight(0.5);
}

void draw() {
  if (mousePressed) {
    // on click draw fear
    noStroke();
    fill(150, 30);
    rect(0, 0, width, height);
    stroke(0);
    for (int i=-200; i<=600; i=i+5) {
      line(0, 200, width, i);
    }
    for (int i=-200; i<=600; i=i+5) {
      line(width, 200, 0, i);
    }
    for (int i=-200; i<=600; i=i+5) {
      line(200, height, i, 0);
    }
    for (int i=-200; i<=600; i=i+5) {
      line(200, 0, i, width);
    }
  } 
  else {
    // draw courage
    noStroke();
    fill(180, 80);
    rect(0, 0, width, height);
    stroke(255);
    for (int i=0; i<=400; i=i+5) {
      line(200, 200, width, i);
    }
    for (int i=0; i<=400; i=i+5) {
      line(200, 200, i, 0);
    }
    for (int i=0; i<=400; i=i+5) {
      line(200, 200, 0, i);
    }
    for (int i=0; i<=400; i=i+5) {
      line(200, 200, i, height);
    }
  }
}
                
