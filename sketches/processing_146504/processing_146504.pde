
//Multi-key stuff------------------
import java.awt.event.KeyEvent;
boolean[] keys = new boolean[526];
//Multi-key stuff------------------



// CONSTANTS
// ----------------
final int SCREEN_WIDTH = 800;
final int SCREEN_HEIGHT = 600;

final int PADDLE_WIDTH=20;
final int PADDLE_HEIGHT=70;

final int BALL_WIDTH=20;
final int BALL_HEIGHT=20;


// MEMBER VARIABLES
// ----------------
int p1x;
int p1y;//paddle 1

int p2x;
int p2y;//paddle 2

int p1score;
int p2score;

int ballx;
int bally;

int speedx;
int speedy;

PImage italian_dino_goat;


// SETUP
// ----------------
void setup(){
  size(800,600);
  p1x = 0 ;
  p1y = SCREEN_HEIGHT/2;
  
  p2x = SCREEN_WIDTH-PADDLE_WIDTH-1;
  p2y = SCREEN_HEIGHT/2;

  p1score = 0;
  p2score = 0;
  
  ballx = SCREEN_WIDTH/2;
  bally = SCREEN_HEIGHT/2;
  
  speedx=8;
  speedy=2;

  italian_dino_goat=loadImage("goat.jpg");
  //italian_dino_goat.resize(SCREEN_WIDTH,SCREEN_HEIGHT);
}


// DRAWING
// ----------------
void draw(){

  handleControls();
  
  
  background(0,0,0);//clear all
  
  italian_dino_goat.resize(SCREEN_WIDTH,SCREEN_HEIGHT);
  image(italian_dino_goat, 0, 0);
  
  fill(255,0,0);
  rect(p1x, p1y, PADDLE_WIDTH, PADDLE_HEIGHT);
  
  fill(0,0,255);
  rect(p2x, p2y, PADDLE_WIDTH, PADDLE_HEIGHT);//DRAW PADDLES
  
  ballx=ballx+speedx;
  bally=bally+speedy;//move ball
  
  handleCollisions();
 
  if(ballx<SCREEN_WIDTH/2)
  {
    fill(255,0,0);
  }
  else
  {
    fill(0,0,255);
  }
  rect(ballx, bally, BALL_WIDTH, BALL_HEIGHT);// DRAW BALL
  
 
  fill(255,0,0);
  text("score"+p1score, 10,10); //draw score
  
  fill(0,0,255);
  text("score"+p2score, SCREEN_WIDTH-50,10);
}


void handleCollisions()
{
   //-----------------------------------------------------------------------------------------
  if (ballx >= SCREEN_WIDTH - PADDLE_WIDTH - BALL_WIDTH) //if ball hits right side of screen
  {
    if(bally>p2y  && bally<p2y+PADDLE_HEIGHT) //if ball hits paddle
    {
      speedx=speedx*-1; //flip x direction
      ballx=SCREEN_WIDTH - PADDLE_WIDTH -BALL_WIDTH; //move ball to the right edge
    }
    else
    {
      p1score = p1score + 1;
      ballx = SCREEN_WIDTH/2;
      bally = SCREEN_HEIGHT/2;
    }
  }
  
 
 //-----------------------------------------------------------------------------------------
  if (ballx <= 0+PADDLE_WIDTH) //if ball hits LEFT side of screen
  {
    if(bally>p1y  && bally<p1y+PADDLE_HEIGHT) //if ball hits paddle
    {
      speedx=speedx*-1; //flip x direction
      ballx=0+PADDLE_WIDTH; //move ball to the left edge
    }
    else
    {
      p2score = p2score + 1;
      ballx = SCREEN_WIDTH/2;
      bally = SCREEN_HEIGHT/2;
    }
  }
  
  //-----------------------------------------------------------------------------------------
  if (bally >= SCREEN_HEIGHT-BALL_HEIGHT) //if ball hits bottom side of screen
  {
    speedy=speedy*-1; //flip y direction
    bally=SCREEN_HEIGHT-BALL_HEIGHT; //move ball to the bottom edge
  }
  
 
  
  //-----------------------------------------------------------------------------------------
  if (bally <= 0) //if ball hits top side of screen
  {
    speedy=speedy*-1; //flip y direction
    bally=0; //move ball to the top edge
  }
}


void handleControls()
{
  
    //HANDLE CONTROLS
    //'W' = 87
  if(checkKey(87))//w playerl and stuff press
  {
    p1y=p1y-5;//up miving player I
    if (p1y < 0)//too far up than fail
    {
      p1y=0;//reset cheese at top CCCCCCCCHHHHHHHHHEEEEEEEEEESSSSSSSSSEEEEEEEEE... cheese
    }
  }
  
  //'S' = 83
  if(checkKey(83))
  {
    p1y=p1y+5;
    if (p1y>SCREEN_HEIGHT- PADDLE_HEIGHT)
    {
      p1y=SCREEN_HEIGHT-PADDLE_HEIGHT;
    }
  }
  
  //UP = 87
  if(checkKey(38))
  {
    p2y=p2y-5;
    if (p2y < 0)
    {
      p2y = 0;
    }
  }
  
  //DOWN = 40
  if(checkKey(40))
  {
    p2y=p2y+5;
    if (p2y > SCREEN_HEIGHT-PADDLE_HEIGHT)
    {
      p2y=SCREEN_HEIGHT-PADDLE_HEIGHT;
    }
  }
  
}

//==========================================
//    Helper code: Multi-key handling
//==========================================
boolean checkKey(int k)
{
  
  if (keys.length >= k) {
    return keys[k];  
  }
  return false;
  
}
 
void keyPressed()
{ 
  keys[keyCode] = true;
  println(KeyEvent.getKeyText(keyCode));
  if(checkKey(CONTROL) && checkKey(KeyEvent.VK_S)) println("CTRL+S");
}
 
void keyReleased()
{ 
  keys[keyCode] = false; 
}


