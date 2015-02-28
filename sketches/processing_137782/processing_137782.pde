
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// Bounce bounce - copyright Risa Hiyama

/*
The user will try to avode crashing into the 3 moving obstacle 
by using WASD key buttons to controle its location. 

-The game is time to 30 seconds.
-The user have 5 lives. 
-The goal is to get to the bottom right corner

-Cites free sound
http://soundbible.com/
*/


color edgeColor, playerColor;

//for the balls
int x,y,dim,dx,dy;
int x2,y2,dim2,dx2,dy2;
int x3,y3,dim3,dx3,dy3;
int xP,yP,dimP;


//to count things 
int life, hits;
int startTime, currentTime, timeLimit, timeLapsed;

float speedX=5, speedY=5;

boolean gameOn;

Minim minim;
AudioPlayer s1,s2,s3;


void setup()
{
   
  size(600,600);
  noCursor();
  
  textSize( 24 );
  
  life = 5;
  hits = 0;
  timeLimit = 30;
 
  edgeColor = color (255,255,0);
  playerColor = color(100);
  
  //enemy1
  x=y=width/3; 
  dx = 1;
  dy = 2;
  dim =40;

  //enemy2
  x2=y2=width/4; 
  dx2 = 1;
  dy2 = 4;
  dim2 =60;

  //enemy3
  x3=y3=width/5; 
  dim3 = 20;
  dx3=dy3=1;

  //player
  xP=40;
  yP=40; 
  dimP =30;
  
  minim = new Minim(this);
  s1 = minim.loadFile("S1.wav");
  s2 = minim.loadFile("Metal Clang-SoundBible.com-19572601.wav");
  s3 = minim.loadFile("Loud_Bang-Osama_Bin_Laden-925764326.wav");

}

void showInstructions( )
{
   background(0);
   //why dont it cover the whole thing?
   fill(255);
   text("dodge the 3 circles", 10, 50 );
   text("Get to the bottom right corner to WIN.", 10, 80 );
   
   text("How good are you??? -- Give it a try!!!" , 10, 110 );
   text("You have 5 lives to spare" , 10, 140 );
  
   
   text("Press [D] to go right.", 10, 210);
   text("Press [A] to go left.", 10, 240 );
   text("Press [W] to go up.", 10, 270 );
   text("Press [S] to go down.", 10, 300 );
 
}

void keyPressed ()
{ 
  if (!gameOn){
   gameOn=true;
   startTime = millis( );  // start the clock
  }
}


void draw()
{
  prepareWindow();
  
  if (!gameOn){
    showInstructions( );
  }
   
  else { 
  drawBorder();
  drawEnemy123();
  moveEnemy123();
  drawPlayer();
  movePlayer();
  checkCollision( );
  showScore();
  checkLifeReminingAndTime();
  }
}

void prepareWindow( )
{
   fill( 0, 230 );
   rect( 0, 0, width*2, height*2 );
}

void drawEnemy123()
{
  noStroke( );
   fill( 255, 0, 0 );
   ellipse( x, y, dim, dim );
   stroke( 255 );
   strokeWeight( 5 );

   noStroke( );
   fill( 0, 255, 0 );
   ellipse( x2, y2, dim2, dim2 );
   stroke( 255 );
   strokeWeight( 5 );
   
   noStroke( );
   fill( 0, 0, 255 );
   ellipse( x3, y3, dim3, dim3 );
   stroke( 255 );
   strokeWeight( 5 );
}

void moveEnemy123()
{
  //enemy1(red)
  x += dx;
  y += dy;  
  if ( y>height-20 || y<20) 
  {
    dy = -dy;
    y += dy;
  }
  if ( x>width-20|| x<20)
  {
    dx = -dx;
    x += dx;
  }  

  //enemy2(green)
  x2 += dx2; 
  {
    if (x2>width) x2 = 0;
    if ( x2 < 0 ) x2 = width ;
  }
  y2 += dy2;
  {
    if ( y2 > height ) y2 = 0;
    if ( y2 < 0 ) y2 = height;
  } 
 
  //enemy3(blue)
  x3 += dx3;
  y3 += dy3;  
  //movements for randomly changing direction
  if(frameCount%300==0){
    dx3=int(random(-3,3));
    dy3=int(random(-5,5));
    if(dx3==0 && dy3==0)
    {
      dx3=1;
    } 
  }
  //to bounce back when it hits the border
  if ( y3>height-20 || y3<20) 
  {
    dy3 = -dy3;
    y3 += dy3;
  }
  if ( x3>width-20|| x3<20)
  {
    dx3 = -dx3;
    x3 += dx3;
  }   
}

