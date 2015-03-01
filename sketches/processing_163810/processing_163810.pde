
PImage img;
PImage img2;

float x;
float y;

boolean click = false;

void setup() {
  size(500, 600);
  imageMode(CENTER);

  img = loadImage("treble-clef.png");
  img2 = loadImage("bass-clef.png");
}

void draw() {

  if (click != true) {
    drawHelloMozart();
  }

  image(img, 25, 50, 20, 60);
  image(img2, 28, 108, 20, 35);

  drawTrebleStaff(20);
  drawBassStaff(80);

  drawTrebleStaff(160);
  drawBassStaff(220);

  drawTrebleStaff(300);
  drawBassStaff(360);

  drawTrebleStaff(440);
  drawBassStaff(500);
}
void drawTrebleStaff(float x) {
  for (int i = 1; i<6; i++) {
    line(10, x+i*10, 490, x+i*10);
  }
}

void drawBassStaff(float x) {
  for (int i = 1; i<6; i++) {
    line(10, x+i*10, 490, x+i*10);
  }
}
void mousePressed() {
  drawNoteDblCrotchet(mouseX, mouseY);
}

void keyPressed() {
  background(200);
}

void drawNoteDblCrotchet(float x, float y) {
  fill(0);
  ellipse(x, y, 8, 10);
  line(x+4, y, x+4, y-25);
  ellipse(x+15, y-5, 8, 10);
  line(x+19, y-5, x+19, y-30);
  line(x+4, y-25, x+19, y-30);
}

void drawHelloMozart() {
  String s = "Yo Mozart";
  fill(0);
  textSize(30);
  text(s, 175, 140, 400, 400);
}


