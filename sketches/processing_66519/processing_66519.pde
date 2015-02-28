
PFont myFont;
int xPos;
int yPos;
int state;
int speed;

void setup() {
  size(500, 500);
  xPos = 50;
  yPos = 53;
  state = 0;
  speed = 2;

  myFont = loadFont("Monospaced-48.vlw");
  textFont(myFont, 48);
}

void draw() {
  smooth();

  background(100);
  noStroke();
  ellipseMode(CORNER);
  fill(0, 0, 255);
  ellipse(xPos, yPos, 40, 40);
  fill(255);
  rect(50, 50, 50, 50);
  rect(400, 50, 50, 50);
  rect(50, 400, 50, 50);
  rect(400, 400, 50, 50);

  if (mousePressed && mouseX >= 50 && mouseX <= 100 && mouseY >= 53 && mouseY <= 100) {
    state = 1;
  }

  if (state == 1) {
    xPos += speed;
  }

  if (xPos > 400 && yPos == 53) {
    text("SUPER!", width/2, height/2);
    state = 2;
  }

  if (state == 2) {
    fill(0,0,255);
    rect(400, 50, 50, 50);
    xPos -= speed;
    yPos += speed;
  }

  if (xPos > 50 && yPos >= 400) {
    text("AWESOME!", width/2, height/2);
    state = 3;
  }

  if (state == 3) {
    fill(0, 0, 255);
    rect(400, 50, 50, 50);
    rect(50, 400, 50, 50);
    xPos += speed;
  }

  if (xPos > 400 && yPos >= 400) {
    fill(0, 0, 255);
    rect(400, 400, 50, 50);
    noLoop();
    background(0);
  }
}

