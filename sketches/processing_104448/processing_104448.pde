
//Constants
int WIDTHint=600;
int HEIGHTint= 400;
float WIDTH =(float)WIDTHint;
float HEIGHT = (float)HEIGHTint;
float GUTTER= WIDTH/40;
double SCORE1POS = WIDTH/10*3; 
double SCORE2POS = WIDTH - SCORE1POS;
float PLAYERHEIGHT = HEIGHT/10*2;
float MAXSPEED = 1;
float MINSPEED = 0.5;
float BALLSIZE = WIDTH/40;

//PImage backgroundImg;



//variables
float ballRx;
float ballRy;
float ballRSpeedx;
float ballRSpeedy;
float ballBx;
float ballBy;
float ballBSpeedx;
float ballBSpeedy;
float ballx;
float bally;
float ballSpeedx;
float ballSpeedy;
int score1;
int score2;
float player1y;
float player2y;
boolean ballInPlay;
int round1;
int round2;
float player1yVel;
float player2yVel;


void setup()
{
  size(600,400);
  background(255);
  smooth();
  //backgroundImg = loadImage("scrapyard2.jpg");
  //set player 1 and player 2 y position
  player1y=HEIGHT/2;
  player2y=player1y;
  player1yVel=0;
  player2yVel=0;
  //set scores to 0 and round scores to 0
  score1=0;
  score2=0;
  round1=0;
  round2=0;
  //initially ball is not in play
  ballInPlay = false;
  ballx=WIDTH/2;
  bally=HEIGHT/2;
  ballSpeedx=0;
  ballSpeedy=0;
  ballRx=WIDTH/2;
  ballRy=HEIGHT/2;
  ballRSpeedx=0;
  ballRSpeedy=0;
  ballBx=WIDTH/2;
  ballBy=HEIGHT/2;
  ballBSpeedx=0;
  ballBSpeedy=0;
 
}

void initB()
{
  //initially ball is not in play
  ballInPlay = false;
  ballx=WIDTH/2;
  bally=HEIGHT/2;
  ballSpeedx=0;
  ballSpeedy=0;
  ballRx=WIDTH/2;
  ballRy=HEIGHT/2;
  ballRSpeedx=0;
  ballRSpeedy=0;
  ballBx=WIDTH/2;
  ballBy=HEIGHT/2;
  ballBSpeedx=0;
  ballBSpeedy=0;
}

void draw()
{
  if(ballInPlay)
  {
    //image(backgroundImg, 0, 0, width, height);
    background(255);
  }
  else{
  background(255);
  fill(0,0,255);
  textSize(32);
  text("PLAYER 1 ROUNDS WON: " + round1,GUTTER*5,GUTTER*5);
  fill(255,0,0);
  text("PLAYER 2 ROUNDS WON: " + round2,GUTTER*5,GUTTER*10);
  fill(0,0,0);
  textSize(16);
  text("Click anywhere between the two yellow lines to get the round started!",GUTTER*2,GUTTER*14);
  text("player gets +2 points for scoring a ball of the same color",GUTTER*2,GUTTER*16);
  text("player gets +1 points for scoring a black or other players color",GUTTER*2,GUTTER*18);
  text("player loses -1 points for having a none black ball scored at her/him!",GUTTER*2,GUTTER*20);
  text("round ends if any of the players score is greater than 10 or bellow -10!",GUTTER*2,GUTTER*22);
  
  
  }
  
  stroke(0);
  line(WIDTH/2,0,WIDTH/2,HEIGHT);
  stroke(255,255,0);
  line(GUTTER*10,0,GUTTER*10,HEIGHT);
  line(WIDTH - GUTTER*10,0,WIDTH - GUTTER*10,HEIGHT);
  
  //draw player 1
  player1y +=player1yVel;
  fill(0,0,255);
  rect(0,player1y-PLAYERHEIGHT/2,GUTTER,PLAYERHEIGHT);
  //draw player 2
  player2y +=player2yVel;
  fill(255,0,0);
  rect(WIDTH-GUTTER,player2y-PLAYERHEIGHT/2,GUTTER,PLAYERHEIGHT);
  
  //draw ball
  if(ballInPlay)
  {
    fill(0,0,0);
    ellipse(ballx,bally,BALLSIZE,BALLSIZE);
    
    fill(255,0,0);
    ellipse(ballRx,ballRy,BALLSIZE,BALLSIZE);
    
    fill(0,0,255);
    ellipse(ballBx,ballBy,BALLSIZE,BALLSIZE);
  
  
  //update position for ball
  updateBall(0,ballx,bally,ballSpeedx,ballSpeedy);
  updateBall(1,ballRx,ballRy,ballRSpeedx, ballRSpeedy);
  updateBall(2,ballBx,ballBy,ballBSpeedx, ballBSpeedy);
  }

  
  //Display Score
  fill(0,0,255);
  text(score1,GUTTER*5,GUTTER*2);
  fill(255,0,0);
  text(score2,WIDTH-GUTTER*5,GUTTER*2);
  
  if (score1> 10 || score2 < -10)
  {
    round1 +=1;
    score1=0;
    score2=0;
    initB();
  }
  else if(score2> 10 || score2 < -10)
  {
    round2 +=1;
    score1=0;
    score2=0;
    initB();
  }
  
}

