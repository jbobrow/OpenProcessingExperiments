
float playerX=300; 
float playerY=640; 
float makeLaser=1;
float laserTimer=-1;
float laserX;
float laserY;
float moveLeft=0;
float moveRight=0;
float moveUp=0;
float slideTimer=-1;
float moveDown=0;
PImage player;
PImage slideUp;
PImage slideLeft;
PImage slideRight;
float noRush=0;
float rushLeft=1;
float rushRight=1;
float rushUp=1;
float canRush=0;

void setup()
{
  size(600,680);
  player = loadImage("Toy.png");
  slideUp = loadImage("SlideUp.png");
  slideLeft = loadImage("SlideLeft.png");
  slideRight = loadImage("SlideRight.png");
}

void draw()
{
  noStroke();
  fill(255);
  rect(0,0,600,680);
  //normal movement
    if(noRush==0)
    {
      image(player,playerX-62,playerY-48);
    }
    if(moveRight==1&&noRush==0)
    {
      playerX=playerX+4;
    }
    else if(moveLeft==1&&noRush==0)
    {
      playerX=playerX-4;
    }
    else if(keyPressed=false&&noRush==0)
    {
      playerX=playerX;
    }
    if(playerY<640&&noRush==0)
    {
      playerY=playerY+4;
    }
    if(playerY>640&&noRush==0)
    {
      playerY=640;
    }
    if(noRush==0);
    {
      if(makeLaser==1)
      {
        laserX=playerX+16;
        laserY=playerY-645;
        laserTimer=11;
      }
      if(makeLaser==0)
      {
        laserTimer--;
        fill(255,127,0);
        stroke(255,187,60);
        strokeWeight(2);
        rect(laserX,laserY,8,600);
      }
      if(laserTimer==0)
      {
        makeLaser=1;
      }
      if(laserTimer<0)
      {
        laserTimer=11;
        makeLaser=1;
      }
    }
  //
  //rush Left
  //
  if(rushLeft==0)
  {
    if(slideTimer<0)
    {
      slideTimer=9;
    }
    else if(slideTimer>0)
    {
      slideTimer--;
      image(slideLeft,playerX-88,playerY-70);
      playerX=playerX-16;
    }
    else if(slideTimer==0)
    {
      rushRight=1;
      rushUp=1;
      rushLeft=1;
      noRush=0;
      slideTimer=-1;
    }
  }
  //
  //rush right
  //
  if(rushRight==0)
  {
    if(slideTimer<0)
    {
      slideTimer=9;
    }
    else if(slideTimer>0)
    {
      slideTimer--;
      image(slideRight,playerX-88,playerY-70);
      playerX=playerX+16;
    }
    else if(slideTimer==0)
    {
      rushRight=1;
      rushUp=1;
      rushLeft=1;
      noRush=0;
      slideTimer=-1;
    }
  }
  //
  //rush Up
  //
  if(rushUp==0)
  {
    if(slideTimer<0)
    {
      slideTimer=9;
    }
    else if(slideTimer>0)
    {
      slideTimer--;
      image(slideUp,playerX-71,playerY-89);
      playerY=playerY-16;
    }
    else if(slideTimer==0)
    {
      rushRight=1;
      rushUp=1;
      rushLeft=1;
      noRush=0;
      slideTimer=-1;
    }
  }
  //
  //drawScore
  //
  fill(30,30,255);
  stroke(0);
  rect(0,0,600,150);
  if(canRush==1)
  {
    noStroke();
    fill(220,0,0);
    rect(500,37.5,75,75);
  }
}
void keyPressed() 
{ 
    if (key == 'a')
    {
      moveLeft=1;
      moveRight=0;
    }
    if (key == 'd')
    {
      moveRight=1;
      moveLeft=0;
    }
    if (key==' ')
    {
      if(moveRight==1)
      {
        noRush=1;
        rushRight=0;
      }
      if(moveLeft==1)
      {
        noRush=1;
        rushLeft=0;
      }
    }
    if(key=='w')
    {
      noRush=1;
      rushUp=0;
    }
    if(key=='l')
    {
      if(noRush==0&&makeLaser==1)
      {
        makeLaser=0;
      }
    }
}
void keyReleased() 
{
    if (key == 'a') 
    {
      moveLeft=0;
    } 
    if (key == 'd')
    {
      moveRight=0;
    }
    if (key == 'w') 
    {
      moveUp=0;
    } 
    if (key == 's')
    {
      moveDown=0;
    }
}


