
PImage pic; 
float radius = 1;
boolean button = false;

void setup() {
  size(300, 400);
  pic = loadImage("macau.jpg"); 
  image(pic, 0, 0, width, height);
}

void draw() {
  if (mousePressed) {
    button = true;
  } 
  else {
    button = false;
  }
  if (button) {
    for (int deg = 0; deg < 360; deg += 1) { 
      float angle = radians(deg);
      int x = int(mouseX + (cos(angle) * radius));
      int y = int(mouseY + (sin(angle) * radius));
      color c1 = get(x, y);
      stroke(c1);
      line(x, y, mouseX, mouseY);
    }
    radius++;
  }
  else {
    radius = 1;
  }
  if (keyPressed == true) {
    if (key == ' ') {
      image(pic, 0, 0, width, height);
    }
  }
}



