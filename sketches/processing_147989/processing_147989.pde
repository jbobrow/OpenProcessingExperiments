
color bg, ring1, ring2;
float ring1size, ring2size;
int ring1circles, ring2circles;

void setup() {
  size(700, 700);
  smooth();
  frameRate(30);
  bg = color(30);
  ring1 = color(255);
  ring2 = color(50, 150, 255);
  ring1size = min(height, width)/2;
  ring2size = ring1size/2;
  ring1circles = 15;
  ring2circles = 3;
}

void draw() {
  background(bg);

  noFill();
  stroke(ring1);
  strokeWeight(3);
  ellipse(width/2, height/2, ring1size, ring1size);  

  stroke(ring2);
  strokeWeight(3);
  ellipse(width/2, height/2, ring2size, ring2size);


  strokeWeight(ring1size/100);
  stroke(bg);

  // ring 1
  pushMatrix();
  translate(width/2, height/2); // 0, 0 coords of this layer in center of window
  rotate(radians(frameCount));
  fill(ring2);
  for (int i = 0; i < ring1circles; i++) {
    ellipse(ring1size/2, 0, ring1size/20, ring1size/20);
    rotate(radians(360/ring1circles));
  }
  popMatrix();

  // ring 2
  pushMatrix();
  translate(width/2, height/2); // 0, 0 coords of this layer in center of window
  rotate(radians(-frameCount));
  fill(ring1);
  for (int i = 0; i < ring2circles; i++) {
    ellipse(ring2size/2, 0, ring1size/20, ring1size/20);
    rotate(radians(360/ring2circles));
  }
  popMatrix();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    ring1circles = (int)random (3, 15);
  }
  if (mouseButton == RIGHT) {
    ring2circles = (int)random (3, 15);
  }
}

