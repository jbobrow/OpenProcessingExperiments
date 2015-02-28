
import ddf.minim.*;

// pong

Minim minim;
AudioSample pongSoundA,pongSoundB,pongSoundC;

Ball ball;
Player player;
CPU cpu;
int scorePlayer, scoreCPU, counter;
PFont fontA;
String score;
ArrayList winners;

void setup()
{
  // sound
  minim = new Minim(this);
  pongSoundA=minim.loadSample("pong1.mp3");
  pongSoundB=minim.loadSample("pong2.mp3");
  pongSoundC=minim.loadSample("pong3.mp3");
  
  scorePlayer = 0;
  scoreCPU = 0;
  counter=0;
  score="0:0";
  size(300, 300);
  // size(screen.width, screen.height);
  frameRate(30);
  ball = new Ball();
  player = new Player( 10.0 , height/2);
  cpu = new CPU( width-10.0 , height/2);
  winners=new ArrayList();
  for(int x=0; x<5; x++)
  {
    winners.add("---");
  }
  winners.set(0,"Winners:");
  
  // other stuff
  fontA = loadFont("BigNoodleTitling-24.vlw");
  textFont(fontA, 24);  
}

void draw()
{
  counter++;
  ball.update();
  player.update();
  cpu.update(ball.y, counter);

  // collisions CPU
  if ((abs(ball.x-cpu.x)<ball.radius/2) && (abs(ball.y-cpu.y)<cpu.paddlesize/2))
  {
    // easy collision
    ball.dir.x=-1;
    ball.dir.y=(ball.y-cpu.y)/cpu.paddlesize*2;
    ball.dir.normalize();
    pongSoundB.trigger();
  }
  
  // colision player
  if ((abs(ball.x-player.x)<ball.radius/2) && (abs(ball.y-player.y)<player.paddlesize/2))
  {
    // easy collision
    ball.dir.x=1;
    ball.dir.y=(ball.y-player.y)/player.paddlesize*2;
    ball.dir.normalize();
    pongSoundA.trigger();
  }
  
  // reset ball conditions
  if (ball.x<-5)
  {
    scoreCPU++;
    ball.reset();
  }
  
  if (ball.x>width+5)
  {
    scorePlayer++;
    ball.reset();
  }
  
  // reset game conditions
  if (scorePlayer>4)
  {
    scorePlayer=0;
    scoreCPU=0;
    
    winners.remove(0);
    winners.add("Player");
    winners.set(0,"Winners:");
  }
  if (scoreCPU>4)
  {
    scorePlayer=0;
    scoreCPU=0;
    
    winners.remove(0);
    winners.add("CPU");
    winners.set(0,"Winners:");
  }
  
  // -------------- Screen updates -------------------
  // background(0.0,12);
  fill(0, 128);
  rect(0, 0, width, height);

  // write score
  fill(255.0);
  score=str(scorePlayer)+":"+str(scoreCPU);
  text(score,width/2-textWidth(score)/2,50);
  
  // writte winners
  fill(50.0);
  for (int x=0; x<winners.size(); x++)
  {
    String temp=(String) winners.get(x);
    text(temp,50.0,120.0+x*24.0);
  }
    
  ball.display();
  player.display();
  cpu.display();
}

// --------------------------------------------------------
// objects
// --------------------------------------------------------

class Ball
{
  float x;
  float y;
  PVector dir;
  float speed;
  float radius;
  
  Ball()
  {
    reset();
  }

  void reset()
  {
    x=width/2;
    y=height/2;
    dir = new PVector(1.0,0.1);    
    dir.normalize();
    speed=6.0;
    radius=10.0;
  }

  void update()
  {
    x+=dir.x*speed;
    y+=dir.y*speed;
    
    if ((y<0) || (y>height))
    {
      dir.y=dir.y*-1;
      pongSoundC.trigger();
    }
    
  }
  
  void display()
  {
    fill(255.0);
    ellipse( x, y, radius, radius);
  }
}


// player
class Player
{
  float x,y;
  float paddlesize=30.0;
  
  Player(float tX, float tY)
  {
    x=tX;
    y=tY;
  }
  
  void update()
  {
    y=mouseY;
    if (y<paddlesize/2)
    {
      y=paddlesize/2;
    }
    if (y>height-paddlesize/2)
    {
      y=height-paddlesize/2;
    }
  }
  
  void display()
  {
    fill(255.0,0,0);
    rect(x-5,y-paddlesize/2,5,paddlesize);
  }
}

// cpu
class CPU
{
  float x,y;
  float paddlesize=30.0;
  float speed=3.3;
  
  CPU(float tX, float tY)
  {
    x=tX;
    y=tY;
  }
  
  void update(float targetY, int counter)
  {
    // x=width-10.0;
    y=y+constrain(targetY-y,-speed,speed);
    
    if (y<paddlesize/2)
    {
      y=paddlesize/2;
    }
    if (y>height-paddlesize/2)
    {
      y=height-paddlesize/2;
    }
  }
  
  void display()
  {
    fill(0,255.0,0);
    rect(x,y-paddlesize/2,5,paddlesize);
  }
}

