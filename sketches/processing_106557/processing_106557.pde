
int x = 30
int y = 30
int dy = 1
int dx = 0
int z = 1

void setup() {
  size(250, 250);
  framerate(60);
}

void draw() {
    background(255, 255, 255);

    fill(random(255), random(255), random(255));
    ellipse(x, y, 20, 20);
    while (y = 0) {
    z = 1;
    }
    while (y = 250) {
    z = 0;
    }
    if (z = 1) {
    y = y-dy;
    }
    else {
    y = y+dy;
    }
    if (mousePressed) {
    x = mouseX;
    y = mouseY;
    }
}
