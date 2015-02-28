
/*
Created By: Miranda Kuang // Sep. 21 . 2011
 -Arrow Arrow Keys To Move
 -Press Space To Adjust Brightness
 */

//----------------------------------------------------------------------------------

back g;
float x, y;
boolean upPressed, downPressed, rightPressed, leftPressed, spacePressed;
squar a, b, c, d;
float re, gr, bl;

void keyPressed()
{
  if (key == ' ')  spacePressed = true;
  if (key == CODED)
  {
    if (keyCode == UP) upPressed = true;
    if (keyCode == DOWN) downPressed = true;
    if (keyCode == RIGHT) rightPressed = true;
    if (keyCode == LEFT) leftPressed = true;
  }
}

void keyReleased()
{
  if ( key == ' ') spacePressed = false;
  if (keyCode == UP) upPressed = false;
  if (keyCode == DOWN) downPressed = false;
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT) leftPressed = false;
}

void setup()
{
  fill(0);
  size(300, 300);
  smooth();
  upPressed = downPressed = rightPressed = leftPressed = spacePressed = false;
  re = gr = bl = random(0, 225);

  a = new squar();
  a.x = a.y = 0;

  b = new squar();
  b.x = 50;
  b.y = 100;

  c = new squar();
  c.x = 250;
  c.y = 50;

  d = new squar();
  d.x = 200;
  d.y = 250;

  g = new back();
}


void draw()
{
  fill(0, 12);
  rect(-50, -50, 350, 350);
  g.show();
  junk();
  a.show();
  //b.show();
  //c.show();
  ///d.show(); 
  a.move();
  b.move();
  c.move();
  d.move();
}

class squar
{
  float x, y;

  void show()
  {
    noStroke();
    fill(255);
    rect(x, y, 50, 50);
  }


  void move()
  {
    if (upPressed) y = y - 50;
    if (downPressed) y = y + 50;
    if (rightPressed) x = x + 50;
    if (leftPressed) x = x - 50;
    if (spacePressed) re = gr = bl = random(0, 255);
    if (x>250) x = 0;
    if (y>250) y = 0;
    if (x<0) x = 250;
    if (y<0) y = 250;
  }
}

class back
{


  void show()
  {

    fill(re, 0, 0);
    rect(0, 50, 50, 50);
    rect(50, 100, 50, 50); 
    rect(50, 250, 50, 50);
    rect(100, 150, 50, 50);
    rect(150, 50, 50, 50); 
    rect(150, 200, 50, 50);
    rect(200, 100, 50, 50);
    rect(200, 250, 50, 50);
    rect(250, 150, 50, 50);
    rect(100, 0, 50, 50); 
    rect(0, 200, 50, 50);
    rect(250, 0, 50, 50);  
    //---------------------- 
    fill(0, 0, bl);
    rect(0, 0, 50, 50);
    rect(150, 0, 50, 50); 
    rect(0, 150, 50, 50); 
    rect(50, 50, 50, 50);
    rect(50, 200, 50, 50); 
    rect(100, 100, 50, 50);
    rect(100, 250, 50, 50); 
    rect(150, 150, 50, 50);
    rect(200, 50, 50, 50); 
    rect(200, 200, 50, 50);
    rect(250, 100, 50, 50);
    rect(250, 250, 50, 50);
    //------------------------
    fill(0, gr, 0);
    rect(50, 0, 50, 50);
    rect(200, 0, 50, 50); 
    rect(0, 100, 50, 50); 
    rect(0, 250, 50, 50);
    rect(50, 150, 50, 50); 
    rect(100, 50, 50, 50); 
    rect(100, 200, 50, 50); 
    rect(150, 100, 50, 50);
    rect(150, 250, 50, 50);
    rect(200, 150, 50, 50);
    rect(250, 50, 50, 50); 
    rect(250, 200, 50, 50);
  }
}

void junk()
{
  if (upPressed) y = y - 50;
  if (downPressed) y = y + 50;
  if (rightPressed) x = x + 50;
  if (leftPressed) x = x - 50;
  if (spacePressed) re = gr = bl = random(0, 255);
  if (x>301) x = 0;
  if (y>301) y = 0;
  if (x<0) x = 301;
  if (y<0) y = 301;
}


                
                
