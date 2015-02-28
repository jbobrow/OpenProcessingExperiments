
//copyright 2014 Hyun Doug Kim
//help the rabbit

// objetive: help the rabbit escape. Move the rabbit around 
// before 20 seconds is up, the number of collision must be lower than 20
// press any key to start
// press mouse to restart

float x1, y1, z1, dx1, dy1; 
float x2, y2, z2, dx2, dy2;
float x3, y3, z3, dx3, dy3;
float easing =.5;
PImage pic;
int hits;
int startTime;
float z=0;
int gamePhase;

void setup( )
{
  size( 500, 500 );
  noStroke( );
  textSize(18);
  textAlign(CENTER);
  
  //red ellipse
  x1 = 50;
  y1 = 50;
  z1 = random( 50, 100 );
  dx1 = 2;
  dy1 = 3;
  
  //rabbit
  x2 = random(width);
  y2 = random(height);
  z2 = random( 50, 100 );
  dx2 = 4;
  dy2 = 2; 
  
  //blue ellipse
  x3 = random(width);
  y3 = random(height);
  z3 = random( 50, 100 );
  dx3 = 4;
  dy3 = 2;   
  
  pic = loadImage("rabbit.png");
  imageMode (CENTER);
  
  gamePhase =0;
  startTime =0;
}

void draw( )
{
  if(gamePhase ==0)
  { showInstruction ();
  }
  else if (gamePhase ==1)
  {
    playgame();
  }
  else if (gamePhase ==2)
  {
    score();
  }
  else if (gamePhase ==3)
  {
    congrats();
  }

 
}

void showInstruction()
{
  background(49, 94, 203 );
  text ("help the rabbit avoid the circles!", width*.5, 200);
  text ("before 20 seconds are up,", width*.5, 230);
  text ("your collision number must be lower than 20", width*.5, 260);
  text ("press any keys to start!", width*.5, 290);
}


void playgame()
{
  prepareWindow( );
  moveFigs( );
  drawFigs( );
  checkCollision( );
  showStats();
  startTime();
  hits();

  float X= mouseX;
  float dx2 = X-x2;
  if (abs (dx2) >1)
  {
    x2 += dx2 * easing;
  }
  
  float Y= mouseY;
  float dy2 =Y-y2;
  if (abs (dy1)>1)
  {
    y2 += dy2;
  }
}


void prepareWindow( )
{
   fill(49, 94, 203 );
   rect( 0, 0, width, height );
}

void moveFigs( )
{
 x1 += dx1;
 if ( x1 > width  ) x1 = 0;
 if ( x1 < 0 ) x1 = width ;
 y1 += dy1;
 if ( y1 > height ) y1 = 0;
 if ( y1 < 0 ) y1 = height;


  x2 += dx2;
  if ( x2 > width  || x2 < 0 ) dx2 = -dx2;
  y2 += dy2;
  if ( y2 > height || y2 < 0 ) dy2 = -dy2;
  
 x3 += dx3;
 if ( x3 > width  ) x3 = 0;
 if ( x3 < 0 ) x3 = width ;
 y3 += dy3;
 if ( y3 > height ) y3 = 0;
 if ( y3 < 0 ) y3 = height; 
  
}

void drawFigs( )
{
  image(pic, x2, y2, 150, 106);
  fill( random(255), 0, 0 );
  ellipse( x1, y1, z1, z1 );
  fill (0, 0, 255);
  ellipse(x3, y3, z3, z3);
}

void checkCollision( )
{
  float actualDistance = dist( x1, y1, x2, y2 );
  float collisionDistance = z1/2 + z2/2;
  if ( actualDistance < collisionDistance )
  {
    fill( 0, 10 );
    rect( 0, 0, width, height );
    dx1 = -dx1;
    dy1 = -dy1;
    dx2 = -dx2;
    dy2 = -dy2;
    hits++;
    
  }
}

void startTime()
{
  fill (255);
  text ("Time:" +millis()/1000, width *.5, height -70);
  if (startTime == millis()*20000)
  {
    gamePhase =3;
    congrats();
  }
  
}

void showStats()
{  
  fill (255);
  text("number of collision incurred" + hits, width*.5, height-100);

}
void score()
{
  background(49, 94, 203);
  text ("Game Over", width/2, 200);
  text("number of collision incurred" + hits, width*.5, height-100);
  text ("if you wish to replay, press the mouse", width/2, 230);

  
  
}

void keyPressed()
{
  if (gamePhase == 0)
  {
    gamePhase = 1;
    startTime = millis();
  }
}

void mousePressed()
{ 
  if (gamePhase == 2)
  {
    gamePhase = 1;
    hits =0;
    startTime = millis();
  }
  else if (gamePhase == 3)
  {
    gamePhase = 1;
    hits =0;
    startTime = millis();
  }
}


void hits()
{
    if (hits == 20)
  {
    gamePhase =2;
    score();
  }
}



void congrats()
{
  background(49, 94, 203);
  text ("Congrats", width/2, 200);
  text("Rabbit thanks you!" + hits, width*.5, height-100);
  text ("if you wish to replay, press the mouse", width/2, 230);
}





