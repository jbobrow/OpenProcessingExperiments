
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer player;
AudioInput input;

/**
 * Bulk it up!
 * based on ContinuousKeys
 * by Mark Pineda
 * 10/28/10
 */

// keypress tracking

boolean upPressed, leftPressed, downPressed, rightPressed;

// coordinates
int x, y;
int u, v;
float prizeX, prizeY;
float p = 0.07;
//size
float s=30.2;

// other stuff
int screenNumber,time=3600;
int aScore, bScore;
int speed;
PFont font;
PImage star,guy;

void setup()
{
  size(800, 806);
  smooth();
  noStroke();
  rectMode(CENTER);
  font = loadFont("LucidaSans-32.vlw");
  star = loadImage("star.gif");
  guy = loadImage("Scary.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Tarzan.mp3");
  input = minim.getLineIn();
  textFont(font, 32);
  screenNumber = 0;
  
}

void draw()
{   
  background(0,2);
  if (screenNumber == 0)
  {
    displayInstructions();
    aScore = 0;
    x = y = width/2;
    prizeX = prizeY = width/4;
  }
  else if (screenNumber == 1)
  {
    drawPlayers();
    decreaseSize();
    movePlayers();
    displayInst();
    checkOverlap();
    timer();
    time = time - 1;

    checkPrize();
    drawPrize();

    setSpeedLevel();
    displayScore();
   println(s);
   if(s < 0) screenNumber = 2; 
   if(s > 55) 
   {
     p = .1;
     speed = 12;
     
   }
   if(s < 55) 
   {
     p = 0.07;
     speed = 7;
   } 
   if(s > 70) screenNumber = 3;
   
   WrapAround();    
  }
  
  else if (screenNumber == 2)
  {
    gameover();
  }
  else if(screenNumber == 3)
 {
   background(guy);
   player.play();
 }
}

void displayWinner()
{
  fill(0, 200, 0);
  if (aScore > bScore)
    text("Circle wins!", 50, 100);
  else
    text("Square wins!", 50, 100);
  if (mousePressed) screenNumber = 0;
}

void displayInstructions()
{
  fill(130);
  text("Bulk it up!", 170, height/2);
  fill(255);
  text("Click to start playing!", 170, 500);
  if (mousePressed) screenNumber = 1;
}

void displayScore()
{
  fill(255);
  text("Score:" + aScore, 5, 70);
  //text("Square: " + bScore, 400, 40);
}

void setSpeedLevel()
{
  speed = 10;
}

void drawPrize()
{
  fill(0,200,0);
  //rect(prizeX, prizeY, 10, 10);
  image(star, prizeX-5, prizeY-5);
}

void checkPrize()
{
  if(abs(x - prizeX) < 15 && abs(y - prizeY) < 15)
  {
    s = s + 10;
    placePrizeRandomly();
  }
}

void placePrizeRandomly()
{
  prizeX = random(width);
  prizeY = random(height);
}

void drawPlayers()
{
  fill(255,200);
  ellipse(x,y, s,s);
}


void keyPressed()
{
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == UP)    upPressed = true;
  if (keyCode == DOWN)  downPressed = true;
  if(key == 'p') s += 10;
}

void keyReleased()
{
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
}
void movePlayers()
{  
  if (rightPressed) x += speed;
  if (leftPressed)  x -= speed;
  if (upPressed)    y -= speed;
  if (downPressed)  y += speed;
}
void decreaseSize()
{
  s = s - p;
}

void gameover()
{
  background(0);
  fill(255);
  text("You failed to grow bigger!", 150, height/2);
  text("Press any key to restart!",150, height/3);
  if(mousePressed) screenNumber = 0;
}

  

void WrapAround()
{
  if(x - s > width) x = round(-s);
  if(x + s < 0) x = round(width + s);
  if(y - s > height) y = round(-s);
  if(y + s < 0) y = round(height + s);
}

void stop()
{
  player.close();
  input.close();
  minim.stop();
  super.stop();
}

void displayInst()
{
  smooth();
  fill(255);
  text("Press Arrow Keys to Move", 210 , 30);
}
  
void checkOverlap()
{
  if(dist(x,y, prizeX,prizeY) < 25)
  {
    aScore += 10;
  }
}

void timer()
{
  text("Time: " + time/60, 5,35);
}



