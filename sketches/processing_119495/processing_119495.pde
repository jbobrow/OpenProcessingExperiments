
void setup() {
  size(500, 500);
  frameRate(20);
  noCursor();
  colorMode(HSB);
}

void draw() {
  fill(0, 75);
  noStroke();

  rect(0, 0, width, height);

  if (key == 'z') {
    stroke(random(500), 200, 150, 100);
  } 
  else { 
    stroke(random(2000), 150, 300, 80);
  }

  if (mousePressed == true) {
    background(random(0, 250));
    stroke(random(200), 100, 100, 200);
  }

  for (int i=0; i<250; i++) {
    line(random(width), random(height), random(width), random(height));
  }
}
