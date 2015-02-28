
Paddle paddle1;
Paddle paddle2;
Ball ball1;
int score1 = 0;
int score2 = 0;
int speed = 5;

void setup() {
  size(400, 400);
  
  paddle1 = new Paddle (20, height /2 );
  paddle2 = new Paddle (width - 20, height /2);
  ball1 = new Ball(width /2, height/2);
  PFont myFont;
  myFont = createFont ("Courier", 40);
  textFont(myFont);
}
class Paddle {
  float x = 0;
  float y = 0;
  float pwidth = 10;
  float pheight = 40;
  int direction = 0;

  Paddle( float givenx, float giveny ) {
    x = givenx;
    y = giveny;
  }
  void draw() {
    noStroke();
    rectMode(CENTER);
    rect(x, y, pwidth, pheight);
  }
  void move() {
    
    if( y < height - 40 && y > 40 )
      y = y + direction;
  }
   
}


class Ball {

  float x = 0, y = 0;
  float bwidth = 6, bheight = 6;

  Ball(float givenx, float giveny) {
    x = givenx;
    y = giveny;
  }

  void draw() {
    noStroke();
    rectMode(CENTER);
    rect(x, y, bwidth, bheight);
  }
  
  void move() {
    
  }
  
}

void keyPressed() {

  if ( key == 'w' ) {
    println("player 1 up");
    paddle1.direction = 0 - speed;
  }
  else if (key == 's') {
    println ("player 1 down");
    paddle1.direction = speed;
  }
  else if (key == '5' ) {
    println("player 2 up");
    paddle2.direction = 0 - speed;
  }
  else if (key == '2') {
    println("player 2 down");
    paddle2.direction = speed;
  }
}

void keyReleased() {

  if ( key == 'w' ) {
    println("player 1 stop");
  }
  else if (key == 's') {
    println ("player 1 stop");
  }
  else if (key == '5' ) {
    println("player 2 stop");
  }
  else if (key == '2') {
    println("player 2 stop");
  }
}

void drawNet() {
  for (int i = 0; i < height; i += 10) {
    rect(width/2, i, 1, 5);
  }
}

void drawScore() {
    textSize(80);
  textAlign(CENTER);
  text(score1, width/4, 80);
  text(score2, width*3/4, 80);
}

void draw() {
  background(0);
  paddle1.draw();
  paddle1.move();
  paddle2.draw();
  paddle2.move();
  ball1.draw();

  //draw net
  drawNet();
  drawScore();

}
