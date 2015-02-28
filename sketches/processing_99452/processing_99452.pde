
boolean doubleP = false;
boolean seizureMode = false;

int colorVal;

float dbx = 450; //demo ball - start screen
float dby = 300;
float dbSpeedX = 8;
float dbSpeedY = 8;

float ballX = 450; //playing ball
float ballY = 300;
float x1 = 45; //player 1 coordinates (left)
float y1 = 255;
float x2 = 845; //player 2 coordinates (right)
float y2 = 255;
float speed = 9;

float ballSpeedX = 4.5;
float ballSpeedY = 4.5;
boolean ballTouchingP1 = false;
boolean ballTouchingP2 = false;

boolean wPressed = false;
boolean sPressed = false;
boolean iPressed = false;
boolean kPressed = false;
boolean goPressed = false; //space starts the ball
boolean mPressed = false; //'m' changes the background color mode

int p1Score = 0;
int p2Score = 0;




// 1
void setup() {
  size(900,600);
  background(random(0,255),random(0,255),random(0,255));
  smooth();
}




// 2
void draw() {
  mainPage();
}



// 3
void mainPage() {
  background(0);

  PFont font;
  font  = loadFont("Helvetica-Bold.vlw");
  textFont (font,100);
  fill(random(0,255),random(0,255),random(0,255));
  textAlign(CENTER);
  text("PONG!",450,150);
  
  //PFont font2;
 // font2  = loadFont("Helvetica-Bold-20.vlw");
  textFont (font,20);
  textAlign(CENTER);
  text("Player 1 uses W/S for up/down",450,200);
  text("Player 2 uses I/K for up/down",450,230);
  text("Press 'm' to change color mode*",450,260);
  text("SPACE to Start",450,290);
  text("**WARNING: MAY INDUCE SEIZURES",450,550);
  
  demoBall();
  buttonPlay();
}



void demoBall() {
  noStroke();
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(dbx,dby,40,40);
  
  dbx = dbx + dbSpeedX;
  dby = dby + dbSpeedY;
  
  if (dbx >= 900) {
    dbSpeedX = dbSpeedX * -1;
  }
  if (dbx <= 0) {
    dbSpeedX = dbSpeedX * -1;
  }
  if (dby >= 600) {
    dbSpeedY = dbSpeedY * -1;
  }
  if (dby <= 0) {
    dbSpeedY = dbSpeedY * -1;
  }
}





void buttonPlay() {
  fill(random(0,255),random(0,255),random(0,255));
  rect(300,400,300,100,7,7,7,7);
  
  fill(0);
  PFont font;
  font  = loadFont("Helvetica-Bold.vlw");
  textFont (font,48);
  textAlign(CENTER);
  text("PLAY!",450,465);
  
  if (mousePressed && (pmouseX >= 300) && (pmouseX <= 600) && (pmouseY >= 400) && (pmouseY <= 500)) {
    doubleP = true;
  }
  if (doubleP == true) {
    twoPlayer();
  }
}




void twoPlayer() {
  background(random(0,colorVal),random(0,colorVal),random(0,colorVal));
  midLine();
  player1();
  player2();
  ball();
  
  PFont font;
  font  = loadFont("Helvetica-Bold.vlw");
  textFont (font,100);
  textAlign(CENTER);
  text(""+p1Score,225,80);
  text(""+p2Score,675,80);
  
  if (mPressed == true) {
    seizureMode = true;
  }
  if (seizureMode == true) {
    colorVal = 255;
  }
  if (seizureMode == false) {
    colorVal = 0;
  }
}





//
void midLine() {
  for (int i = 0; i < 1000; i = i+20) {
    fill(255);
    rect(449,i,2,10);
  }
}




//
void player1() {
  fill(255);
  rect(x1,y1,10,90);
  
  if (y1 <= 0) {
    y1 = 0;
  }
  if (y1 >= 510) {
    y1 = 510;
  }
  
  if (wPressed == true) {
    y1 = y1 - speed;
  }
  if (sPressed == true) {
    y1 = y1 + speed;
  }
}





void player2() {
  fill(255);
  rect(x2,y2,10,90);
  
  if (y2 <= 0) {
    y2 = 0;
  }
  if (y2 >= 510) {
    y2 = 510;
  }
  
  if (iPressed == true) {
    y2 = y2 - speed;
  }
  if (kPressed == true) {
    y2 = y2 + speed;
  }
}


  
  



void ball() {
  ellipseMode(CENTER);
  fill(255);
  ellipse(ballX, ballY, 15, 15);
  
  if (goPressed == true) {
    ballX = ballX + ballSpeedX;
    ballY = ballY + ballSpeedY;
  }
  
  if (ballY >= 600) {
    ballSpeedY = ballSpeedY * -1;
  }
  if (ballY <= 0) {
    ballSpeedY = ballSpeedY * -1;
  }
  
  if ((ballX <= 60) && (ballX >= 45) && (ballY >= y1) && (ballY <= y1+90)) {
    ballTouchingP1 = true;
  }
  if ((ballX >= 840) && (ballX <= 855) && (ballY >= y2) && (ballY <= y2+90)) {
    ballTouchingP2 = true;
  }
  
  
  if (ballTouchingP1 == true) {
    ballSpeedX = ballSpeedX * -1;
    ballTouchingP1 = false;
  }
  if (ballTouchingP2 == true) {
    ballSpeedX = ballSpeedX * -1;
    ballTouchingP2 = false;
  }
  
  if (ballX >= 900) {
    ballX = 450;
    ballSpeedX = ballSpeedX * -1;
    p1Score = p1Score + 1;
  }
  if (ballX <= 0) {
    ballX = 450;
    ballSpeedX = ballSpeedX * -1;
    p2Score = p2Score + 1;
  }
}





void keyPressed() {
  if (key == 'w') {
    wPressed = true;
  }
  if (key == 's') {
    sPressed = true;
  }
  if (key =='i') {
    iPressed = true;
  }
  if (key == 'k') {
    kPressed = true;
  }
  if (key == ' ') {
    goPressed = true;
  }
  if (key == 'm') {
    mPressed = true;
  }
}





void keyReleased() {
  if (key == 'w') {
    wPressed = false;
  }
  if (key == 's') {
    sPressed = false;
  }
  if (key =='i') {
    iPressed = false;
  }
  if (key == 'k') {
    kPressed = false;
  }
  if (key == 'm') {
    mPressed = false;
  }
}


