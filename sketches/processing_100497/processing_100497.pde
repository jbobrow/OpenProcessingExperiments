
Ball ball1; 
Paddle paddle1; 
Paddle paddle2; 
Counter counter1; 
titlePage titlePage1; 
Setting setting1; 

PImage title; 
PImage end; 

int mode = 1; 
int count1 = 255; 
int count2 = 255;  
boolean start = false; 
//RIGHT PADDLE 
boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;
//LEFT PADDLE 
boolean keyup2 = false;
boolean keyright2 = false;
boolean keyleft2 = false;
boolean keydown2 = false;
PFont font; 
PImage sil; 
PImage sil2; 

void setup() {
  size(700, 450);
  sil = loadImage("sil.png"); //left sillouette 
  sil2 = loadImage("sil2.png"); //right sillouette
  font = loadFont("LucidaConsole-48.vlw");
  noStroke();
  smooth(); 
  textAlign(CENTER); 
  ball1 = new Ball(); 
  paddle1 = new Paddle();
  paddle2 = new Paddle(20.0, 0.0, 75, 2.0);
  counter1 = new Counter();
  titlePage1 = new titlePage();
  setting1 = new Setting();
  title = loadImage("project5_title.png"); 
  end = loadImage("project5_end.png"); 
}

void draw() {
  if (mode == 1) {
    titlePage1.display();
  } 
  else if (mode == 2) {  
    setting1.display(); 
    tint(255, count1); 
    image(sil, -350 , -50, 500, width);
    tint(255, count2);
    image(sil2, width - 150, -50, 500, width); 
    //PADDLE ONE 
    ball1.display();  
    ball1.ballMove();
    ball1.reset(counter1);
    ball1.restrain();
    // ball1.counter(); 
    paddle1.paddleDisplay();
    paddle1.rightPaddleMove();
    paddle1.hitPaddle(ball1);  
    paddle1.collidePaddle1(ball1, counter1, setting1);
    //PADDLE TWO 
    paddle2.paddleDisplay();
    paddle2.leftPaddleMove();
    paddle2.collidePaddle2(ball1, counter1, setting1);
    paddle2.hitPaddle2(ball1);
    counter1.display(); 
    counter1.endGame(ball1);
  }/* else if(mode == 3){
   counter1.endGame(ball1);
   //counter1.restart();
   }
   */
}

void keyPressed() {
  if (key == ' ') {
    if (mode == 1) {
      mode = 2;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) keyup = true; 
    if (keyCode == DOWN) keydown = true; 
    if (keyCode == LEFT) keyleft = true; 
    if (keyCode == RIGHT) keyright = true;
  }
  if (key=='w'|| key == 'W') keyup2 = true;
  if (key=='s'|| key == 'S') keydown2 = true; 
  if (key=='a'|| key == 'A') keyleft2 = true;  
  if (key=='d'|| key == 'D') keyright2 = true;
}



void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) keyup = false; 
    if (keyCode == DOWN) keydown = false; 
    if (keyCode == LEFT) keyleft = false; 
    if (keyCode == RIGHT) keyright = false;
  }
  if (key=='w'|| key == 'W') keyup2 = false;
  if (key=='s'|| key == 'S') keydown2 = false; 
  if (key=='a'|| key == 'A') keyleft2 = false;  
  if (key=='d'|| key == 'D') keyright2 = false;
}

class Ball { 

  //FIELDS
  float ballX = 200;
  float ballY = 650;
  float ballSpeedX = random(5, 8);
  float ballSpeedY = random(-8, 5);
  float ballDiameter = 20;
  float ballSize = 12; 
  String[]ballText = {
    "I hate you.", 
    "Fuck you.", 
    "Die.",
    "Ugly.",
    "Bitch.",
    "Bastard.",
    "Ass.", 
    "You're stupid",
    "Dumbass.",
    "Get out.", 
    "Dipshit.", 
    "Fatass.",
    "Dweeb.",
    "Fuckface.", 
    "Jerk.",
    "Get out.",
    "Get a life",
    "Pussy", 
    "Scumbag",
    "Shithead", 
    "You're an idiot.", 
    "Twerp", 
    "Twat"
  };  
  int index = int(random(0,22)); 
 

  Ball() {
  }

  Ball (float tempBallX, float tempBallY, float tempBallSpeedX, float tempBallSpeedY, float tempBallDiameter) { 
    ballX = tempBallX; 
    ballY = tempBallY; 
    ballSpeedX = tempBallSpeedX; 
    ballSpeedY = tempBallSpeedY;
    ballDiameter = tempBallDiameter;
  }

  //METHODS 
  void display() { // Draw ball
    textSize(ballSize);
    fill(255);
    text(ballText[index], ballX, ballY); 
    ballSize = ballSize + 0.05; 
    //index = int(random(index));
  }

  void ballMove() {
    ballX = ballX + ballSpeedX;
    ballY = ballY + ballSpeedY;
  }

  void reset(Counter c) { // Resets things if the ball leaves the screen
    if (ballX > width + ballDiameter) {// ballX < -ballDiameter) {
      ballX = 500;  // edit to specify person
      ballY = 650;
      ballSpeedX = random(5, 8);
      ballSpeedY = random(-8, 5);
      ballSpeedX = ballSpeedX * -1;
      ballSize = 12; 
      index = int(random(0,22)); 
      count1 = count1 + 10; 
      count2 = count2 - 30;
    } else if ( ballX < -ballDiameter) {
      ballX = 200;  // edit to specify person
      ballY = 650;
      ballSpeedX = random(5, 8);
      ballSpeedY = random(-8, 5);
      ballSize = 12; 
      index = int(random(0,22)); 
      count1 = count1 - 30; 
      count2 = count2 + 10;
    }
  }

