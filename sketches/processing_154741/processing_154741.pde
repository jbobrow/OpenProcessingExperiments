
boolean goingLeft, goingDown;
PImage pic;
float x2, y2, deltaX2, deltaY2, size2;
float prevx2, prevy2, v, rectangle, rectangle2, boxX, boxY;
PImage pic2;
int score;
int number;

void setup() {
  frameRate(40);
  size(800, 400);
  pic = loadImage("Narahari.jpg");
  x2 = 0;
  y2 = 200;
  size2 = 50;
  score = 0;
  rectangle = 140;
  rectangle2 = 140;
  boxX = width/2;
  boxY = height/2;
  number = 1;
}

void draw() {
  prevx2 = y2;
  prevy2 = x2;
  background(255, 255, 0);
  fill(0, 0, 0);
  textSize(20);
  textAlign(CENTER, CENTER);
  text("Score: " + score, 0, 0, 90, 90);
  fill(154, 205, 50);
  rect(boxX - 30, boxY - 30, 60, 60);
  fill(0, 0, 0);
  text(number, boxX, boxY);
  rect(width/2 - 70, 0, 140, rectangle);
  rect(width/2 - 70, height - rectangle2, 140, rectangle2);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  if(mousePressed == true) {
    y2 -= 15;
  }
  deltaX2 = 2;
  x2 += deltaX2;
  v = (y2 - prevy2)/(x2 - prevx2);
  y2 += v*1 + 2*1*1;
  if(x2 >= width) {
    x2 = -size2;
    score += 1;
    rectangle = random(175);
    rectangle2 = random(175);
    boxX = random(740);
    boxY = random(340);
  }
  image(pic, x2, y2, size2, size2);
  if(number == 2048) {
    clear();
    textAlign(CENTER, CENTER);
    text("YOU GOT A 2048! YOU WIN!!!", width/2, height/2);
    noLoop();
  }
  if(x2 + size2 > boxX && x2 < boxX + 60 && y2 + size2 > boxY && y2 < boxY + 60) {
    number *= 2;
    boxX = random(740);
    boxY = random(340);
    if(boxX > width/2 - 70 && boxX + 60 < width/2 + 70) {
      boxX = random(740);
      boxY = random(340);
    }
  }
  if(x2 + size2 > width/2 - 70 && x2 < width/2 + 70) {
    if(y2 < rectangle || y2 + size2 > height - rectangle2 || y2 + size2 >= height) {
      clear();
      textAlign(CENTER, CENTER);
      text("GAME OVER. SUBPAR PERFORMANCE. YOU GOT " + score + " POINTS AND REACHED " + number + ".", width/2, height/2);
      noLoop();
    }
  }
}
  


