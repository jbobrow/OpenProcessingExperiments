
boolean upPressed, leftPressed, downPressed, rightPressed, reset, startgame;
int speed;


void keyPressed()
{
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == UP) {
    upPressed = true;
  }
  if (keyCode == 82) reset = true;
}

void keyReleased()
{
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == UP)    upPressed = false;
  if (keyCode == 82) reset = false;
}


