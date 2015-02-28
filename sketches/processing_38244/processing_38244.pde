
Ball myBall1;//ball
//player1
//player2
Brick pBrick1;//brick1
Brick pBrick2;//brick2
int brickLength = 60;
int scoreP1 = 0;//player 1 score
int scoreP2 = 0;//player 2 score
int current_position_p1 = 185; //current position of brick 1
int current_position_p2 = 185; //current position of brick 2
int ball_speed = 3;

void setup() {
  size(600, 400);
  myBall1 = new Ball();

  pBrick1 = new Brick(50, current_position_p1);
  pBrick2 = new Brick(550, current_position_p2);
}
void draw() {
  background(0);
  text("player 1: "+ scoreP1, 10, 15);
  text("player 2: "+ scoreP2, 500, 15);
  text("coded by David Woo | Player1: key 'A' and 'Z' | player2: key 'K' and 'M' | have fun!!",10,390);
  myBall1.start();
  pBrick1.display(current_position_p1);
  pBrick2.display(current_position_p2);
}
void keyPressed() {
  if (key == 'a') {
    if (current_position_p1 <=0)
      current_position_p1 = 0;
    else current_position_p1 -=20;
    pBrick1.display(current_position_p1);
  }
  else if (key == 'z') {
    if (current_position_p1 >=340)
      current_position_p1 = 340;
    else current_position_p1 +=20;
    pBrick1.display(current_position_p1);
  }
  if (key == 'k') {
    if (current_position_p2 <=0)
      current_position_p2 = 0;
    else current_position_p2 -=20;
    pBrick2.display(current_position_p2);
  }
  else if (key == 'm') {
    if (current_position_p2 >=340)
      current_position_p2 = 340;
    else current_position_p2 +=20;
    pBrick2.display(current_position_p2);
  }
}
class Ball {
  int speedX = +ball_speed;
  int speedY = +ball_speed;
  int runX =300;
  int runY = 200;


  void display() {
    //at start
    smooth();
    noStroke();
    ellipse(300, 200, 10, 10);
  }
  void start() {
    runX += speedX;
    runY += speedY;
    smooth();
    noStroke();
    ellipse(runX, runY, 15, 15);
    if (runX>=601) {
      scoreP1++;
      background(0,0,255);
      speedX = -ball_speed;
      //start();
      
      
    } 
    else if (runX <=-1) {
      scoreP2++;
      background(255,0,0);
      speedX = +ball_speed;
      //start();
      
    } 
    else if (runY>=400) {
      speedY = -ball_speed;
    } 
    else if (runY<=0) {
      speedY = +ball_speed;
    }
    else if (runX<=60) {
      if (current_position_p1<= runY && runY <= current_position_p1+brickLength) {
        speedX = +ball_speed;
      }
    }
    else if (runX>=540) {
      if (current_position_p2<= runY && runY <= current_position_p2 + brickLength) {
        speedX = -ball_speed;
      }
    }
  }
}
class Brick {
  float xloc;
  float yloc;

  Brick(int x, int y) {
    xloc = x;
    yloc = y;
  }
  void display(int y1) {
    yloc = y1;
    rect(xloc, yloc, 10, brickLength); //player1
  }
}

