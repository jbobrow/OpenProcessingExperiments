
void setup() {
  size(800, 500);
  background(0);
  colorMode(HSB);
  frameRate(25);
  smooth();
}

float ballX=random(300, 500);
float ballY=random(200, 300);
float moveX=0;
float moveY=0;
float moveBoard=height/2-75;
int score1=0;
int score2=0;

void draw() {
  background(0);
  rect(width-15, mouseY-75, 20, 150);
  rect(-5, moveBoard, 20, 150);
  ellipse(ballX, ballY, 30, 30);
  ballX=ballX+moveX;
  ballY=ballY+moveY;
  if (ballY>height-5){
    moveY=random(-7, -10);
  }
  if (ballY<0) {
    moveY=random(7, 10);
  }
  if (ballX<=20 && ballX>=5 && moveBoard<ballY && ballY<moveBoard+150) {
     fill(random(255), 255, 255);
   if (ballY<=moveBoard+40){
     moveX=random(7, 10);
     moveY=moveY-random(3,5);
   }
   if (ballY>=moveBoard+110){
    moveX=random(7, 10);
   moveY=moveY+random(3,5); 
   }
    else{
    moveX=random(7, 10);
  }
  }
  if (ballX>=width-20 && ballX<=width-5 && mouseY-75<ballY && ballY<mouseY+75) {
   fill(random(255), 255, 255);
    if (ballY<=mouseY-35){
      moveX=random(-7, -10);
      moveY=moveY-random(3,5);
    }
    if (ballY>=mouseY+35){
     moveX=random(-7, -10); 
     moveY=moveY+random(3,5);
    }
    else {
    moveX=random(-7, -10);
    }
  }
  if (mousePressed) {
    fill(random(255), 255, 255);
  }
  if (key == CODED) {
    if (keyCode == UP) {
      moveBoard-=15;
    }
    if (keyCode == DOWN) {
      moveBoard+=15;
    }
    if (keyCode == LEFT) {
      ballX=random(300, 500);
      ballY=random(200, 300);
      if (score1<score2) {
        moveX=random(7, 10);
        moveY=random(7, 10);
      }
      if (score1>score2) {
        moveY=random(-7, -10);
        moveX=random(-7, -10);
      }
      else {
        moveX=random(-10, 10);
        moveY=random(-10, 10);
      }
    }
  }
  if (ballX>=width+5){
    moveX=4;
    moveY=0;
    if (ballX>width+20 && ballX<width+24){
     score1++;
    }
  }
  if (ballX<=-5){
    moveX=-4;
    moveY=0;
    if (ballX<-20&&ballX;>-24){
     score2++;
    }
  }

  text(score1, 40, 40);
  textSize(50);
  text(score2, width-80, 40);
}

