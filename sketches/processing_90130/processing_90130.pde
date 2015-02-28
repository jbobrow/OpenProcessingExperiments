
// Min Kyung Kim, minkyunk@andrew.cmu.edu
// Homework 7
// Copyright February 2013. All rights reserved.

// move your mouse around and try avoiding poops!
// the longer you last, the higher your level gets!

int startTime, endTime, gameTime;
int gamePhase;
float ds;
float dx = random (50, width - 50);
float dy = random (50, height - 50);
float d2x = random (50, width - 50);
float d2y = random (50, height - 50);
float dxSpeed = random (5, 10);
float dySpeed = random (10, 20);
float d2xSpeed = random (0, 15);
float d2ySpeed = random (5, 25);
float mouseD = 10;

PImage b, h, d, c;

void setup ( )
{
  size (400, 400);
  
  textSize (18);
  textAlign (CENTER);
  smooth();
  
  startTime = 0;
  endTime = 0;
  gamePhase = 0;
  gameTime = 60000;
}

void draw ( )
{
  PImage b = loadImage ("streetfinal.jpg");
  background (b);
  
  if (gamePhase == 0) {
    showIns ( );
  } else if (gamePhase == 1) {
    playGame ( );
  } else {
    score ( );
  }
  
}

void score ( )
{
  fill (0);
  textSize (36);
  text ("GAME OVER", width/2, height/2);
  textSize (18);
  text ("PRESS ANY KEY TO RESTART", width/2 , height/1.75);
  showScore ( );
}

void checkTime ( )
{
  fill ( 0 );
  textSize (16);
  text ("Time Elapsed: " + (gameTime/1000 - ((millis ( ) - startTime))/1000), width/2, height / 15);
  if ((millis ( ) - startTime) > gameTime ) {
    gamePhase = 2;
  }
}

void showScore ( )
{
  fill (0);
  textSize (18);
  if ((gameTime/1000 - ((millis ( ) - startTime)/1000)) <= 0) {
    text ("YOUR LEVEL: WHEW...", width/2, height/4);
  } else if ((gameTime/1000 - ((millis ( ) - startTime)/1000)) >= 20 && (gameTime/1000 - ((millis ( ) - startTime)/1000)) < 40) {
    text ("YOUR LEVEL: GROSS!", width/2, height/4);
  } else if ((gameTime/1000 - ((millis ( ) - startTime)/1000)) >= 40) {
    text ("YOUR LEVEL: EW.", width/2, height/4);
  }
}

void drawFace ( )
{
  PImage h = loadImage ("happy.png");
  imageMode (CENTER);
  image (h, mouseX, mouseY);
}

void drawDdongfirst ( )
{
    PImage d = loadImage ("ddong.png");
    float ds = 50;
    image ( d, dx, dy);
    
      dx = dx + dxSpeed;
      dy = dy + dySpeed;
    
    if (dx > width ) {
      dx = 0;
    } else if (dx < 0) {
      dx = width;
    }
    if (dy > height ) {
      dy = 0;
    } else if (dy < 0) {
      dy = height;
    }
}

void drawDdongsecond ( )
{
    PImage d = loadImage ("ddong.png");
    image ( d, d2x, d2y);
    
      d2x = d2x - d2xSpeed;
      d2y = d2y + d2ySpeed;

    if (d2x > width ) {
      d2x = 0;
    } else if (d2x < 0) {
      d2x = width;
    }
    if (d2y > height ) {
      d2y = 0;
    } else if (d2y < 0) {
      d2y = height;
    }
}

void ew ( ) 
{
    float ds = 50;
    float d = dist (dx, dy, mouseX, mouseY);
    float d2 = dist (d2x, d2y, mouseX, mouseY);
    imageMode (CENTER);
    c = loadImage ("no.png");
    
    if (d < ds/2 + mouseD || d2 < ds/2 + mouseD) {
      gamePhase = 2;
      image (c, mouseX, mouseY);
    } else if (d < ds + mouseD || d2 < ds + mouseD) {
      image (c, mouseX, mouseY);
    }
}

void playGame( )
{
   drawDdongfirst( );
   drawDdongsecond( );
   drawFace( );
   ew( );
   showScore( );
   checkTime( );

}

void showIns( )
{
   fill (0);
   text( "TRY TO AVOID AS MANY POOPS AS YOU CAN", width/2, 50 ); 
   text("PRESS ANY KEY TO PLAY THE GAME.", width/2, 100 );
}

void keyPressed( )
{
   if (gamePhase == 0) {
     gamePhase = 1;
     startTime = millis ( );
   } 
   if (gamePhase == 2) {
     gamePhase = 0;
     startTime = millis ( );
   }
}



