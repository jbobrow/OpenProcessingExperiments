
float x, y, deltaX, deltaY, size3;
boolean goingLeft, goingDown;
PImage pic;
float x2, y2, deltaX2, deltaY2, size2;
PImage pic2;
int score;

void setup() {
  size(400, 400);
  pic = loadImage("Narahari.jpg");
  x = random(0, 400);
  y = random(0, 400);
  size3 = 60;
  pic2 = loadImage("Narahari.jpg");
  x2 = random(0, 400);
  y2 = random(0, 400);
  size2 = 60;
  goingLeft = false;
  goingDown = true;
  score = 0;
  fill(0, 0, 0);
  stroke(0, 0, 0);
  textSize(35);
}

void draw() {
  while((x - x2)*(x - x2) + (y - y2)*(y - y2) <= (size3)*(size3) + (size2)*(size2)) {
    edit();
    if((x - x2)*(x - x2) + (y - y2)*(y - y2) > (size3)*(size3) + (size2)*(size2)) {
      score += 1;
    }
  }
  edit();
  if(millis() > 30000) {
    noLoop();
    finishScreen();
  }
  else {
    textAlign(CENTER);
    text("Time elapsed: " + millis()/1000, 0, height - 100, width, height - 100);
  }
}

void mouseMoved() {
  float dx = mouseX - x;
  float dy = mouseY - y;
  x += (dx)/20;
  y += (dy)/20;
  if(dx > 0) {
    goingLeft = false;
  }
  else {
    goingLeft = true;
  }
  if(dy > 0) {
    goingDown = true;
  }
  else {
    goingDown = false;
  }
}

void finishScreen() {
  clear();
  background(0, 0, 0);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("Score is: " + score, width/2 - 80, height/2, width/2 + 80, height/2);
  text("Game over. You should have done better.", 0, 0, width, height/2);
}

void edit() {
  background(255, 255, 0);
  text("Score is: " + score, width/2 - 80, height/2, width/2 + 80, height/2);
  deltaX2 = random(1, 3);
  deltaY2 = random(1, 3);
  x2 += deltaX2;
  y2 += deltaY;
  if(x2 >= width) {
    x2 = -size3;
  }
  if(y2 >= height) {
    y2 = -size3;
  }
  image(pic2, x2, y2, size2, size2);
  deltaX = random(1, 3);
  deltaY = random(1, 3);
  if(x + size3 >= width) {
    goingLeft = true;
  }
  if(y + size3 >= height) {
    goingDown = false;
  }
  if(x <= 0) {
    goingLeft = false;
  }
  if(y <= 0) {
    goingDown = true;
  }
  if(goingLeft == true) {
    x -= deltaX;
  }
  else {
    x += deltaX;
  }
  if(goingDown == true) {
    y += deltaY;
  }
  else {
    y -= deltaY;
  }
  image(pic, x, y, size3, size3);
  textAlign(CENTER);
  text("Score is: " + score, width/2 - 80, height/2, width/2 + 80, height/2);
}
  


