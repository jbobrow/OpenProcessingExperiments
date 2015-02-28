
//hw7
//copyright jingjing chen jingjin1@andrew.cmu.edu

int count,startTime,endTime,ballDisplayTime,ballStartTime,totalBallTime,gameTime,gamePhase;
float dlx,dly,tx,ty,introSpeed;
float x,y,x1,y1,x2,y2,diam;
float rx=width;
color ballColor,textColor;
PImage img;

void setup()
{
  background(255);
  size(600,400);
  smooth();
  textAlign(CENTER);
  ballColor = color(255,0,0);
  textColor = color(#0A73CB);
  endTime = 0;
  gamePhase = 0;     
  ballDisplayTime =1000;
  gameTime = 10000;
  startTime = 0;
  introSpeed=0.5; 
  img = loadImage("win.jpg");
}

void draw()
{
  fill(255);
  rect(0,0,width,height);
  if(gamePhase == 0)
  {
    showInstructions();
  }
    else if (gamePhase == 1)
  {
     playGame();
  }
    else 
  {
    gameOver();
  }
}

void gameOver()
{
  fill(textColor);
  textSize(20);  
  if ( count < 5 )
  { 
    firstDoor();
    pushStyle();
    ballShine();
    ballsOndoor();
    popStyle();
    text("You Got" +" "+ count +" " + "Dragon"+" "+"Balls", width/2, height*0.44);
    text(":(",width/2,height*0.35);
    text("keep moving! get all the Dragon Balls", width/2, height*0.6);
    pushStyle();
    ballShine();
    textSize(14);
    text("Press DOWN arrow to restart",width*0.5, height*0.85);
    popStyle();
  }  
  if(count ==5)
  {
    gameWin();
  }
}

void ballShine()
{
  float c=millis()/5;
  fill(c % 255,0,0);
}

void gameWin()
{    
  ballShine();
  imageMode(CENTER);
  image(img, width/2, height/2);
  textSize(14);
  text("Press DOWN arrow to restart",width*0.5, height*0.85);
}

void timer()
{ 
  fill(textColor);
  textAlign(CENTER); 
  int currentTime = millis();
  float j = gameTime/1000 - (currentTime- startTime)/1000;
  int r = floor(j);
  textSize(12);
  text( "Time Remaining: " + r, width/2, height*0.9 );
  pushStyle(); 
  textSize(17);
  text("You still have to get"+"  "+(5-count)+"  "+"Dragon Balls",width/2,height/6);
  popStyle();
  if(  (5-count)==0)
  { 
    gamePhase = 2;
    gameWin();
  }
  if (currentTime - startTime > gameTime)
  {
    gamePhase = 2;
  } 
}

void mousePressed()
{
  float d = dist(x,y,mouseX,mouseY);
  if (d<diam/2)
  {
    count++;
    ballShine();
    ballsOndoor2();
    ballStartTime = 0;
  }
}

void drawTarget()
{
  noStroke();
  totalBallTime = millis()-ballStartTime;
  if( totalBallTime > ballDisplayTime )
  { 
   x = random(width/30,width-width/30);
   y = random(height/20,height-height/20);
   x1 = random(width/30,width-width/30);
   y1 = random(height/20,height-height/20);
   x2 = random(width/30,width-width/30);
   y2 = random(height/20,height-height/20);
   diam = width/20;
   ballStartTime = millis();
  }
  fill(ballColor);
  ellipse(x,y,diam,diam);
  fill(#0A73CB);
  ellipse(x1,y1,diam,diam);
  fill(#FFF305);
  ellipse(x2,y2,diam,diam);
}

void playGame()
{  
  drawTarget();
  firstDoor();
  ballsOndoor();
  drawTarget();
  ballsOndoor();
  ballsOndoor2();
  firstDoor();
  timer();
}

void firstDoor()
{  
  stroke(100);
  strokeWeight(2);
  strokeJoin(ROUND);
  for( dlx=(width/3)+10;dlx<(width/3)*2;dlx+=15)
  {
    line(dlx,0.25*height,dlx+5,0.25*height);
    line(dlx,0.75*height,dlx+5,0.75*height);
  }
  for ( dly=height/4;dly<(height/4)*3;dly+=15)
  {    
    line(width/3,dly,width/3,dly+5);
    line((width/3)*2,dly,(width/3)*2,dly+5);
  }
}

void  ballsOndoor()
{
  noFill();
  dlx=width/2;
  dly=height/2;
  ellipse(dlx/1.3,dly/1.5,width/24,width/24);
  ellipse(dlx,dly,width/24,width/24);  
  ellipse(dlx*1.23,dly/1.5,width/24,width/24);
  ellipse(dlx*1.23,dly*1.35,width/24,width/24);
  ellipse(dlx/1.3,dly*1.35,width/24,width/24);
}

void  ballsOndoor2()
{
  dlx=width/2;
  dly=height/2;
  ellipse(dlx/1.3,dly/1.5,width/24,width/24);
  ellipse(dlx,dly,width/24,width/24);  
  ellipse(dlx*1.23,dly/1.5,width/24,width/24);
  ellipse(dlx*1.23,dly*1.35,width/24,width/24);
  ellipse(dlx/1.3,dly*1.35,width/24,width/24);
}

void showInstructions()
{
  firstDoor();
  ballShine();
  ballsOndoor2();
  noStroke();
  rx-=introSpeed;
  fill(textColor); 
  textSize(20);
    text("you have 10 seconds to finish the task", rx+width*0.45, height/4 );
    text("Click LEFT button of mouse",rx+width*0.45, height*0.44);
    text("to hit 5 RED Dargon Balls and you'll WIN",rx+width*0.45, height*0.6);
    text("Press any key to STAR ",rx+width*0.45, height*0.75);
    if(rx<0)
    {
      introSpeed=-introSpeed; 
    }
    if(rx>width*0.1)
    {
      introSpeed=0.5;
    }
}

void keyPressed()
{  
  if ( gamePhase == 0 )
   {
      gamePhase = 1;
      startTime = millis();
   }
    if (key == CODED) {
     if (keyCode == DOWN) {
       if (gamePhase==2)
     {
          gamePhase = 1; 
          count=0;
          startTime = millis();      
     }
    }
  }
 }




