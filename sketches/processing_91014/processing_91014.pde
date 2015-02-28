
//sahana kumar
//homework 7
//copyright 2013 sahana@cmu.edu

int count;
int startTime, endTime, targetDisplayTime, frogStartTime, gameTime;
int gamePhase;
color targetColor;

float x,y, fx,fy, fd, fxSpeed, fySpeed, diam;

PImage fly, frog, pond;

void setup()
{
  size(400,400);
  count=0;
  startTime=0;
  targetDisplayTime=1000;
  gamePhase=0;
  endTime=0;
  gameTime=10000;
  
  fx=random(width);
  fy=random(height);
  fxSpeed=2; 
  fySpeed=3;
  fd=30;
  
  
  textSize(20);
 textAlign(CENTER);
  imageMode(CENTER);
 pond = loadImage ("pond.jpg");
  fly = loadImage ("fly.png");
frog = loadImage("frg.png");
}

void draw()
{
  background(62, 131, 84);
  
  if (gamePhase==0)
  {showInstructions();}
  
  else if (gamePhase==1)
  { playGame();}
   else
  {score();}

//image(frog, 1, 2, 150,150);
}





void score()
{background (0);
  fill(255);
  text("You're Finished!", width/2, 200);
  text("You ate"+ count + "flies!", width/2, 220);
  
  if (count <40)
  {
    text ("Sorry, you're a loser!", width/2, 150);   
  }
  else if (count <40)
  { text ("Yummy! You're not bad at catching flies!", width/2, 150);}
  
  else 
  {text ("You are AWESOME!", width/2, 150);}
  
}

void checkTime()
{
  fill(255);
  text ("You've got" + (gameTime/1000-(millis()-startTime)/1000) + "seconds left.", width/2, 100);
  
  if ( (millis()-startTime)>gameTime)
  {gamePhase =2;}

}

void showScore()
{
  fill(255);
  text("You ate "+ count + "flies!", width/2, 220);
}

void drawFly ()
{
  diam = 40;
  image (fly, fx,fy, diam, diam);
 
}

void checkHit()
{
  float d=dist(fx,fy, mouseX, mouseY);
  if (d< diam/2)
  {
    count++;
      fill(255);
     rect(0,0,width,height);
  frogStartTime=0;
  }
}



void moveFly()
{
  fx=fx+fxSpeed;
  
  if (fx>width)
  {fxSpeed=-fxSpeed;}
  else if (fx<0)
  {fxSpeed=-fxSpeed;}
  
  fy=fy+fySpeed;
  if (fy>height)
  {fySpeed=-fySpeed;}
  else if (fy<0)
  {fySpeed=-fySpeed;}}

void drawFrog()
{image (frog, mouseX, mouseY, 100,100);}

void playGame()
{
  moveFly();
  drawFly();
  drawFrog();
  checkHit();
  showScore();
  checkTime();
}

void showInstructions()
{
  background (0);
  text("Move frog with mouse to eat the flies!", width/2, 170);
  text("Click to start!", width/2, 220);
}

void mousePressed()
{
  if (gamePhase==0);
  {
    gamePhase=1;
    startTime=millis();
  }
}
  



