
//soheew@andrew.cmu.edu soheewoo copyright

int count;
int startTime, endTime, targetDisplayTime, NyanCatStartTime, gameTime;
int gamePhase;
color targetColor;
 
float x,y, fx,fy, fd, fxSpeed, fySpeed, diam;
 
PImage rainbow, nyancat;


 
void setup()
{
  size(400,400);
  count=0;
  startTime=0;
  targetDisplayTime=10;
  gamePhase=0;
  endTime=0;
  gameTime=10000;
   
  fx=random(width);
  fy=random(height);
  fxSpeed=10;
  fySpeed=8;
  fd=30;
   
   
  textSize(20);
 textAlign(CENTER);
  imageMode(CENTER);
 nyancat = loadImage ("nyancat.png");
  rainbow = loadImage ("rainbow.png");
}
 
void draw()
{
  background(142,31,255);
   
  if (gamePhase==0)
  {showInstructions();}
   
  else if (gamePhase==1)
  { playGame();}
   else
  {score();}
 

}
 
 
void score()
{background (0);
  fill(255);
  text("Yum", width/2, 200);
  text("You ate"+ count + "rainbows!", width/2, 220);
   
  if (count <25)
  {
    text ("Where are my rainbows??!!", width/2, 150);  
  }
  else if (count <40)
  { text ("Ooo I'm feeling full", width/2, 150);}
   
  else
  {text ("Now THAT is what I call a meal!", width/2, 150);}
   
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
  text("You ate "+ count + "rainbows!", width/2, 220);
}
 
void drawRainbow ()
{
  diam = 50;
  image (rainbow, fx,fy, diam, diam);
  
}
 
void checkHit()
{
  float d=dist(fx,fy, mouseX, mouseY);
  if (d< diam/2)
  {
    count++;
      fill(255);
     rect(0,0,width,height);
  NyanCatStartTime=0;
  }
}
 
 
 
void moveRainbow()
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
 
void drawNyancat()
{image (nyancat, mouseX, mouseY, 100,100);}
 
void playGame()
{
  moveRainbow();
  drawRainbow();
  drawNyancat();
  checkHit();
  showScore();
  checkTime();
}
 
void showInstructions()
{
  background (0);
  text("Let the Kitty Eat the Rainbow", width/2, 170);
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
  


