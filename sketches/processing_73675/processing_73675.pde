
//Gloriana Gonzalez
//gloriang@andrew.cmu.edu
//Homework #7
//Copyright Gloriana Gonzale, Pittsburgh, October 2012

float tx, ty, deltaX, deltaY, deltaX1, deltaY1, deltaX2, deltaY2;
float timerx, timery, startTime;
float easeX, easeY, inc;
int count; 
PImage cane;
PImage elf;
float cx, cy, cx1, cy1, cx2, cy2;
float ew, eh;
int gameStage;
PImage snow;

void setup()
{
  size (400, 400);
  smooth();
  tx=random(width*.1, width*.9);
  ty=random(height*.1, height*.9);
  timerx= width*.55;
  timery= height*.95;
  easeX=width/2;
  easeY=height/2;
  inc=.01;
  count=0;
  cane= loadImage ("Cane.png");
  elf= loadImage ("Elf.png");
  snow=loadImage ("Snow.jpg");
  cx= 0;
  cy= random (100, 300);
  cx1= random (50, 350);
  cy1= 0;
  cx2= 0;
  cy2= 0;
  ew= elf.width*.1;
  eh= elf.height*.1;
  deltaX=1;
  deltaY=1;
  deltaX1=1;
  deltaY1=1;
  deltaX2=1;
  deltaY2=1;
  frameRate(60);
  gameStage=0;
  startTime=0;

}


void draw()
{
  background (255, 50);
  if (gameStage== 0)
  {
    showInstructions();
  }
  else if (gameStage == 1)
  {
    playGame();
  }
  else if (count == 20)
  {
    win();
  }
}


//This function codes the game
void playGame()
{
  timer(timerx, timery);
  elf();
  candyCane(cane, cx, cy, cane.width, cane.height);
  candyCane(cane, cx1, cy1, cane.width, cane.height);
  candyCane(cane, cx2, cy2, cane.width, cane.height);
  bounceCane();
  showCollisions (timerx, timery*.95);
  collision();
  win();
}

//This function sets the screen for when you win the game

void win()
{
  if (count>10)
  {
   fill (255, 0, 0);
   image (snow, 0,0);
   image(elf, width*.4, height*.6);
   textSize(30);
   text("YOU WIN!!!!!", width *.19, height*.3);
   noLoop();
  }
}


//This function shows the timer on the screen
void timer(float x, float y)
{
   fill (0);
   text("Time Played: " + (millis()/1000- startTime) + " seconds", x, y);
}

//This functions shows the number of collisions on the screen
void showCollisions (float x, float y) 
{
  fill(0);
  text("COLLISIONS: " + count,  x, y);
}



//This function determines when the elf collides with the cane. 
//The elf grows with every collision
// The canes change speed with every collision
//Get 10 collisions and WIN!

void collision()
{
  if ( dist(cx, cy, easeX, easeY) <  ew*.5) 
  {
      count=count+1;
      cy= random (100, 300);
      ew=ew*1.1;
      eh=eh*1.1;
      background(color(random(255), random(255), random(255)));
      deltaY= random(2, 5);
      deltaX= random(2, 5);
    
   

  }
  else if (dist(cx1, cy1, easeX, easeY) <  ew*.5)
   {
      count=count+1;
      cx1= random (50, 350);
      ew=ew*1.1;
      eh=eh*1.1;
      background(color(random(255), random(255), random(255)));
      deltaX1=random(2, 5);
      deltaY1=random(2, 5);
     
   }
   
  else if (dist(cx2, cy2, easeX, easeY) < ew*.5 )
  {
      count=count+1;
      cx2= random (50, 350);
      ew=ew*1.1;
      eh=eh*1.1;
      background(color(random(255), random(255), random(255)));
      deltaX2=random(2, 5);
      deltaY2=random(2, 5);
  }
  
}



void candyCane (PImage cane, float x, float y, float wd, float ht)
{
  image (cane, x, y, wd, ht);
}



//This function bounces the canes around
void bounceCane()
{
  cx += deltaX;
  cy += deltaY;
  
  if(cx>width-cane.width || cx<0)
    {
      deltaX= -deltaX;
    }
   if(cy>height-cane.height || cy <0)
    {
      deltaY=-deltaY;
    }
  
  cx1 += deltaX1;
  cy1 += deltaY1;
  
  if(cx1>width-cane.width || cx1<0)
    {
      deltaX1= -deltaX1;
    }
   if(cy1>height-cane.height || cy1 <0)
    {
      deltaY1=-deltaY1;
    }
    
  cx2 += deltaX2;
  cy2 += deltaY2;
  
  if(cx2>width-cane.width || cx2<0)
    {
      deltaX2= -deltaX2;
    }
   if(cy2>height-cane.height || cy2 <0)
    {
      deltaY2=-deltaY2;
    }
   
}




//This function draws the elf and moves it around with the use of the mouse.  
//If the elf goes off the screen it will be relocated to the center of the screen
//and the score will go to zero.

void elf()
{
  fill(255, 10);
 image (elf, easeX, easeY, ew, eh);
  easeX= easeX + (-mouseX+easeX)*inc;
  easeY= easeY + (-mouseY+easeY)*inc;
  if (easeX> width+width*.05 || easeX< 0-width*.05 || easeY> height+width*.05 ||easeY< 0-height*.05)
 {
   easeX=width/2;
   easeY= height/2;
   count=0;
   ew=elf.width*.1;
   eh=elf.height*.1;
 }  
}




//This allows you to pause the game
void keyPressed ()
{
  if (keyCode == 'P')
  {
    text("PAUSE", width*.4, height*.4);
    noLoop();
  }
  else if (keyCode == 'S')
  {
    loop();
  }
   if (keyCode == ' ')
  {
    gameStage = 1;
    startTime=millis()/1000;
  }
}



void showInstructions( )
{
   fill( 30, 70, 10);
   rect( 0, 0, width, height);
   fill(255);
   text( "Move the elf around to catch and eat", width/6, 140);
   text("the candy cane and make him grow!", width/6, 160 ); 
   text("Press space bar to play the game.", width/5.5, 180 );
   text("If elf goes off screen your score will restart!", width/6, 220 );
}



//WIN


