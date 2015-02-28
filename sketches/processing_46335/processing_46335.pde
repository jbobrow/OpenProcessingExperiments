
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;

void keyPressed()
{
  if (screenNum != GAME) return;

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

  if (keyCode == RIGHT && !leftPressed)
  {
    upPressed = downPressed = leftPressed = false;
    rightPressed = true;
  }
  else if (keyCode == LEFT && !rightPressed)
  {
    upPressed = downPressed = rightPressed = false;
    leftPressed = true;
  }
  else if (keyCode == UP && !downPressed)
  {
    rightPressed = downPressed = leftPressed = false;
    upPressed = true;
  }
  else if (keyCode == DOWN && !upPressed)
  {
    upPressed = rightPressed = leftPressed = false;
    downPressed = true;
  }
}