void drawPlayer(){
    strokeWeight(2);
    noStroke();
    fill(playerColor);
    ellipse(xP,yP,dimP,dimP);
}

void movePlayer(){
  if(keyPressed){
      if (key== 'd' && xP<width-30)
      {
        xP+=speedX;
        if(speedX<10){
          speedX=speedX+0.1;
        }
        
      }
      if (key== 's' && yP<height-30){
        yP+=speedY;
        if(speedY<10){
          speedY=speedY+0.1;
        }
      }
      if (key== 'a'&& xP>30){
        xP-=speedX;
        if(speedX<10){
          speedX=speedX+0.1;
        }
      }
      if (key== 'w' && yP>30){
        yP-=speedY;
            if(speedY<10)
          speedY=speedY+0.1;
        }    
  }
  else {
    if(speedX>2)
      speedX=speedX-0.1;
    if(speedY>2)
      speedY=speedY-0.1;
  } 
}

void drawBorder()
{
   stroke( edgeColor);
   strokeWeight( 20 );
   noFill( );
   rectMode( CENTER );
   rect( width/2, height/2, width, height );
}

void checkCollision( )
{
  float actualDistanceRed = dist( x, y, xP, yP );
  float collisionDistanceRed = dim/2 + dimP/2;
  float actualDistanceGreen = dist( x2, y2, xP, yP );
  float collisionDistanceGreen = dim2/2 + dimP/2;
  float actualDistanceBlue = dist( x3, y3, xP, yP );
  float collisionDistanceBlue = dim3/2 + dimP/2;
  if ( actualDistanceRed < collisionDistanceRed || actualDistanceGreen < collisionDistanceGreen || actualDistanceBlue < collisionDistanceBlue )
  {
    xP=yP=40;
    //bring it back to the center
    fill( 255, 0, 0, 150 );
    noStroke();
    rect( 0, 0, height*2, width*2 ); 
       if(life>0)
       life--; //lose one life when collide
       
//        else
//        gameOver();
    //some how its reading the width and the height 1/2 
    //this wont work for being it while too.
  }
  if ( actualDistanceRed < collisionDistanceRed ){
     s1.play();
     s1.rewind();
   }
  if ( actualDistanceGreen < collisionDistanceGreen ){
     s2.play();
     s2.rewind();
   }
  if ( actualDistanceBlue < collisionDistanceBlue ){
     s3.play();
     s3.rewind();
   } 

  
}


//current time and score 
void showScore( )
{
  fill( 0, 255, 0 );
  text( "Remaining Life: " + life, width/2, height-50 ); 
  
  currentTime = millis( );
  timeLapsed = (currentTime - startTime)/1000;  // covert to seconds
  text( "Time: " + (timeLimit-timeLapsed), width/2, height - 80 ); 
  //how dod you keep the seconds going
}

void checkLifeReminingAndTime()
{
   if (life <= 0 ||timeLapsed >=timeLimit )
    gameOver("YOU LOSE");     
   else if ( xP >= width-40 && yP >= height-40)
    gameOver("YOU WIN");
}

void gameOver(String text){
  background( 0 );
      textSize( 30 );
      text( text, width/3, height/3 );
      text( "Life remaining: " + life, width/2, height-50 ); 
      currentTime = millis( );
      timeLapsed = (currentTime - startTime)/1000;  // covert to seconds
      text( "Time: " + (timeLimit-timeLapsed), width/2, height - 80 ); 
      //how do you keep the seconds going
      
      //great (no collision) . good (1-3 collision) . bad (4-5 collision) 
      if ( xP >= width-40 && yP >= height-40){
        if (life == 5)     
        text( "You did great!", width/2, height/2 ); 
        else if (2 <= life && life <= 4 )
        text( "You did okay!", width/2, height/2 ); 
        else
        text( "You did bad!", width/2, height/2 );      
      }
      
       noLoop( );  // stops iteration of draw( )
}







