

// declaring the global variables and classes 
boolean start = false; //starts game when true

Ball ball;

boolean wPressed, sPressed, oPressed, lPressed;

Paddle paddle, paddle2;

int game, startLine, endLine;

int p1score, p2score;

PFont font; 

// all the variables needed are initialised here 
void setup() {
  size(900, 600);
  startLine = 0;
  endLine = height;
  //ball
  ball = new Ball();
  ball.x =width/2;
  ball.y = height/2;
  ball.speedX = -5;
  ball.speedY = 3;
  //paddle
  paddle = new Paddle();
  paddle.x = 20;
  paddle.y = height/2-30;
  paddle.w = 10;
  paddle.l = 60;
  paddle.speed = 10;
  //keypressed
  wPressed = false;
  sPressed = false;
  oPressed = false;
  lPressed = false;
  //case1
  game = 1;
  paddle2 = new Paddle();
  paddle2.x = width-30;
  paddle2.y = height/2-30;
  paddle2.w = 10;
  paddle2.l = 60;
  paddle2.speed = 10;
  font=loadFont("Flintstone-48.vlw");
  textFont(font);
  textSize(30);
}

//these if statment checks whether the ball has hit the paddle 
void paddleCollide() {
  //this is for the paddle on the left 
  if (ball.x > paddle.x && ball.x < paddle.x + paddle.w
    && ball.y < paddle.y + paddle.l && ball.y > paddle.y) {
    ball.speedX *= -1;
    println ("ssstrue");
  }

  //this is for the paddle on the right 

  if (ball.x > paddle2.x && ball.x < paddle2.x + paddle2.w
    && ball.y < paddle2.y + paddle2.l && ball.y > paddle2.y) {
    ball.speedX *= -1;
    println ("true");
  }
}


//this if statment checks if the ball has gone off the screen  and adding the score
void ballOffScreen() {
  if (ball.x < 0 ) {

    ball.x = width/2;
    p1score += 1;
  }
  if (ball.x > width) {

    ball.x = width/2;
    p2score += 1;
  }
}

// draws 
void draw() {

  background(0);
  textAlign(CENTER);
  textSize(60);
  String cp = "Classic Pong"; 
  text(cp, width/2, height/12); //displays intro message

  textSize(30);
  String intro = "To play the the game press the space bar"; 
  String instructions = "Left Pad controls : W(w) is to move up & S(s) to move down"; //set's intro mes
  String instructions2 = "Right Pad controls : O(o) is to move paddle up and L(l) to move down"; //set's intro mes
  String pr = "To pause the game press P(p), to restart press R(r) & to exit press E(e)";
  String enjoy = "Enjoy :)"; //set's intro mes

  text(intro, width/2, height/5); //displays intro message
  text(instructions, width/2, height/3); //displays intro message
  text(instructions2, width/2, height/2.4); //displays intro message
  text(pr, width/2, height/2); //displays intro message
  text(enjoy, width/2, height/1.5); //displays intro message


  if (start) { 
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("Score: "+p2score, width/4, height);//player 2 score 
    text("Score: "+p1score, width/1.35, height);//player 1 score 
    text("Classic Pong", width/2.05, height/25);//the text classic pong at the top
    rect(30, 30, width-60, height-60, 11);//the white board 
    rect(33, 33, width-66, height-66, 7);//the white board 
    line (width/2, startLine+30, width/2, endLine-25);//the line in the middle of the screen
    line (startLine+30, height/2, endLine+270, height/2);//the line in the middle of the screen


    //swicthing between games 
    switch(game) {
    case 1:
      strokeWeight(10);
      point(ball.x, ball.y);
      ball.ballMove();
      ball.bounceBall();
      paddle.paddleDraw();
      paddleCollide();
      ballOffScreen();
      paddle2.paddleDraw();
      paddleMove();
      break;
    }
  }
}
// this restricts the paddle movement 
void paddleMove() {
  if (wPressed && paddle.y >= 0) {
    paddle.y -= paddle.speed;
  }
  if (sPressed && paddle.y + paddle.l <= height) {
    paddle.y += paddle.speed;
  }
  if (oPressed && paddle2.y >= 0) {
    paddle2.y -= paddle2.speed;
  }
  if (lPressed && paddle2.y + paddle.l <= height) {
    paddle2.y += paddle2.speed;
  }
}


//these are the keys usd to play the game 
//theyre set to true if any one of them is pressed

void keyPressed() {


  if (key == 'w'|| key =='W') {
    wPressed = true;
  }
  if (key == 's'|| key =='S') {
    sPressed = true;
  }
  if (key == 'o'|| key =='O') {
    oPressed = true;
  }
  if (key == 'l'|| key =='L') {
    lPressed = true;
  }

  //if the space bar is pressed the game starts
  if (key == ' ') { 
    start = true;
  }

  //if p is pressed the game pauses 
  if (key == 'p' || key=='P') { 
    start = false;
  }
  //if R is pressed the game restarts 
  if (key == 'r' || key == 'R') {
    start = true;
    p1score = 0;
    p2score = 0;
    ball.x =width/2;
    ball.y = height/2;
  }
  //if E is pressed the game goes back to the main screen
  if (key == 'e' || key == 'E') {
    start = false;
    p1score = 0;
    p2score = 0;
  }
}


// and once theyre released theyre set back to false
void keyReleased() {
  if (key == 'w' || key =='W') {
    wPressed = false;
  }
  if (key == 's' || key == 'S') {
    sPressed = false;
  }
  if (key == 'o' || key == 'O') {
    oPressed = false;
  }
  if (key == 'l' ||key == 'L') {
    lPressed = false;
  }
  if (key == 'R'||key == 'R') { 
    start = false;
  }
}

//this is the class ball
class Ball {
  int x, y, size;// declaring the variables 
  float speedX, speedY;

  void ballMove() {
    x += speedX; //adding the x position to speedX
    y += speedY; //ading the y position to speedY
  }

//this if statement is reposnsible for the ball bouncing
  void bounceBall() {
    //setting the co-ordinates so that the ball bounces inside the whitespace
    if (x < 0 || x >width) {
      //than multiplying and setting speedyY by -1
      speedX *= 1;
    }
    //setting the co-ordinates so that the ball bounces inside the whitespace
    if (y < 30 || y > height-36) {
      //than multiplying and setting speedyY by -1
      speedY *= -1;
    }
  }
}

class Paddle {
  //declaring the variables 
  int x, y, w, l, speed;

  void paddleDraw() {
    //drawing the paddles
    strokeWeight(2);
    rect(x, y, w, l,7);
  }
//controlling the paddles movement and restricting it
  void paddleMove() {
    if (wPressed && y >= 0) {
      y -= speed;
    }
    if (sPressed && y + l <= height) {
      y += speed;
    }
    if (oPressed && y >= 0) {
      y -= speed;
    }
    if (lPressed && y + l <= height) {
      y += speed;
    }
  }


}



