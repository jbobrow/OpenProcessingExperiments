
/**************************************************/
/*THIS IS MY FINAL PROYECT OF THE COURSE***********/
/************MOVE:ARROWS***************************/
/**********Start/Restart:CLICK*********************/
/*********YOU LOSE WHEN YOU HIT A YELLOW BALL******/
/******OR WHEN YOU ARE OUT OF THE BOUNDARIES*******/
/**************************************************/
//GLOBAL VARIABLES
//Font for the score
PFont f;

boolean gameStart = false;

//Background Image instance
PImage bkg;

float x = 150;
float y = 150;
float speedX = random(2,4);
float speedY = random(2,4);

float x2= 250;
float y2 = 250;
float speedX2 = random(2,4);
float speedY2 = random(2,4);


float x3 = 350;
float y3 = 350;
float speedX3 = random(2,4);
float speedY3 = random(2,4);


float x4 = 450;
float y4 = 450;
float speedX4 = random(2,4);
float speedY4 = random(2,4);


float ballX = 300;
float ballY = 30;
int diamBall = 50;
int moveX = 5;
int moveY = 5;

//move with keyboard
boolean moveDown = false;
boolean moveUp = false;
boolean moveRight = false;
boolean moveLeft = false;

//diameter, points of the score
int diam;
int rectSize = 150;
int points = 0;
 
//Add the main elemnts 
void setup() {
  size(500, 500);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  bkg = loadImage("FondoPFCA.png");
}
 
//The main Loop of the game
void draw() {
  background(255);
  image(bkg, 0, 0);
  f = createFont("Arial",30,true);
  textFont(f,16);              
  fill(255);                  
  text("Score: " + points,400,470);
  if(gameStart)points+=1;
  createEnemy(25,50,150,150);
  createEnemy2(50,50,250,250);
  createEnemy3(75,50,350,350);
  createEnemy4(75,50,350,350);
  createHeroB();
}

//Set the original values of the game
void resetGame()
{
  gameStart = false;
  ballX = 300;
  ballY = 30;
  createHeroB();
  moveDown = false;
  moveUp = false;
  moveRight = false;
  moveLeft = false;  
}

//Start/Restart the Game
void mousePressed() {
  gameStart = !gameStart;
  points =0;
}

//Creates your character
void createHeroB()
{
  fill(0,51,102);
  ellipse(ballX, ballY, diamBall, diamBall);
   if(gameStart)
   {
     if(moveDown==true) ballY+=moveY;
     if(moveUp==true) ballY-=moveY;
     if(moveLeft) ballX-=moveX;
     if(moveRight)ballX+=moveX;
     if(ballX<0||ballX>width||ballY<0||ballY>height)resetGame(); 
   }
}

//Moves the Hero
void keyPressed() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = true;
     } else if(keyCode == RIGHT) {
       moveRight = true;
     } else if(keyCode == UP) {
       moveUp = true;
     } else if(keyCode == DOWN) {
       moveDown = true;
     }
  }
}

//Stop moving the hero
void keyReleased() {
  if (key == CODED) {
     if (keyCode == LEFT) {
       moveLeft = false;
     } else if(keyCode == RIGHT) {
       moveRight = false;
     } else if(keyCode == UP) {
       moveUp = false;
     } else if(keyCode == DOWN) {
       moveDown = false;
     }
  }
}

