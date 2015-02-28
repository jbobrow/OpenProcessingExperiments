
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;


void keyPressed()
{
  //if(screenNumber != 1) return;

  if (key == 'w' && !sPressed)
  {
    aPressed = sPressed = dPressed = false;
    wPressed = true;
  }
  else if (key == 'a' && !dPressed)
  {
    wPressed = sPressed = dPressed = false;
    aPressed = true;
  }
  else if (key == 's' && !wPressed)
  {
    wPressed = aPressed = dPressed = false;
    sPressed = true;
  }
  else if (key == 'd' && !aPressed)
  {
    wPressed = aPressed = sPressed = false;
    dPressed = true;
  }

  //rightPressed = leftPressed = upPressed = downPressed = false;
  if (keyCode == RIGHT) rightPressed = true;
  else if (keyCode == LEFT)  leftPressed = true;
  else if (keyCode == UP)    upPressed = true;
  else if (keyCode == DOWN)  downPressed = true;
  //if(screenNumber != 1) return;

  if (keyCode == RIGHT && !leftPressed)
  {
    upPressed = leftPressed = downPressed = false;
    rightPressed = true;
  }
  else if (keyCode == LEFT && !rightPressed)
  {
    rightPressed = upPressed = downPressed = false;
    leftPressed = true;
  }
  else if (keyCode == UP && !downPressed)
  {
    rightPressed = leftPressed = downPressed = false;
    upPressed = true;
  }
  else if (keyCode == DOWN & !upPressed)
  {
    rightPressed = leftPressed = upPressed = false;
    downPressed = true;
  }
}


void stuff()
{
  if (wPressed) pp1--;
  if (aPressed) p1--;
  if (sPressed) pp1++;
  if (dPressed) p1++; 

  if (rightPressed) p2++;
  if (leftPressed)  p2--;
  if (upPressed)    pp2--;
  if (downPressed)  pp2++;

  if (p1>525) p1 = -25;
  if (p1<-25) p1 = 525;
  if (pp1>525) pp1 = -25;
  if (pp1<-25) pp1 = 525;
  if (p2>525) p2 = -25;
  if (p2<-25) p2 = 525;
  if (pp2>525) pp2 = -25;
  if (pp2<-25) pp2 = 525;

  //---------------------

  c1 = c1 + 5;
  c2 = c2 + 3;
  c3 = c3 - 10;
  time = time + 1;
  end = end + 1;

  if (c1>525)
  {
    c1 = random(-100, -200);
    cc1 = random(25, 475);
  }
  if (c2>525) 
  {
    c2 = random(-100, -200);
    cc2 = random(25, 475);
  }
  if (c3<-25) 
  {
    c3 = random(600, 700);
    cc3 = random(25, 475);
  }
  if (time>200)
  {
    time = 0;
    b1 = random(25,475);
    bb1 = random(25, 475);
  }
  if (end > 1005)
  {
   screenNumber = 7;
   end = 0;
  }
}


