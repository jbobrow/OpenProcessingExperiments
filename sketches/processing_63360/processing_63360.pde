
int x = 400;
int y = 500;
int xc = 10;
int yc = 10;

void setup() {
  size (800, 500);
  background (20, 25, 50);
  stroke (random (255), random(255), random(255));
  smooth();
  frameRate(8);
}

void draw() {
fill (random (255), random(255), random(255));
arc(0, 0, 300, 300, 0, 1);
curve(140, 0, 140, 0, 80, 125, 20, 50);
stroke(random (255), random(255), random(255));

x = x + 50;

line(0,0, x, y);

point(150, 200);
point(150, 220);
point(150, 240);
point(150, 260);
point(150, 280);
point(150, 300);
point(150, 320);
point(150, 340);
point(150, 360);
point(150, 380);

fill(random (255), random(255), random(255), 80);
rotate(random(360));
quad(170, 200, 350, 200, 170, 380, 350, 380);
rect(425, 200, 20, 180);
triangle(300, 290, 390, 200, 390, 380);
colorMode(RGB);
noFill();
stroke(random (255), random(255), random(255));

ellipse(400,250,xc+random(600),yc+random(600));
}

