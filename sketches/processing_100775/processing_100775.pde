
PShape Thingy;
PImage hyrule;
float angle = 0.0;

void setup() {
  size(720, 480);
  smooth();
  strokeWeight(1);
  background(200);
  ellipseMode(RADIUS);
  Thingy = loadShape("Thingy.svg");
  hyrule = loadImage("hyrule.jpg");
}

void draw() {
  size(720, 480);
  smooth();
  strokeWeight(1);
  background(200);
  image(hyrule, 0, -20);
  ellipseMode(RADIUS);
   shape(Thingy, 30, 5);
  translate(mouseX-248,mouseY-260);
  rotate(angle);
  drawSword();
  angle = -0.2;
}

void drawSword() {
stroke(50);
fill(#B4B4B4);
rect(233, 80, 50, 180);
line(255, 100, 255, 300);
quad(258, 40, 283, 80, 255, 100, 233, 80);

stroke(50);
fill(#986402);
rect(248, 260, 20, 60);
rect(219, 257, 80, 20);
}
  