//Detection of collission 
boolean ballBall(float x1, float y1, int d1, float x2, float y2, int d2) {

  // find distance between the two objects
  float xDist = x1-x2;                                   // distance horiz
  float yDist = y1-y2;                                   // distance vert
  float distance = sqrt((xDist*xDist) + (yDist*yDist));  // diagonal distance

  // test for collision
  if (d1/2 + d2/2 > distance) {
    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}

//First ball
void createEnemy(int _diam,int displacementW,int restartX,int restartY)
{
  fill(203,162,40);
  diam = _diam;
  ellipse(x, y, diam, diam);
  if (gameStart) {
    x = x + speedX;
    y = y + speedY;
    // if ball hits movable bar, invert X direction and apply effects
    if ( x > width-displacementW) {
      speedX = speedX * -1;
      x += speedX;   
    }
 
    // if ball hits wall, change direction of X
    else if (x < displacementW/2) {
      speedX = speedX * -1.1;
      x = x + speedX;
    }
    // resets things if you lose
    if (ballBall(ballX,ballY,diamBall,x,y,diam)) {
      gameStart = false;
      x = 150;
      y = 150;
      if(speedX<4){speedX = random(2,4);}
      if(speedY<4){speedY = random(2,4);}
    }
    // if ball hits up or down, change direction of Y  
    if ( y > height || y < 0 ) {
      speedY = speedY * -1;
      y = y + speedY;
    }
  }
}

//Second Ball
void createEnemy2(int _diam,int displacementW,int restartX,int restartY)
{
  fill(203,162,40);
  diam = _diam;
  ellipse(x, y2, diam, diam);
  if (gameStart) {
    x2 = x2 + speedX2;
    y2 = y2 + speedY2;
    // if ball hits movable bar, invert X direction and apply2 effects
    if ( x2 > width-displacementW) {
      speedX2 = speedX2 * -1;
      x2 += speedX2;   
    }
 
    // if ball hits wall, change direction of X
    else if (x < displacementW/2) {
      speedX2 = speedX2 * -1.1;
      x2 = x2 + speedX2;
    }
    // resets things if y2ou lose
    if (ballBall(ballX,ballY,diamBall,x2,y2,diam)) {
      gameStart = false;
      x2 = 150;
      y2 = 150;
      if(speedX2<4){speedX2 = random(2,4);}
      if(speedY2<4){speedY2 = random(2,4);}
    }
    // if ball hits up or down, change direction of Y  
    if ( y2 > height || y2 < 0 ) {
      speedY2 = speedY2 * -1;
      y2 = y2 + speedY2;
    }
  }
}

//Third Ball
void createEnemy3(int _diam,int displacementW,int restartX,int restartY)
{
  fill(203,162,40);
  diam = _diam;
  ellipse(x3, y3, diam, diam);
  if (gameStart) {
    x3 = x3 + speedX3;
    y3 = y3 + speedY3;
    // if ball hits movable bar, invert X direction and apply3 effects
    if ( x3 > width-displacementW) {
      speedX3 = speedX3 * -1;
      x3 += speedX3;   
    }
 
    // if ball hits wall, change direction of X
    else if (x3 < displacementW/2) {
      speedX3 = speedX3 * -1.1;
      x3 = x3 + speedX3;
    }
    // resets things if y3ou lose
    if (ballBall(ballX,ballY,diamBall,x3,y3,diam)) {
      gameStart = false;
      x3 = 150;
      y3 = 150;
      if(speedX3<4){speedX3 = random(2,4);}
      if(speedY3<4){speedY3 = random(2,4);}
    }
    // if ball hits up or down, change direction of Y  
    if ( y3 > height || y3 < 0 ) {
      speedY3 = speedY3 * -1;
      y3 = y3 + speedY3;
    }
  }
}


//Third Ball
void createEnemy4(int _diam,int displacementW,int restartX,int restartY)
{
  fill(203,162,40);
  diam = _diam;
  ellipse(x4, y4, diam, diam);
  if (gameStart) {
    x4 = x4 + speedX4;
    y4 = y4 + speedY4;
    // if ball hits movable bar, invert X direction and apply4 effects
    if ( x4 > width-displacementW) {
      speedX4 = speedX4 * -1;
      x4 += speedX4;   
    }
 
    // if ball hits wall, change direction of X
    else if (x4 < displacementW/2) {
      speedX4 = speedX4 * -1.1;
      x4 = x4 + speedX4;
    }
    // resets things if y4ou lose
    if (ballBall(ballX,ballY,diamBall,x4,y4,diam)) {
      gameStart = false;
      x4 = 150;
      y4 = 150;
      if(speedX4<4){speedX4 = random(2,4);}
      if(speedY4<4){speedY4 = random(2,4);}
    }
    // if ball hits up or down, change direction of Y  
    if ( y4 > height || y4 < 0 ) {
      speedY4 = speedY4 * -1;
      y4 = y4 + speedY4;
    }
  }
}








