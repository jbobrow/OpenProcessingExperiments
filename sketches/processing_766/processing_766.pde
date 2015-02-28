
float x = 0.0;
float y = 0.0;

void setup() {
 size(200,200);
 stroke(255,255,255,0);
 background(192,64,0);
}

void draw() {
    line(x,y, mouseX, mouseY);
}

void mousePressed() {
  stroke(random(255),random(255),random(255),random(10,255));
  if (mouseButton == RIGHT) {
    x = random(width);
    y = random(height);
  }
  else {
    x = mouseX;
    y = mouseY;
  }
}

