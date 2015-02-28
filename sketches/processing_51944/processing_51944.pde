
PFont font;
int shake = 0;
int dir = 1;
float textX;
float textY;
float newX;
float newY;
float xChange = 0;
float yChange = 0;
boolean run = false;
int shakeChange = 1;
void setup() {
  size(640, 480);
  ellipseMode(CENTER);
  textX = width / 2 - 100;
  textY = height / 2 - 25;
}
void draw() {
  background(0);
  textX += (shake * dir) + xChange;
  textY += yChange;
  fill(255);
  ellipse(mouseX, mouseY, 100, 60);
  fill(0);
  font = loadFont("font.vlw");
  textFont(font, 45);
  textAlign(CENTER);
  text("FEAR", textX, textY, 200, 50);
  shake += shakeChange;
  if(shake == 2) {
    shake = 0;
    dir = -dir;
  }
  if(mouseX >= textX + 80 && mouseX <= textX + 120 &&
     mouseY >= textY + 5 && mouseY <= textY + 45) {
    mouseEnter();
  }
  fill(255);
//  beginShape();
//  vertex(textX + 80, textY + 5);
//  vertex(textX + 80, textY + 45);
//  vertex(textX + 120, textY + 45);
//  vertex(textX + 120, textY + 5);
  endShape(CLOSE);
  if(textX <= newX + 5 && textX >= newX - 5 &&
     textY <= newY + 5 && textY >= newY - 5) {
    xChange = 0;
    yChange = 0;
    shakeChange = 1;
  }
}
void mouseEnter() {
  shakeChange = 0;
  shake = 0;
  newX = int(random(0, width - 200));
  newY = int(random(0, height - 50));
  xChange = (newX - textX) / 20;
  yChange = (newY - textY) / 20;
}

