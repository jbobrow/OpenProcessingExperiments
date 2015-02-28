
PImage player1, player2, start, p1Win, p2Win;
PFont myFont;


int p1PosX;
int p1PosY;
int p2PosX;
int p2PosY;
int p1Score;
int p2Score;
int maxScore;

int paddleWidth;
int paddleHeight;

int p1BulletX = -50;
int p1BulletY;

int p2BulletX =880;
int p2BulletY;

int p1BulletSpeed = 10;
int p2BulletSpeed = -10;

int p1PlayerSpeed = 20;
int p2PlayerSpeed = 20;

boolean p1Shooting=false;
boolean p2Shooting=false;

int gameState;

//boolean upPressed;
//boolean downPressed;
//boolean rightPressed;
//boolean leftPressed;
//
//boolean wPressed;
//boolean sPressed;
//boolean aPressed;
//boolean dPressed;

void setup() {

  size(600, 400);
  smooth();

  myFont = loadFont("Pastelaria-35.vlw");
  textFont (myFont, 35);

  paddleWidth = 45;
  paddleHeight = 65;

  p1PosX=30;
  p1PosY = height/2;

  p2PosX=width-50;
  p2PosY = height/2;

  //SCORES
  p1Score = 0;
  p2Score = 0;
  gameState=0;
  maxScore = 3;

  //LOAD IMAGES
  player1 = loadImage ("p1.png");  
  player2 = loadImage ("p2.png");
  start = loadImage ("start.png");
  p1Win = loadImage ("p1Wins.png");
  p2Win = loadImage ("p2Wins.png");

  //  upPressed = false;
  //  downPressed = false;
  //  rightPressed = false;
  //  leftPressed = false;
  //
  //  dPressed = false;
  //  aPressed = false;
  //  wPressed = false;
  //  sPressed = false;
}

