
float num;

void setup() {
  size(640, 640);
  noFill();
  stroke(0, 150, 255, 65);
}

void draw() {
  fill(0, 30);
  rect(-1, -1, width+1, height+1);
  translate(width/2, height/2);
  rotate(radians(num));
  for (int i = 0; i < 2; i++) {
    float x = sin(radians(i+num)) * mouseX;
    float y = cos(radians(i+num)) * mouseY;
    noFill();
    bezier(0, 0, 0, 0, x+y, y+x, x, y);
    bezier(0, 0, 0, 0, -x+y, -y+x, -x, -y);
  }

  num += 0.5;
}