  void restrain() { // If ball hits top or bottom, change direction of Y  
    if ( ballY > height ) {
      ballY = height;
      ballSpeedY = ballSpeedY * -1;
      ballY = ballY + ballSpeedY;
    } else if ( ballY < 0 ) {
      ballY = 0;
      ballSpeedY = ballSpeedY * -1;
      ballY = ballY + ballSpeedY;
    }
  }
}
class Counter { 



  Counter() {
  }

  Counter(int tempCount1, int tempCount2) {
    count1 = tempCount1;
    count2 = tempCount2;
  }

  void display() { 
    fill(0); 
    textFont(font, 30);
    //text( "sticks and stones may break my bones", width/2, 50); 
    //text(count1, width/2-110, 50); 
    //text(count2, width/2+110, 50);
  }

  void endGame(Ball b) {
    if (gameOver()==true) {
      background(0);
      tint(255, 255); 
      image(end, 0, 0, width, height); 
      /*
      
       fill(255);
       textFont(font, 40); 
       text("...but words will still hurt me.", width/2, 300); 
       
       rectMode(CENTER); 
       fill(108);
       rect(width/2, 350, 200, 50); 
       fill(0);
       textFont(font, 24); 
       text("play again?", width/2, 355);
       */
      b.ballX = 0;
      b.ballY = 0;
      mode = 3;
    }
  }


  boolean gameOver() {
    if (count1 <= 0) {
      return true;
    } 
    else if (count2 <=0) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class Paddle { 

  //FIELDS 

  float paddleX = width - 20;
  //float paddleX2 = 20; 
  float paddleY;
  float paddleHeight = 75;
  float paddleWidth = 2;



  Paddle() {
  }

  Paddle (float tempPaddleX, float tempPaddleY, float tempPaddleHeight, float tempPaddleWidth) { 
    paddleX = tempPaddleX; 
    paddleY = tempPaddleY; 
    paddleHeight = tempPaddleHeight; 
    paddleWidth = tempPaddleWidth;
  }

  //METHODS
  void paddleDisplay() {
    fill(100);
    rect(paddleX, paddleY, paddleWidth, paddleHeight);
  }

  void rightPaddleMove() {
    if (keyup) {
      paddleY = paddleY - 7;
    } else if (keydown) {
      paddleY = paddleY + 7;
    } else if (keyleft) {
      paddleX = paddleX - 7;
    } else if (keyright) {
      paddleX = paddleX + 7;
    }

    paddleY = constrain(paddleY, 0, height-paddleHeight);
    paddleX = constrain(paddleX, 600, 690);
  }
  /*
    paddleY = mouseY - paddleHeight/2;
   paddleY = constrain(paddleY, 0, height-paddleHeight);
   }
   */


  void leftPaddleMove() {
   if (keyup2) {
      paddleY = paddleY - 7;
    } else if (keydown2) {
      paddleY = paddleY + 7;
    } else if (keyleft2) {
      paddleX = paddleX - 7;
    } else if (keyright2) {
      paddleX = paddleX + 7;
    }
    paddleY = constrain(paddleY, 0, height-paddleHeight);
    paddleX = constrain(paddleX, 15, 125);
  }


  /*
    paddleY = mouseY - paddleHeight/2;
   paddleY = constrain(paddleY, 0, height-paddleHeight);
   }
   */



  void collidePaddle1 (Ball b, Counter c, Setting s) { // If ball hits paddle, invert X direction
    if ( hitPaddle(b) == true ) {
      b.ballX = paddleX;
      b.ballSpeedX = random(5, 8);
      b.ballSpeedY = random(-8, 5);
      b.ballSpeedX = b.ballSpeedX * -1;
      b.ballX = b.ballX + b.ballSpeedX;
      b.ballSize = 12; 
      b.index = int(random(22));
      s.col1 = int(random(50, 150)); 
      s.col2 = int(random(50, 150)); 
      s.col3 = int(random(50, 150));
     count2 = count2 - 20;
    }
  }


  void collidePaddle2 (Ball b, Counter c, Setting s ) {
    if ( hitPaddle2(b) == true ) {
      //b.ballX = paddleX2; original 
      b.ballX = paddleX;
      println("hit");
      b.ballSpeedX = random(5, 8);
      b.ballSpeedY = random(-8, 5);
      b.ballX = b.ballX + b.ballSpeedX;
      b.ballY = b.ballY + b.ballSpeedY;
      b.ballSize = 12;
      b.index = int(random(22));
      s.col1 = int(random(50, 150)); 
      s.col2 = int(random(50, 150)); 
      s.col3 = int(random(50, 150));
     count1 = count1 - 20;
    }
  }


  boolean hitPaddle(Ball b) {
    if (b.ballX > paddleX && b.ballY > paddleY && b.ballY < paddleY+paddleHeight) {
      return true;
    } else {
      return false;
    }
  }
  boolean hitPaddle2(Ball b) {
    if (b.ballX < paddleX && b.ballY >  paddleY && b.ballY < paddleY+paddleHeight) {
      return true;
    } else {
      return false;
    }
  }
}

class Setting {

  int col1 = 108;
  int col2 = 108;
  int col3 = 108; 

  Setting () {
  }

  void display() {
    background(col1, col2, col3);
  }
}
class titlePage {
  


  titlePage() {
  }

  void display() {
    image(title, -10, 0, width+10, height); 
    /*
    background(0); 
    textFont(font, 48);
    text("sticks and stones", width/2, 225);  
    textFont(font, 24);
    text("Controls", width/2, 350);
    text("Player 1 -  w,a,s,d", width/4, 400); 
    text("Player 2 - arrow keys", width/2+width/4, 400); 
    text("Press space to start", width/2, 550); 
    */
  }
}




