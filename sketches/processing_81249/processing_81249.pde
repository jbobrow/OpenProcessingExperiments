
//Will Slotterback CP1 16-17
int dir=0;
int x = mouseX;
int y = mouseY;
int s = 1;
int col = int(random(1,4));
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
  x=mouseX;
  y=mouseY;
  if (get(x, y) ==color(0, 0, 255) || get(x, y) ==color(255, 0, 0)|| get(x, y) ==color(0, 200, 0) )
  {
    gameOver= true;
  }
  background(0);
  fill(255);
  text("Score: " + score, 510, 40);
  text("High Score: " + hiScore, 510, 20);
  stroke(255,255,255);
  strokeWeight(13);
  point (x, y);

  noStroke();
  if(col==1)
  {
    fill(0,200,0);
  }
  if(col==2)
  {
    fill(255,0,0);
  }
  if(col==3)
  {
    fill(0,0,255);
  }
  //first block
  rect(0, levely, levelW, 20);
  rect(levelW+60, levely, 600, 20);
  levely=levely+s;
  // second block
  rect(0, levely-550, levelW2, 20);
  rect(levelW2+60, levely-550, 600, 20);
  levely=levely+s;
  // When Bar gets to the bottom
  if (levely>1150)
  {
    col++;
    if(col>3)
    {
      col=1;
    } 
    levely=0;
    levelW=int(random(0, 541));
    levelW2=int(random(0, 541));
    if(s<7)
    {
    s++;
    }
    // Score Tracker
    score=score+2;
    if (score>hiScore)
    {
      hiScore=score;
    }
  }
}

void mousePressed() //for restarting the game
{
  if ( gameOver==true && mousePressed==true)
  {
    background(0);
    levely=0;
    dir=0;
    gameOver= false;
    levelW=int(random(0, 541));
    levelW2=int(random(0, 541));
    score=0;
    s=1;
  }
}
