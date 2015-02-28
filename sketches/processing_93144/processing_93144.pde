
//Homework 7
//Copyright Lila Fagen
//Lila.Fagen@gmail.com (ldf)

float x, y, d, easingCoef, x1, y1, distance, x2, y2, rxvel, ryvel,posx, posy;
int starttime, elapsedtime, phase;
//text
int count, lives;
float rectwd, rectht;

PFont myFont;


void setup ( )
{
  size (400, 400);
  background (0);

  count = 0;
  lives = 3;
  starttime = 0;

  noStroke ( );
  //  textSize (24);
  textAlign (CENTER);

  x = width/8;
  y = height/8;
  d = width/12;
  easingCoef = .3;
  x1 = random(0, width);
  y1 = random (rectht, height);
  x2 = random (0, width);
  y2 = random (rectht, height);  
  rxvel = (10);
  ryvel = (10);


  rectwd = width;
  rectht = height/8;

  myFont = createFont("Century Gothic", 18);
  textFont(myFont);


  smooth ( );
}


void draw ( )
{
  if (phase == 0)
  {
    instructions ( );
  } 
  else if ( phase == 1)
  {
    play ( );
  } 
  else if (phase == 2)
  {
    gameover ( );
  }
}



void instructions ( )
{
  background (0);
  text ("Catch as many green balls ", width/2, height/3);
  text ("as you can. If you hit a ", width/2, height/3 + 25);
  text ("red ball, it's game over! ", width/2, height/3 +50);
  text ("Press ENTER to begin. ", width/2, height/3 +100);
}

void keyPressed ( )
{
  if (keyCode== ENTER)
  {
    phase = 1;
    elapsedtime= 0;
  }
}



void play ( )
{  
  circ ( );
  mousecirc ( );
  timer( );
  collision ( ); 
  badCollision ( );
  elapsedtime= millis ( )/1000;
  redball ( );
}

void collision ( )
{
  distance = dist(mouseX, mouseY, x1, y1);
  if (distance <= (d*.5))
  {
    count++;
    x1 = random(0, width);
    y1 = random (rectht, height);
    rxvel= random (10, 20);
    rxvel= random (10, 20);
  }
}

void badCollision ( )
{
  distance = dist(mouseX, mouseY, x2, y2);
  if (distance <= (d*.5))
  {
    lives--;
    x2 = random(0, width);
    y2 = random (rectht, height);
  } 
  else if (lives <= 0)
  {
    phase = 2;
  }
}


void redball ( )
{
  
  fill (200, 0, 0);
  x2 = x2 + rxvel;
  y2 = y2 + ryvel;
  ellipse (x2, y2, d*2, d*2);
      if (x2 > width || x2 <0)
      {
        rxvel = -rxvel;
      }
      if (y2 > height || y2 < rectht)
      {
        ryvel = -ryvel;
      }
}

void circ ( )
{
  fill (0, 200, 0);
  ellipse (x1, y1, d/2, d/2);
}

void mousecirc ( )
{
  //disolving trail  
  fill (0, 20);
  rect (0, 0, width, height); 
  float dx = mouseX - x;
  float dy = mouseY - y;

  x = x + (dx * easingCoef);
  y = y + (dy * easingCoef);
  //actual circle
  fill (0, 0, 200);
  ellipse (x, y, d, d);  
  //stop at time bar
  if (y <= rectht)
  {
    y= rectht+d/2;
  }
}

void timer ( )
{
  fill (100);
  rect (0, 0, rectwd, rectht);
  //text
  fill (255);
  text ("lives left " + lives, rectwd/8, rectht*.7);
  text ("time elapsed " + elapsedtime, rectwd/2, rectht*.7);
}


void gameover ( )
{
  background (0);
  fill (255, 0, 0);
  text ("GAME OVER.", width/2, height/2);
  fill (255);
  text ("targets hit: " + count, width/2, height*.6);
  text ("in "+ elapsedtime + " seconds", width/2, height *.65);
}


