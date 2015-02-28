
void keyPressed()
{
  if (keyCode == LEFT) {
    if (keyToggle == false) {
      rotateLeft = true;
      keyToggle = true;
      block.trigger();
    }
  }
  if (keyCode == RIGHT) {
    if (keyToggle == false) {
      rotateRight = true;
      keyToggle = true;
      block.trigger();
    }
  }

  if (keyCode == UP) {
    if (playerMoveUp == true)
    {
      playerY--;
    }
  }

  if (keyCode == DOWN) {
    if (playerMoveDown == true)
    {
      playerY++;
    }
  }

  if (keyCode == ENTER) {
    if (canReset == true)
    {
      keyToggle = false;
      holdImage = true;
      showTimer = true;
      rotateLeft = false;
      rotateRight = false;
      winCondition = false;
      canReset = false;
      timer = 0;
      twist_factor = 0;
      playerY = -10;
      counter = 0;
      translate(250, 250);
      image(maze, 250, 250);
    }
  }
}


