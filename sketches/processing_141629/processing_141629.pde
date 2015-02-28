
//import ddf.minim.spi.*;
//import ddf.minim.signals.*;
//import ddf.minim.*;
//import ddf.minim.analysis.*;
//import ddf.minim.ugens.*;
//import ddf.minim.effects.*;

//copyright nickie cheung 
/* use the arrow keys to move Bob around
dodge the flying ducks, and do not get more than 5 hits for 30 seconds and you win!
if you do not move for more than 2 seconds, you lose.
have fun!*/


//Minim minim;
//
//AudioPlayer s1, s2, s3, s4;

float charX, charY, chardX, chardY, charDim;
int count;
float xw, yw, dwx;
float x, y, dx, dy, dim;
float rx, ry, drx, dry;
color bgCol;
PFont font;
float txtSize;
int gamePhase;
int time, startTime, charStart, charTime;
PImage pic1, pic2, pic3, pic4, pic5, pic6;
void setup ( )
{
  size( 600, 600 );
  noStroke( );

  //font style
  font = createFont( "Bit Lazy", 78);
  //character variables
  charX = width/3; 
  charY = height/3;
  chardX= 0;
  chardY = 0;
  charDim = 75;
  // duck variables
  x = width/4;
  y = random( height );
  dx = 0;
  dy = 0;
  xw = width/9;
  yw = random( height );
  dwx = 0;
  dim = 75;
  rx = random( width/4 );
  ry = random( height/4);
  drx = random( width/4, width/2 );
  dry = random( height/4, height/2 );
  //global variables
  txtSize = 25;
  bgCol = color( 0, random( 120, 255 ), random( 125, 255 ) );
  gamePhase = 0;
  pic1 = loadImage( "1.png" );
  pic2 = loadImage( "2.png" );
  pic3 = loadImage( "3.png" );
  pic4 = loadImage( "4.png" );
  pic5 = loadImage( "5.png" );
  pic6 = loadImage( "6.png" );
  count = 0;

  //  minim = new Minim(this);
  //s1 = minim.loadFile("crash.mp3");
  //s2 = minim.loadFile("key.mp3");
  //s3 = minim.loadFile("lose.mp3");
  //s4 = minim.loadFile("win.mp3");
}

void draw( )
{
  prepWindow( );

  if ( gamePhase == 0 )
  {
    startMenu( );
  }

  if ( gamePhase == 1 )
  {
    instructions( );
  }

  if ( gamePhase == 2 )
  {
    startGame( );
  }    

  if ( gamePhase == 3 )
  {
    startGame( );
  }

  if ( gamePhase == 4 )
  {
    startGame( );
  }

  if ( gamePhase == 5 )
  {
    loseGame( );
  }

  if ( gamePhase == 6 )
  {
    winGame( );
  }
}

//Start Menu and Instructions
//*************************************************************************************************************************************
void startMenu( )
{
  frameRate( 5);
  //Title and Start
  textFont( font );
  fill( 0 );
  textAlign( CENTER, CENTER );
  text( " Dodge Ducks ", width/2, height/4 );
  textSize( txtSize );
  text( " Press ENTER to START ", width/2, height*.6 );
  text( " use the arrow keys to MOVE ", width/2, height*.7);
  if ( frameCount % 5 == 0 )
  {
    fill( bgCol );
    rect( 0, height/2, width, height );
  }
  else if ( frameCount % 5 == 1 )
  {
    fill( bgCol, 10 );
    rect( 0, height/2, width, height );
  }
}

void instructions( )
{
  fill( 0 );
  text( "if you do not move for more than 2 seconds, you lose", width/2, height/4 );
  text( "choose difficulty", width/2, height/2 );
  text( "Press  'E'  for EASY", width/2, height/2 + txtSize + 5 );
  text( "Press  'M'  for MEDIUM", width/2, height/2 + 2*txtSize + 5 );
  text( "Press  'H'  for HARD", width/2, height/2 + 3*txtSize + 5 );
}

void prepWindow( )
{
  fill( bgCol );
  rect( 0, 0, width, height );
}



void keyPressed( )

{ 
  if ( key == ENTER )
  {
    gamePhase = 1;
  }

  if ( key == 'E' || key == 'e' )
  {
    if ( gamePhase == 1 )
    {
      gamePhase = 2;
      dx = 5;
      dwx = 5;
      dy = 5;
      startTime = millis( );
    }
  }

  if ( key == 'M' || key == 'm' )
  {
    if ( gamePhase == 1 )
    {
      gamePhase = 3;
      dx = 5;
      dwx = 5;
      dy = 5;
      dim = 100;
      startTime = millis( );
    }
  }

  if ( key == 'H' || key == 'h' )
  {
    if ( gamePhase == 1 )
    {
      gamePhase = 4;
      dx = 10;
      dwx = 10;
      dy = 10;
      dim = 150;
      charDim = 150;
      startTime = millis( );
    }
  }
}

void startGame( )
{
  frameRate( 15 );
  drawFigure( );
  moveFigure( );
  timer( );
  wrapDuck( );
  bounceDuck( );
  rotateDuck( );
  hits( );
  showHits( );
}

void drawFigure( )
{
  if ( chardX >= 0 )
  {
    image( pic3, charX, charY, charDim, charDim);
  }
  else if ( chardX <= 0 )
  {
    image( pic1, charX, charY, charDim, charDim );
  }
}
void drawFigureLEFT( )
{
  if ( frameCount % 2 == 1 )
  {
    image( pic1, charX, charY, charDim, charDim);
  }
  else
  {
    image( pic2, charX, charY, charDim, charDim );
  }
}

