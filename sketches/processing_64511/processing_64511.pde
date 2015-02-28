
void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  line(-width, 0, width, 0);
  line(0, -height, 0, height);
  fill(0);
  textSize(32);
  if (keyPressed) {
    text(key, 0, 0);
  }
  else {
  }
}


