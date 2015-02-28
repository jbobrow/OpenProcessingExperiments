
//Chinese Pacman 
//by Raymond Fang - Co-code editor & troubleshooter
//   Daniel Wong - Co-code editor & graphics designer

boolean upPressed, leftPressed, downPressed, rightPressed;

//Objects
PImage SF;
float x1=random(20, 580);
float y1=random(20, 580);

float x2=random(20, 580);
float y2=random(20, 580);

float x3=random(20, 580);
float y3=random(20, 580);

float x4=random(20, 580);
float y4=random(20, 580);

float x5=random(20, 580);
float y5=random(20, 580);

float x6=random(20, 580);
float y6=random(20, 580);

//Objects L2
float xo1=random(20, 580);
float yo1=random(20, 580);

float xo2=random(20, 580);
float yo2=random(20, 580);

float xo3=random(20, 580);
float yo3=random(20, 580);

float xo4=random(20, 580);
float yo4=random(20, 580);

float xo5=random(20, 580);
float yo5=random(20, 580);

float xo6=random(20, 580);
float yo6=random(20, 580);

float xo7=random(20, 580);
float yo7=random(20, 580);

float xo8=random(20, 580);
float yo8=random(20, 580);

float xo9=random(20, 580);
float yo9=random(20, 580);

float xo10=random(20, 580);
float yo10=random(20, 580);

//Objects L3
float xb1=random(600);
float yb1=random(600);

float xb2=random(600);
float yb2=random(600);

float xb3=random(600);
float yb3=random(600);

float xb4=random(600);
float yb4=random(600);

float xb5=random(600);
float yb5=random(600);

float xb6=random(600);
float yb6=random(600);

float xb7=random(600);
float yb7=random(600);

float xb8=random(600);
float yb8=random(600);

float xb9=random(600);
float yb9=random(600);

float xb10=random(600);
float yb10=random(600);

float xb11=random(600);
float yb11=random(600);

float xb12=random(600);
float yb12=random(600);

float xb13=random(600);
float yb13=random(600);

float xb14=random(600);
float yb14=random(600);

//Player
PImage Pacman;
float playerx=100;
float playery=100;

//float playerx2=random(600);
//float playery2=random(600);

//Hazards
PImage PinkGhost;
float xh1=150;
float yh1=0;

PImage OrangeGhost;
float xh2=300;
float yh2=0;

PImage BossGhost;
float xh3=450;
float yh3=0;

PImage AWWWYEAHHH;

//Sound
import ddf.minim.*;
Minim minim;
AudioSample intro;
AudioSample losing;
AudioSample winning;
AudioSample moving;

//float prizeX, prizeY;

int screenNumber;
PFont font;
int aScore;
int bScore;

void setup()
{
  size(600, 600);
  smooth();
  noStroke();
  rectMode(CENTER);
  smooth();
  AWWWYEAHHH = loadImage("thatswsup3.png");
  font = loadFont("LucidaSans-32.vlw");
  textFont(font, 32);
  BossGhost = loadImage("blue.png");
  OrangeGhost = loadImage("orange.png");
  PinkGhost = loadImage("pink.png");
  SF = loadImage("SFlogo.png");
  Pacman = loadImage("pacman-right.png");
  
  {
  minim = new Minim(this);
  intro = minim.loadSample("intro.mp3", 5000); 
  intro.trigger();
  }
  {
  minim = new Minim(this);
  losing = minim.loadSample("losing.mp3", 5000);
  }
  {
  minim = new Minim(this);
  winning = minim.loadSample("winning(1).mp3", 5000);  
  }
  {
  minim = new Minim(this);
  moving = minim.loadSample("moving(1).mp3", 700);    
  }
    
  screenNumber = 0;
}