void drawFigureRIGHT( )
{
  if ( frameCount % 2 == 1 )
  {
    image( pic3, charX, charY, charDim, charDim);
  }
  else
  {
    image( pic4, charX, charY, charDim, charDim );
  }
}

void moveFigure( )
{
  charX = charX + chardX;
  charY = charY + chardY;
  if ( keyPressed  )
  {
    charStart = millis( );
    if ( key == CODED )
    {
      if ( keyCode == LEFT )
      { 
        prepWindow( );
        drawFigureLEFT( );
        chardX = -20;
        //s2.play( );
        //s2.rewind( );
      }
      if ( keyCode == RIGHT )
      {
        prepWindow( );
        drawFigureRIGHT( );
        chardX = 20;
        //s2.play( );
        //s2.rewind( );
      }
      if ( keyCode == UP )
      {
        prepWindow( );
        chardY = -20;
        drawFigureRIGHT( );
        //s2.play( );
        //s2.rewind( );
      }
      if ( keyCode == DOWN )
      {
        prepWindow( );
        chardY = 20;
        drawFigureLEFT( );
        //s2.play( );
        //s2.rewind( );
      }
    }
  }
  if ( charX > width - dim )
  {
    charX = width/3;
    charY = width/3;
  }
  else if ( charX < 0  )
  {
    charX = width/3;
    charY = width/3;
  }
  else if ( charY > height )
  {
    charX = width/3;
    charY = width/3;
  }
  else if ( charY < 0 )
  {
    charX = width/3;
    charY = width/3;
  }
}

void drawDuck( PImage p, float x, float y, float dim )
{
  image( p, x, y, dim, dim );
}

void wrapDuck ( )
{
  drawDuck( pic6, xw, yw, dim );
  xw = xw + dwx;
  if ( xw > width )
  {
    xw = -70;
    yw = random( height );
  }
}

void bounceDuck ( )
{
  if ( dx > 0 )
  {
    drawDuck( pic6, x, y, dim );
  }
  else if ( dx < 0 )
  {
    drawDuck( pic5, x, y, dim );
  }
  x = x + dx;
  y = y - dy;
  if ( x > width - dim )
  {
    dx = - dx;
  }
  if ( x < 0 )
  {
    dx = - dx;
  }
  if ( y > height - dim/2)
  {
    dy = - dy;
  }
  if ( y < 0 )
  {
    dy = - dy;
  }
}

void rotateDuck( )
{
  pushMatrix( );
  translate( drx, dry );
  rotate( degrees (frameCount/4) );
  drawDuck( pic5, rx, ry, dim );
  popMatrix( );
}


void timer( )
{
  fill( 255 );
  time = 30 - (millis( ) - startTime)/1000;
  charTime = 2 - (millis( ) - charStart)/1000;
  text( "Time Left: "+ time, width/2, height - 50 );
  if ( chardX == 0 && charTime == 0 )
  {
    gamePhase = 5;
  }
  if ( time == 0 && count < 5)
  {
    gamePhase = 6;
  }
}

void showHits( )
{
  fill( 255 );
  text( "Times hit: " +count, width/2, height - 80);
}
void hits ( )
{
  float d = dist( x, y, charX, charY );
  float w = dist( xw, yw, charX, charY );
  float r = dist( drx+rx, dry+ry, charX, charY );
  if ( d < charDim/2 || w < charDim/2 || r < charDim/2 )
  {
    count++;
    fill( 255 );
    rect( 0, 0, width, height );
    x = charX - 100;
    y = charY - 100;
    xw = charX - 100;
    yw = charY - 100;
    rx = charX - 100;
    ry = charY - 100;
    //s1.play( );
    ////s1.rewind( );
  }
  if ( count >= 5 )
  {
    gamePhase = 5;
  }
}

void keyReleased( )
{
  if ( chardX == 20 )
  {
    chardX = 0;
    drawFigureRIGHT( );
  }
  else if ( chardX == -20 )
  {
    chardX = 0;
    drawFigureLEFT( );
  }
  else if ( chardY == -20 )
  {
    chardY = 0;
  }
  else if ( chardY == 20 )
  {
    chardY = 0;
  }
}


void winGame( )
{
  //s4.play( );
  noLoop( );
  fill( bgCol );
  rect( 0, 0, width, height );
  fill( 0 );
  textAlign( CENTER );
  text( "YOU WIN", width/2, height/2 );

  text( "Hits:" + count, width/2, height * .65 );
  if ( count == 0 )
  {
    text( "You really outdid yourself!", width/2, height*.75 );
  }
  if ( count >=1 && count <= 3 )
  {
    text( "Did those ducks hurt ya?", width/2, height*.75 );
  }
  if ( count == 4 )
  {
    text( "Were there really only THREE ducks?!", width/2, height*.75 );
  }
}

void loseGame( )
{
  //s3.play( );
  noLoop( );
  fill( bgCol );
  rect( 0, 0, width, height );
  fill( 0 );
  textAlign(CENTER);
  text( "GAME OVER", width/2, height/2 );
  text( "Hits:" + count, width/2, height *.75 );
  text( "Time left:" + time, width/2, height * .9 );
}



