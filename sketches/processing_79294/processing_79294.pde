
//Will Slotterback CP1 16-17
int dir=0;
int x = 300;
int y = 550;
int f = 100;
int levely =0;
int levely2 =0;
int levelW= int(random(0, 541));
int levelW2= int(random(0, 541));
int score=0;
int hiScore = 0;
boolean gameOver = false; //keeps track of whether game is over or not

void setup()
{
  size(600, 600);
  background(0);
}

void draw()
{
  if (gameOver==true) 
  {
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text("GAME OVER: Press the mouse to restart.", 300, 200);
  }
  else //can only play if game is not over
  {  
    human();
  }
}


void human()
{
  if (get(x, y) ==color(0, 200, 0))
  {
    gameOver= true;
  }
  frameRate(f);
  background(0);
  fill(255);
  text("Score: " + score, 510, 40);
  text("High Score: " + hiScore, 510, 20);
  stroke(245, 10, 10);
  strokeWeight(13);
  point (x, y);
  if ( dir==RIGHT)
  {
    if (x>598)
    {
      x=-2;
      x=x+2;
    }
    x=x+2;
  }
  if (dir==LEFT)
  {
    if (x<1)
    {
      x=601;
      x=x-2;
    }
    x=x-2;
  }
  if (dir==UP)
  {
    if (y<1)
    {
      y=601;
      y=y-2;
    }
    y=y-2;
  }
  if (dir==DOWN)
  {
    y=y+2;
  }
  noStroke();
  fill(0, 200, 0);
  //first block
  rect(0, levely, levelW, 20);
  rect(levelW+60, levely, 600, 20);
  levely=levely+1;
  // second block
  rect(0, levely-550, levelW2, 20);
  rect(levelW2+60, levely-550, 600, 20);
  levely=levely+1;
  // When Bar gets to the bottom
  if (levely>1150)
  {
    levely=0;
    levelW=int(random(0, 541));
    levelW2=int(random(0, 541));
    f=f+20;
    // Score Tracker
    score++;
    if (score>hiScore)
    {
      hiScore=score;
    }
  }
  // Can't cheat by going from bottom to top
  if (y>600)
  {
    gameOver=true;
  }
}

void keyPressed()// controls for the player
{
  if (keyPressed== true && key=='w')
  {
    dir=UP;
  }
  if (keyPressed== true && key=='a')
  {
    dir=LEFT;
  }
  if (keyPressed==true && key=='s')
  {
    dir=DOWN;
  }
  if (keyPressed== true && key=='d')
  {
    dir=RIGHT;
  }
}

void keyReleased()
{
  if (key=='a')
  {
    dir=0;
  }
  if (key=='w')
  {
    dir=0;
  }
  if (key=='s')
  {
    dir=0;
  }
  if (key=='d')
  {
    dir=0;
  }
}

void mousePressed() //for restarting the game
{
  if ( gameOver==true && mousePressed==true)
  {
    background(0);
    x=300;
    y=550;
    levely=0;
    dir=0;
    gameOver= false;
    levelW=int(random(0, 541));
    levelW2=int(random(0, 541));
    f=100;
    score=0;
  }
}
