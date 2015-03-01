
void setup () {
  size(600, 600, P3D);
  background(255);
}

void draw () {
  title();

  translate(random(width), random(height), random(-1000));
  noFill();
  strokeWeight(random(2));
  stroke(0);
  box(random(100));


  if (keyPressed) {
    setup();
  }
}

void title() { 
  fill(127);
  textAlign(RIGHT);
  text("JEONG Hyeri, Untitled, Dynamic Media, 2014", width-50, height-20);
}

