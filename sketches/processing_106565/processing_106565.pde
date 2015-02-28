
int x = 30;
int y = 30;
int dy = 1;
int dx = 0;
int z = 1;

void setup() {
  size(250, 250);
}

void draw() {
    background(255, 255, 255);

    fill(random(255), random(255), random(255));
    ellipse(x, y, 20, 20);  
    y = y+dy;
    if (y>250) {
    dy = -1
    }
    if (y<0) {
    dy = 1
    }
    if (mousePressed) {
    x = mouseX;
    y = mouseY;
    }
}