void draw()
{ 
  background(0);
  if (screenNumber == 0)
  {
    displayInstructions();
    aScore = 0;
  }
  else if (screenNumber == 1)
  {
    movePlayers();
    drawPlayers();
    drawObjects();
    moveHazards();
    drawHazards();
    displayScore();
    checkPosition();
    checkHazard();
    //moving.close();
  }
  else if (screenNumber == 2)
  {
    losing.trigger();
    font = loadFont("LucidaSans-32.vlw");
    textFont(font, 32);  
    fill(#2D19A5);
    text("You Lose!", 220, 200);
    minim.stop();
    super.stop();
  }

  else if (screenNumber == 3)
  { 
    
    background(#FF0000);
    font = loadFont("LucidaSans-32.vlw");
    textFont(font, 32);
    fill(#2D19A5);
    text("Level Up!", 220, 200);
    fill(#F0F507);
    text("Continue", 225, 400);
    if (mousePressed) screenNumber = 4;
  }
  else if (screenNumber == 4)
  {
    aScore = 0;

    movePlayers();
    drawPlayers();
    drawObjectsL2();
    moveHazards();
    drawHazards();
    displayScoreL2();
    checkPositionL2();
    checkHazard();
    yh1 = yh1 + 1;
    yh2 = yh2 + 1;
    yh3 = yh2 + 1;
  }
  else if (screenNumber == 5)
  { 
    winning.trigger();
    background (random(225),random(225),random(225));
    font = loadFont("LucidaSans-32.vlw");
    winning.trigger();
    textFont(font, 50);
    fill(#2D19A5);
    text("You Win!", 200, 200);
    fill(#F0F507);
    //minim.stop();
    super.stop();
    //text("Continue", 225, 400);
    //if (mousePressed) screenNumber = 10;
  }
  else if (screenNumber == 10)
  {
    //aScore = 0;
    //movePlayers();
    //drawPlayers();
    //drawObjectsL3();
    //moveHazards();
    //drawHazards();
    //displayScoreL3();
    //checkPositionL3();
    //checkHazard();
    //yh1 = yh1 + 1;
    //yh2 = yh2 + 1;
    //yh3 = yh2 + 1;
  }
}




void displayInstructions()
{
  image(AWWWYEAHHH, 0, 0);
  //fill(#FEFF00);
  //textFont(font, 50);  
  //text("Chinese Pacman Beta!", 40, 180);


  fill(#4DF507);
  textFont(font, 13);  
  text("Collect the SF, avoid them ghosts, and use them arrow keys the move player.", 60, 500);

  fill(#F0F507);
  textFont(font, 30); 
  text("Play", 260, 400);
  if (mousePressed) screenNumber = 1;
  

 
  
 
 
}

void displayScore()
{
  fill(#FF0000);
  textFont (font, 50);
  text("Score: " + aScore, 10, 70);
  if (aScore > 119)
  {
    screenNumber = 3;
  }
}

void displayScoreL2()
{
  fill(#FF0000);
  textFont (font, 50);
  text("Score: " + bScore, 10, 70);
  if (bScore > 199)
  {
    screenNumber = 5;
  }
}
void displayScoreL3()
{
  fill(#FF0000);
  textFont (font, 50);
  text("Score: " + bScore, 10, 70);
  if (bScore > 179)
  {
    screenNumber = 5;
  }
}


void checkPosition()
{
  if (abs(x1 - playerx) < 30 && abs(y1 - playery) < 50)
  {
    aScore += 20;
    x1=1000;
    y1=1000;
  }
  if (abs(x2 - playerx) < 30 && abs(y2 - playery) < 50)
  {
    aScore += 20;
    x2=1000;
    y2=1000;
  }
  if (abs(x3 - playerx) < 30 && abs(y3 - playery) < 50)
  {
    aScore += 20;
    x3=1000;
    y3=1000;
  }
  if (abs(x4 - playerx) < 20 && abs(y4 - playery) < 50)
  {
    aScore += 20;
    x4=1000;
    y4=1000;
  }
  if (abs(x5 - playerx) < 20 && abs(y5 - playery) < 50)
  {
    aScore += 20;
    x5=1000;
    y5=1000;
  }
  if (abs(x6 - playerx) < 20 && abs(y6 - playery) < 50)
  {
    aScore += 20;
    x6=1000;
    y6=1000;
  }
}

void checkPositionL3()
{
  if (abs(xb1 - playerx) < 3030 && abs(yb1 - playery) < 30)
  {
    aScore += 20;
    x1=1000;
    y1=1000;
  }
  if (abs(xb2 - playerx) < 30 && abs(yb2 - playery) < 30)
  {
    aScore += 20;
    x2=1000;
    y2=1000;
  }
  if (abs(xb3 - playerx) < 30 && abs(yb3 - playery) < 30)
  {
    aScore += 20;
    x3=1000;
    y3=1000;
  }
  if (abs(xb4 - playerx) < 30 && abs(yb4 - playery) < 30)
  {
    aScore += 20;
    x4=1000;
    y4=1000;
  }
  if (abs(xb5 - playerx) < 30 && abs(yb5 - playery) < 30)
  {
    aScore += 20;
    x5=1000;
    y5=1000;
  }
  if (abs(xb6 - playerx) < 30 && abs(yb6 - playery) < 30)
  {
    aScore += 20;
    x6=1000;
    y6=1000;
  }
}

void drawObjects()
{ 
  image(SF, x1, y1);
  image(SF, x2, y2);
  image(SF, x3, y3);
  image(SF, x4, y4);
  image(SF, x5, y5);
  image(SF, x6, y6);
}

void checkHazard()
{
  if (abs(xh1 - playerx) < 30 && abs(yh1 - playery) < 30)
  {
    screenNumber = 2;
  }
  if (abs(xh2 - playerx) < 30 && abs(yh2 - playery) < 30)
  {
    screenNumber = 2;
  }
  if (abs(xh3 - playerx) < 30 && abs(yh3 - playery) < 30)
  {
    screenNumber = 2;
  }
}

void drawHazards()
{
  image(PinkGhost, xh1, yh1);
  image(OrangeGhost, xh2, yh2);
  image(BossGhost, xh3, yh3);
}

void moveHazards()
{
  yh1 = yh1 + 5;
  yh2 = yh2 + 5;
  yh3 = yh2 + 5;
  if (yh1 > 600)
  {
    yh1 = 0;
  }
  if (yh2 > 600)
  {
    yh2 = 0;
  }
  if (yh3 > 600)
  {
    yh3 = 0;
  }
  if (yh1 > 600)
  {
    yh1 = yh1 + 0.5;
  }
  if (yh2 > 600)
  {
    yh2 = yh2 + 0.5;
  }
  if (yh3 > 600)
  {
    yh3 = yh3 + 0.5;
  }
}

void drawObjectsL2()
{

  image(SF, xo1, yo1);
  image(SF, xo2, yo2);
  image(SF, xo3, yo3);
  image(SF, xo4, yo4);
  image(SF, xo5, yo5);
  image(SF, xo6, yo6);
  image(SF, xo7, yo7);
  image(SF, xo8, yo8);
  image(SF, xo9, yo9);
  image(SF, xo10, yo10);
} 

void drawObjectsL3()
{

  image(SF, xb1, yb1);
  image(SF, xb2, yb2);
  image(SF, xb3, yb3);
  image(SF, xb4, yb4); 
  image(SF, xb5, yb5);
  image(SF, xb6, yb6);
  image(SF, xb7, yb7);
  image(SF, xb8, yb8); 
  image(SF, xb9, yb9);
  image(SF, xb10, yb10);
  image(SF, xb11, yb11);
  image(SF, xb12, yb12);
  image(SF, xb13, yb13);
  image(SF, xb14, yb14);
}   

void checkPositionL2()
{
  if (abs(xo1 - playerx) < 30 && abs(yo1 - playery) < 30)
  {
    bScore += 20;
    xo1=1000;
    yo1=1000;
  }
  if (abs(xo2 - playerx) < 30 && abs(yo2 - playery) < 30)
  {
    bScore += 20;
    xo2=1000;
    yo2=1000;
  }
  if (abs(xo3 - playerx) < 30 && abs(yo3 - playery) < 30)
  {
    bScore += 20;
    xo3=1000;
    yo3=1000;
  }
  if (abs(xo4 - playerx) < 30 && abs(yo4 - playery) < 30)
  {
    bScore += 20;
    xo4=1000;
    yo4=1000;
  }
  if (abs(xo5 - playerx) < 30 && abs(yo5 - playery) < 30)
  {
    bScore += 20;
    xo5=1000;
    yo5=1000;
  }
  if (abs(xo6 - playerx) < 30 && abs(yo6 - playery) < 30)
  {
    bScore += 20;
    xo6=1000;
    yo6=1000;
  }
  if (abs(xo7 - playerx) < 30 && abs(yo7 - playery) < 30)
  {
    bScore += 20;
    xo7=1000;
    yo7=1000;
  }
  if (abs(xo8 - playerx) < 30 && abs(yo8 - playery) < 30)
  {
    bScore += 20;
    xo8=1000;
    yo8=1000;
  }
  if (abs(xo9 - playerx) < 30 && abs(yo9 - playery) < 30)
  {
    bScore += 20;
    xo9=1000;
    yo9=1000;
  }
  if (abs(xo10 - playerx) < 30 && abs(yo10 - playery) < 30)
  {
    bScore += 20;
    xo10=1000;
    yo10=1000;
  }
}

void movePlayers()
{
  if (rightPressed) playerx = playerx + 5;
  if (leftPressed)  playerx = playerx - 5;
  if (upPressed)    playery = playery - 5;
  if (downPressed)  playery = playery + 5;
  
}

void drawPlayers()
{      
  image(Pacman, playerx, playery);
  if (playerx > 600)
    {
      playerx = 0 ;
    }

    if (playery > 555 )
    {
      playery = 555;
    }

    if (playerx < 0)
    {
      playerx = 600;
    }

    if (playery < 0)
    {
      playery = 0;
    }

}



void keyPressed()
{
  moving.trigger();
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == UP)    upPressed = true;
  if (keyCode == DOWN)  downPressed = true;
}

void keyReleased()
{
  minim.stop();
  //super.stop();
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
}


    


