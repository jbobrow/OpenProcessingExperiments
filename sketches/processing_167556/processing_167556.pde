
int sz = 20;
float pos = 0;
float speed = 5;


void setup() {
  size(400, 300);
}

void draw() {
  background(0);

  if (pos < mouseX) {
    pos = pos + speed;
  } 
  else {
    pos = mouseX;
  }

  if (mouseY < height/2) {
    fill(255, 0, 0);
  } 
  else {
    fill(0, 255, 0);
  }
  noStroke();
  ellipse(pos, height/2, sz, sz);

  stroke(255);
  line(mouseX, 0, mouseX, width);
  line(0, height/2, width, height/2);
}

