
float x;
float dx;
float y;
float dy;
float c;

int  r = 25;

void setup() {
  size(900, 450);
  smooth();
  noStroke();
  x = 0;
  dx = 1;
  y = 0;
  dy = 1;
  c = 1;
  r = 25;
}

void draw() {
  background (255);
  fill(255, x-10, y-c);
  ellipse(x, y, r*2, r*2);
  x += 5*dx;
  y += 9*dy;
  c += 20;
  if (x >=width-25) {
    dx = -1;
  }
  if (x <= 25) {
    dx = +1;
  }
  if (y >= height-25) {
    dy = -1;
  }
  if (y <= 25) {
    dy = +1;
  }
  if (mousePressed == true) {
    fill(c, c, c);
    ellipse (x, y, r, r);
    strokeWeight(3);
    stroke(255, 0, 0);
    line(mouseX, mouseY, 0, 0);
    stroke(0, 255, 0);
    line(mouseX, mouseY, width, height);
    stroke(0, 255, 0);
    line(mouseX, mouseY, 0, height);
    stroke(255, 0, 0);
    line(mouseX, mouseY, width, 0);
    stroke(0, 0, 255,128);
    line(mouseX, mouseY, width/2, height);
    stroke(0, 0, 255,128);
    line(mouseX, mouseY, width/2, 0);
    stroke(128,0,128,128);
    line(mouseX, mouseY, width, height/2);
    stroke(128,0,128,128);
    line(mouseX, mouseY, 0, height/2);
  if (mouseX > (x-r) && mouseX < (x+r) && mouseY > (y-r) && mouseY < (y+r)){
    x = random(width);
    y = random(height);
  }
  }
  noStroke();
}