void mousePressed()
{
  if(!ballInPlay && mouseX > GUTTER*10 && mouseX < (WIDTH -GUTTER*10)) 
  {
    ballx = mouseX;
    bally = mouseY;
    ballSpeedy = random(MINSPEED,MAXSPEED);
    if(random(0,1)>0.5)
    {
      ballSpeedy = -1*ballSpeedy;
    }
    
    ballSpeedx = ballSpeedy*2;
    if(random(0,1)>0.5)
    {
      ballSpeedx = -1*ballSpeedx;
    }
    
    ballRSpeedy = random(MINSPEED,MAXSPEED);
    if(random(0,1)>0.5)
    {
      ballRSpeedy = -1*ballRSpeedy;
    }
    
    ballRSpeedx = ballRSpeedy*2;
    if(random(0,1)>0.5)
    {
      ballRSpeedx = -1*ballRSpeedx;
    }
    
    ballBSpeedy = random(MINSPEED,MAXSPEED);
    if(random(0,1)>0.5)
    {
      ballBSpeedy = -1*ballBSpeedy;
    }
    
    ballBSpeedx = ballBSpeedy*2;
    if(random(0,1)>0.5)
    {
      ballBSpeedx = -1*ballBSpeedx;
    }
    
    ballInPlay=true;
  }
}


void keyPressed()
{
  //move player one
  if (key=='s')
  {
    player1yVel = 10;
  }
  else if(key=='w')
  {
    player1yVel =-10;
  }
  
  if (keyCode==UP)
  {
    player2yVel =-10;
  }
  else if(keyCode==DOWN)
  {
    player2yVel =10;
  }
}

void keyReleased()
{
    //move player one
  if (key=='s')
  {
    player1yVel = 0;
  }
  else if(key=='w')
  {
    player1yVel =0;
  }
  
  if (keyCode==UP)
  {
    player2yVel =0;
  }
  else if(keyCode==DOWN)
  {
    player2yVel =0;
  }
}


void updateBall(int type, float tempballx, float tempbally, float tempballSpeedx,float tempballSpeedy ) //type =0 is black ball, type=1 is Red ball and type=2 is Blue ball
{
  if (tempballx > (WIDTH-GUTTER)) // scored at player 2
  {
    tempballx = WIDTH/2;
    tempbally = HEIGHT/2;
    tempballSpeedy = random(MINSPEED,MAXSPEED);
    if(random(0,1)>0.5)
    {
      tempballSpeedy = -1*tempballSpeedy;
    }
    
    tempballSpeedx = tempballSpeedy*3;
    if(random(0,1)>0.5)
    {
      tempballSpeedx = -1*tempballSpeedx;
    }
    if (type==0 || type==1)
      {
        score1 = score1 + 1;
        if(type ==1)
        {
          score2 = score2 -1;
        }
      }
    else
    {
      score1 = score1 + 2;
      score2 = score2 - 1;
    }
  }
  else if(tempballx < GUTTER) //scored at player 1
  {
    tempballx = WIDTH/2;
    tempbally = HEIGHT/2;
    tempballSpeedy = random(MINSPEED,MAXSPEED);
    if(random(0,1)>0.5)
    {
      tempballSpeedy = -1*tempballSpeedy;
    }
    
    tempballSpeedx = tempballSpeedy*3;
    if(random(0,1)>0.5)
    {
      tempballSpeedx = -1*tempballSpeedx;
    }
    
    if (type==0 || type==2)
      {
        score2 = score2 + 1;
        if(type ==2)
        {
          score1 = score1 -1;
        }
      }
    else
    {
      score2 = score2 + 2;
      score1 = score1 -1;
    }
    
    
  }
  else
  {
    if(tempbally <0 || tempbally >HEIGHT ) //bounce
    {
      tempballSpeedy = -1.05*tempballSpeedy;
      tempbally += tempballSpeedy;
      
    }
    else
    {
      tempbally += tempballSpeedy;
    }
    
    if( ((tempballx ) < (BALLSIZE/2 + GUTTER)) && ( ((player1y-PLAYERHEIGHT/2 - BALLSIZE/2) < tempbally) && ((player1y + PLAYERHEIGHT/2 + BALLSIZE/2) > tempbally)) )//bounce the ball
    {
      tempballSpeedx = -1.1*tempballSpeedx;
      tempballx += tempballSpeedx;

      
    }
    else if( ((tempballx ) > (WIDTH - BALLSIZE/2 - GUTTER)) && ( ((player2y-PLAYERHEIGHT/2 - BALLSIZE/2) < tempbally) && ((player2y + PLAYERHEIGHT/2 + BALLSIZE/2) > tempbally)) )
    {
      tempballSpeedx = -1.05*tempballSpeedx;
      tempballx += tempballSpeedx;

    }
    else
    {
      tempballx += tempballSpeedx;
      tempbally += tempballSpeedy;
    }
  }
  
  if (type==0)
  {
    ballx = tempballx;
    bally = tempbally;
    ballSpeedx = tempballSpeedx;
    ballSpeedy = tempballSpeedy;
  }
  else if(type==1)
  {
    ballRx = tempballx;
    ballRy = tempbally;
    ballRSpeedx = tempballSpeedx;
    ballRSpeedy = tempballSpeedy;
  }
  else
  {
    ballBx = tempballx;
    ballBy = tempbally;
    ballBSpeedx = tempballSpeedx;
    ballBSpeedy = tempballSpeedy;
    
  }
   
}







