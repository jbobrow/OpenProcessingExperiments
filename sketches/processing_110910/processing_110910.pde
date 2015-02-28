
// Hung Wing Chu_Charlie_52627887
// Assignment 2

void setup() {
  size(500, 500);
  background(255);
  smooth();
  
}

void draw() {
  
  if (mousePressed == true) {
    fill(255);
  } else {
    noFill();
  }
  rect(0, 0, 500, 500);
  
  for (int i = 50; i < 250; i += 10) {
    for (int j = 0; j < 300; j +=10) {
      point(i, j);
    }
  }
  
  for (int a = 270; a < 500; a += 10) {
    strokeWeight(0.01);
    stroke(170);
    line(500, a, 300, a);
  }

  noStroke();
  fill(154, 233, 237, 10);
  rect(75, 35, 200, 300);
  
  fill(255, 94, 187, 5);
  rect(180, 380, 280, 90);
  
}
  
  
  