void draw() {
  background(0);

  if (gameState == 0) { //if we are in the pre-game menu
    //fill(0,150,0);
    imageMode (CORNER);
    image(start, 0, 0);
    //text("D BALL", 180, height/2  );
    //text("PRESS B TO START", 150, height/2+20); 

    if (keyPressed && key == 'b') {
      gameState = 1;
    }
  }

  if (gameState == 2) {    // game-over menu
    
    if(p1Score == 3){
      image(p1Win,width/2,height/2);
    }
    
    if(p2Score ==3){
      image (p2Win,width/2,height/2);
    }
    
     fill(255);
    text("FINAL SCORE", 220, 40);
    fill(random(10,200));
    text("PRESS R To RESTART", 180, height-30);
                     
fill(255);
    text(p1Score, 40, 40);
    text(p2Score, width-40, 40);
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup ();
    }
  }

  if (gameState == 1) { //if the game is on playing
    if (p1Score >= maxScore || p2Score >= maxScore) {
      gameState = 2;
    }

    fill(0, 150, 0);
    stroke(255);
    strokeWeight(3);
    rect(10, 10, width/2-10, height-20);
    rect(width/2, 10, width/2-10, height-20);
    fill(255);
    text(p1Score, 100, 50);
    text(p2Score, 500, 50);

    //PLAYER ONE
    imageMode(CENTER);
    image(player1, p1PosX, p1PosY, paddleWidth, paddleHeight);

    //PLAYER TWO
    image(player2, p2PosX, p2PosY, paddleWidth, paddleHeight);

    if (p1Shooting) {
      p1shot();
    } 

    if (p2Shooting) { 
      p2shot();
    } 

    // Here is what happens the ball hits the player           
    float distp1 = dist(p1PosX, p1PosY, p2BulletX, p2BulletY);
    float distp2 = dist(p2PosX, p2PosY, p1BulletX, p1BulletY);


    // when the ball hits the head, score
    if (distp1 < 15) {
      p2Score++;
      p2BulletX = -800;
      println(p2Score);
    }

    if (distp2 < 15) {
      p1Score++;
      p1BulletX = 800;
      println(p1Score);
      
    }


    /*
    
     if (p1BulletX >= p2PosX && p1BulletX <= p2PosX + paddleWidth) {
     if (p1BulletY <= p2PosY && p1BulletY < p2PosY+paddleHeight) {
     p1Score++;
     fill(0, 255, 0);
     ellipse (width/2, height/2, 20, 20);
     println(p1Score);
     }
     } 
     
     if (p2BulletX >= p1PosX && p2BulletX <= p1PosX + paddleWidth ) {
     if (p2BulletY <= p1PosY && p2BulletX<p1PosY + paddleHeight) {
     p2Score++;
     fill(255, 0, 0);
     ellipse (width/2, height/2, 20, 20);
     println(p2Score);
     }
     } 
     */

    //    //CODE FOR THE PLAYER TO CONTINUE ON SCREEN      NOT WORKING!!!!!!!
    //    if (p1PosX < 0 || p1PosX > width/2) {
    //      p1PlayerSpeed*=-1;
    //    }
    //
    //    if (p1PosY < 20 || p1PosY > height-30) {
    //      p1PlayerSpeed*=-1;
    //    }
    //
    //    if (p2PosX < 0 || p2PosX > width/2) {
    //      p2PlayerSpeed*=-1;
    //    }
    //
    //    if (p2PosY < 20 || p2PosY > height-30) {
    //      p2PlayerSpeed*=-1;
    //    }


    // reset the x & y positions to 1 when then hit the wall
    //PLAYER1
    if (p1PosX < 0) {
      p1PosX = 1;
    }

    if (p1PosX > width/2) {
      p1PosX = width/2-1;
    }
    
    if (p1PosY < 0) {
      p1PosY = 1;
    }

    if (p1PosY > height) {
      p1PosY = height-1;
    }
    
   //PLAYER2
   if (p2PosX < width/2) {
      p2PosX = width/2+1;
    }

    if (p2PosX > width) {
      p2PosX = width+1;
    }
    
    if (p2PosY < 0) {
      p2PosY = 1;
    }

    if (p2PosY > height) {
      p2PosY = height-1;
    }
   
    
////    if (p2PosX > height) {
////      p2PosX = width-1;
////    }
//
//    if (p2PosX < width/2) {
//      p2PosX = width/2+1;
//    }
    
    
    
    
  }
}

void keyPressed() {
  // PLAYER ONE
  if (key == 'w') {
    p1PosY -= p1PlayerSpeed;
  }  
  else if (key =='s') {
    p1PosY+=p1PlayerSpeed;
  }

  if (key == 'a') {
    p1PosX-=p1PlayerSpeed;
  }  
  else if (key =='d') {
    p1PosX+=p1PlayerSpeed;
  }

  // P1 SHOT KEY

  if (key == 'q' && (p1BulletX<0 || p1BulletX>width)) {
    p1Shooting = true;
    p1BulletY = p1PosY;
    p1BulletX = p1PosX;
  }

  //PLAYER TWO
  if (keyCode == UP) {
    p2PosY -= p2PlayerSpeed;
  }

  else if (keyCode == DOWN) {
    p2PosY += p2PlayerSpeed;
  }

  if (keyCode == RIGHT) {
    p2PosX += p2PlayerSpeed;
  }

  else if (keyCode == LEFT) {
    p2PosX -= p2PlayerSpeed;
  }

  if (keyCode == ENTER && (p2BulletX<0 || p2BulletX>width)) {
    p2Shooting = true;
    p2BulletY = p2PosY;
    p2BulletX = p2PosX;
  }
}


//FUNCTION P1 SHOT
void p1shot()
{
  noStroke();
  fill(255, 140, 0);
  ellipse(p1BulletX, p1BulletY, 20, 20);
  p1BulletX=p1BulletX+p1BulletSpeed;
}

//FUNCTION P2 SHOT
void p2shot()
{
  ellipse(p2BulletX, p2BulletY, 20, 20);
  p2BulletX=p2BulletX+p2BulletSpeed;
}


