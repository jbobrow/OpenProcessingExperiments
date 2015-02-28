
/* gnoP by Wainer Fan
 Oct. 29, 2010
 */
boolean wPressed, sPressed;
boolean upPressed, downPressed;

float x, y;
float g, h;
float j, k;
float jv, kv;
float r;

int screenNumber;
int aScore, bScore;
int speed;
PFont font;

void setup()
{
  size(500,300);
  smooth();
  noStroke();
  rectMode(CENTER);
  font = loadFont("ComicSansMS-32.vlw");
  textFont(font,32);

  x = 20;
  y = height/2;
  g = 480;
  h = height/2;
  j = 30;
  k = height/2;
  r = 10;
  kv = jv = 4;
}
void draw()
{
  background(0);
  if (screenNumber == 0)
  {
    displayInstructions();
  }
  else if (screenNumber == 1)
  {
    movePlayers(); 
    drawPlayers();
    drawBall();
    moveBall();

    setSpeedLevel();
    displayScore();
  }
  if (screenNumber == 2)
  {
    screenEnd();
    if (mousePressed) screenNumber = 0;
  }
}

void displayInstructions()
{
  fill(255); 
  text("gnoP",50,100);
  text("click to start",50,200);
  if (mousePressed) screenNumber = 1;
}

void drawPlayers()
{
  fill(255); 
  rect(x,y,10,70);
  rect(g,h,10,70);
} 

void setSpeedLevel()
{
  speed = 4; 
  if(aScore>5 || bScore>5) speed = 5; 
  if(aScore>8 || bScore>8) speed = 7;
  if(aScore>10 || bScore>10) speed = 8; 

  if (j >= width - 2.5)
  {
   aScore += 1;
  }

  if (j <= r)
  {
    bScore += 1;
  }
}

void movePlayers()
{
  if (wPressed) y -= speed;
  if (sPressed) y += speed;
  if (upPressed)    h -= speed;
  if (downPressed)  h += speed;

  if ( y >= 266)
  {
    y = 265;
  }
  if (y <= 34)
  {
    y = 35;
  }
  if (h >= 266)
  {
    h = 265;
  }
  if (h <= 34)
  {
    h = 35;
  }
}

void keyPressed()
{
  if (key == 'w') wPressed = true; 
  if (key == 's') sPressed = true;
  if (keyCode == UP) upPressed = true;
  if (keyCode == DOWN) downPressed = true;
}

void keyReleased()
{
  if (key == 'w') wPressed = false; 
  if (key == 's') sPressed = false;
  if (keyCode == UP) upPressed = false;
  if (keyCode == DOWN) downPressed = false;
}
void drawBall()
{
  fill(255);
  ellipse(j,k,r,r);
}

void moveBall()
{
  k += kv;
  j += jv;

  if (k > (height-r) || k < r)
  {
    kv *= -1;
  }

  if(j > g && k > h - 35 && k < h + 35)
  {
    jv *= -1;
  }

  if(j < x && k > y -35 && k < y + 35)
  {
    jv *= -1;
  }
  if( j > (width) || j < r)
  {
   j = width/2;
   k = height/2;
   }
}

void displayScore()
{
  fill(255); 
  text(" " + aScore, 10, 35);
  text(" " + bScore, 450, 35);

  if (aScore == 25)
  {
    screenNumber = 2;
  }

  if (bScore == 25)
  {
    screenNumber = 2;
  }
}

void screenEnd()
{
  background(0);
  text("You are WINNER!", 10, 50);
}


