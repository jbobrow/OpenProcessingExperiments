
//Copyright Lauren Hartman 2013
//lmhartma@andrew.cmu.edu
//Simple Game
 
 
float x, y, d, easingCoef, x1, y1, distance, x2, y2, rxvel, ryvel,posx, posy;
int starttime, elapsedtime, phase;
int count, lives;
float rectwd, rectht;
PFont myFont;

void setup ( )
{
  size (400, 400);
  background (255);
  count = 0;
  lives = 3;
  starttime = 0;
  noStroke ( );
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
  myFont = createFont("Consolas", 12);
  textFont(myFont); 
}
 
 
void draw ( )
{
  if (phase == 0)
  {
    directions ( );
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
 
void directions ( )
{
  background (255);
  fill(90, 180, 180);
  text ("Collect as many blue circles ", width/2, height/2.5);
  text ("as you can, but try to avoid ", width/2, height/2.5 + 15);
  text ("the Black Box! ", width/2, height/2.5 +30);
  text ("Press the ENTER key to begin ", width/2, height/2.5 +60);
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
  background (255);
  blueBall ( );
  controlCircle ( );
  time ();
  collision ( );
  badCol ( );
  elapsedtime= second()/1;
  blackBox ( );
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
 
void badCol ( )
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
 
 
void blackBox ( )
{
  fill (0);
  x2 = x2 + rxvel;
  y2 = y2 + ryvel;
  rect (x2, y2, d*3, d*3);
      if (x2 > width || x2 < 3)
      {
        rxvel = -rxvel;
      }
      if (y2 > height || y2 < 3)
      {
        ryvel = -ryvel;
      }
}
 
void blueBall ( )
{
  fill(90, 180, 180);
  ellipse (x1, y1, d/3, d/3);
}
 
void controlCircle ( )
{
  fill (0, 0);
  rect (0, 0, width, height);
  float dx = mouseX - x;
  float dy = mouseY - y;
  x = x + (dx * easingCoef);
  y = y + (dy * easingCoef);
  fill (75);
  ellipse (x, y, d*1.5, d*1.5); 
  if (y <= rectht)
  {
    y= rectht+d/2;
  }
}
 
void time( )
{
  fill(90, 180, 180);
  text ("turns " + lives, rectwd/8, rectht*.7);
  text ("time " + elapsedtime, rectwd/8, rectht*.4);
}
 
void gameover ( )
{
  background (255);
  fill(0);
  text ("GAME OVER!", width/2, height/2);
  fill(90, 180, 180);
  text ("Blue Circles: " + count, width/2, height*.6);
  text ("in "+ elapsedtime + " seconds", width/2, height *.65);
}
