
// Homework #7 48-257 Programming in the Arts with Processing
// Will Crownover wlc@andrew.cmu.edu
// Copyright February 2012

int count = 0;
int phase = 1;
float t;
float bx, by, bDia, bxSpeed, bySpeed;
float sx, sy, sDia, sxSpeed, sySpeed;

void setup()
{
  size( 600, 600 );
  smooth();
  t = millis()/1000;
  bDia = 91;
  bx = random( bDia, width - bDia );
  by = random( bDia, height - bDia );
  bxSpeed = random ( -10, 10 );
  bySpeed = random ( -10, 10 );
  sDia = 50;
  sx = width/2.0;
  sy = height/2.0;
  sxSpeed = 0;
  sySpeed = 0;
}

void mouseDragged()
{
  stroke( 50 );
  strokeWeight( 3 );
  line( mouseX, mouseY, pmouseX, pmouseY );
  noStroke();
  if( mouseX > pmouseX )
  {
    sxSpeed = sxSpeed + .2;
  }
  else if ( mouseX < pmouseX )
  {
    sxSpeed = sxSpeed - .2;
  }
  if( mouseY > pmouseY )
  {
    sySpeed = sySpeed + .2;
  }
  else if ( mouseY < pmouseY )
  {
    sySpeed = sySpeed - .2;
  }
}

void mousePressed()
{
  if( phase == 1 )
  {
    phase = 2;
  }
  if( phase == 3 )
  {
    bDia = 91;
    phase = 2;
  }
}

void draw()
{
  if( phase == 1 )
  {
    mainScreen();
  }
  if( phase == 2 )
  {
     prepWindow();
     bounceBall();
     drawBall();
     starMove();
     drawStar();
     detectCollision();
     displayInfo();
  }
  if( phase == 3 )
  {
    endScreen();
  }
}

void mainScreen()
{
  background( 150, 200, 255, 50 );
  textAlign( CENTER );
  textSize( 30 );
  fill( 200, 0, 0 );
  text( "Pop the Bouncing Ball with the Star", width/2.0, height/4.0 );
  textSize( 20 );
  text( "Drag the Mouse to Influence the Star's Movement", width/2.0, height/3.0 + 35 );
  text( "Each Strike will Slowly Deflate the Ball", width/2.0, height/3.0 + 60 );
  text( "Caution, The Star has a Speed Cap", width/2.0, height/3.0 + 120 );
  text( "Pop as Fast as You Can, 90 Hits", width/2.0, height/3.0 + 180 );
  textSize( 40 );
  text( "Click to Play", width/2.0, height/3.0 + 240 );
}

void prepWindow()
{
  fill( 150, 220, 220, 50 );
  rect( 0, 0, width, height );
}

void bounceBall()
{
  bx = bx + bxSpeed;
  by = by + bySpeed;
  if( bx > width - bDia/2.0 )
  {
    bxSpeed = -bxSpeed;
  }
  if( by > height - bDia/2.0 )
  {
    bySpeed = -bySpeed;
  }
  if( bx < bDia/2.0 )
  {
    bxSpeed = - bxSpeed;
  }
  if( by < bDia/2.0 )
  {
    bySpeed = - bySpeed;
  }
}

void drawBall()
{
  noStroke();
  fill( 200, 0, 0 );
  ellipse( bx, by, bDia, bDia );
  fill( 200, 35, 35 );
  ellipse( bx + bDia/12, by, bDia/1.2, bDia/1.05 );
  fill( 200, 50, 50 );
  ellipse( bx + bDia/6, by, bDia/1.6, bDia/1.17 );
  fill( 255, 150 );
  ellipse( bx + bDia/4, by - bDia/5, bDia/9, bDia/9 );
}

void starMove()
{
  sx = sx + sxSpeed;
  sy = sy + sySpeed;
  if( sx > width + sDia/2.0 )
  {
    sx = -sDia/2.0;
  }
  else if( sx < -sDia/2.0 )
  {
    sx = width + sDia/2.0;
  }
  if( sy > height + sDia/2.0 )
  {
    sy = -sDia/2.0;
  }
  else if( sy < -sDia/2.0 )
  {
    sy = height + sDia/2.0;
  }
  if( sxSpeed > 25 )
  {
    sxSpeed = 0;
  }
  else if( sxSpeed < -20 )
  {
    sxSpeed = 0;
  }
  if( sySpeed > 25 )
  {
    sySpeed = 0;
  }
  else if( sySpeed < -20 )
  {
    sySpeed = 0;
  }
}
      
void drawStar()
{
  pushStyle();
     stroke( 0, 70 );
    fill( 0, 0, 50, 30 );
    ellipse( sx, sy, sDia, sDia );
  popStyle();
  fill( 50 );
  triangle( sx, sy, sx + sDia/2.0, sy, sx + sDia/10.0, sy + sDia/10.0 );
  fill( 250 );
  triangle( sx, sy, sx + sDia/2.0, sy, sx + sDia/10.0, sy - sDia/10.0 );
  fill( 200 );
  triangle( sx, sy, sx - sDia/2.0, sy, sx - sDia/10.0, sy - sDia/10.0 );
  fill( 0 );
  triangle( sx, sy, sx - sDia/2.0, sy, sx - sDia/10.0, sy + sDia/10.0 );
  fill( 0 );
  triangle( sx, sy, sx, sy + sDia/2.0, sx - sDia/10.0, sy + sDia/10.0 );
  fill( 200 );
  triangle( sx, sy, sx, sy + sDia/2.0, sx + sDia/10.0, sy + sDia/10.0 );
  fill( 50 );
  triangle( sx, sy, sx, sy - sDia/2.0, sx - sDia/10.0, sy - sDia/10.0 );
  fill( 250 );
  triangle( sx, sy, sx, sy - sDia/2.0, sx + sDia/10.0, sy - sDia/10.0 );
}

void detectCollision()
{
  float d = dist( bx, by, sx, sy );
  if( d < bDia/2.0 + sDia/2.0 )
  {
    count++;
    fill( 200 );
    triangle( sx, sy, 0, height/4.0, 0, height/2.0 );
    fill( 0 );
    triangle( sx, sy, 0, height*.75, 0, height/2.0 );
    fill( 0 );
    triangle( sx, sy, width/4.0, height, width/2.0, height );
    fill( 200 );
    triangle( sx, sy, width*.75, height, width/2.0, height );
    fill( 50 );
    triangle( sx, sy, width, height*.75, width, height/2.0 );
    fill( 250 );
    triangle( sx, sy, width, height/4.0, width, height/2.0 );
    fill( 250 );
    triangle( sx, sy, width/2.0, 0, width*.75, 0 );
    fill( 50 );
    triangle( sx, sy, width/2.0, 0, width/4, 0 );
    bDia = bDia - 1;
    bx = random( bDia, width - bDia );
    by = random( bDia, height - bDia );
    bxSpeed = random ( -10, 10 );
    bySpeed = random ( -10, 10 );
  }
  if( bDia <= 1 )
  {
    phase = 3;
  }
}

void displayInfo()
{
  textSize( 20 );
  fill( 100 );
  text( "Score: " + count, 50, 80 );
  text( "Time: " + millis()/1000, 50, 50 );
}

void endScreen()
{
  textAlign( CENTER );
  textSize( 100 );
  fill( 255, 0, 0 );
  text( "End", width/2.0, height/2.0 );
}
      
      
      
      
