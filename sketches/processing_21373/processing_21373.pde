
/* 
 Find the random coordinate 
 before the enemy circle gets to you
 */


// declare variables
float gameOver;
float circleX;
float circleY;
float playerCoordinateX;
float playerCoordinateY;
float winX;
float winY;
float circleSize;
float enemyCoordinateX;
float enemyCoordinateY;
float enemyCircleX;
float enemyCircleY;
float enemyMove;

// randomize where the circle turns red
void setup () 
{
  frameRate (30);
  background (255);
  size (640, 640);
  circleSize = 80;
  circleX = circleSize / 2;
  circleY = circleSize / 2; 
  playerCoordinateX = 0;
  playerCoordinateY = 0;
  winX = int(random(1, width / circleSize - 1));
  winY = int(random(1, height / circleSize - 1));
  enemyCoordinateX = width / circleSize - 1;
  enemyCoordinateY = height / circleSize - 1;
  enemyCircleX = width - circleSize / 2;
  enemyCircleY = height - circleSize / 2;
  gameOver = 0;
}

/* 
 turn the circle green at the random coordinate
 and keep it white otherwise 
 */
void draw () 
{
  background (255);
  if ((winX == playerCoordinateX) && (winY == playerCoordinateY)) {
    fill (0, 255, 0);
    gameOver = 1;
  }
  if ((winX != playerCoordinateX) || (winY != playerCoordinateY)) {
    fill (255);
  }
  if ((enemyCoordinateX == playerCoordinateX) && (enemyCoordinateY == playerCoordinateY)) 
  {
    gameOver = 2;
  }
  ellipse (circleX, circleY, circleSize, circleSize);
  ellipse (enemyCircleX, enemyCircleY, circleSize, circleSize);


  // left click to reset and double circle size
  if (circleSize < 640) 
  {
    if (mousePressed && (mouseButton == LEFT)) 
    {
      circleSize = circleSize * 2;
      circleX = circleSize / 2;
      circleY = circleSize / 2; 
      winX = int(random(1, width / circleSize - 1));
      winY = int(random(1, height / circleSize - 1));
      playerCoordinateX = 0;
      playerCoordinateY = 0;
      enemyCoordinateX = width / circleSize - 1;
      enemyCoordinateY = height / circleSize - 1;
      enemyCircleX = width - circleSize / 2;
      enemyCircleY = height - circleSize / 2;
    }
  }
  // right click to reset and halve circle size
  if (circleSize > 5) 
  {
    if (mousePressed && (mouseButton == RIGHT)) 
    {
      circleSize = circleSize / 2;
      circleX = circleSize / 2;
      circleY = circleSize / 2; 
      winX = int(random(1, width / circleSize - 1));
      winY = int(random(1, height / circleSize - 1));
      playerCoordinateX = 0;
      playerCoordinateY = 0;
      enemyCoordinateX = width / circleSize - 1;
      enemyCoordinateY = height / circleSize - 1;
      enemyCircleX = width - circleSize / 2;
      enemyCircleY = height - circleSize / 2;
    }
  }
}

// move the circle based on direction pressed
void keyPressed () 
{
  if (gameOver == 0) 
  {

    // move left
    if (circleX > circleSize / 2) 
    { 
      if (key == CODED) 
      {
        if (keyCode == LEFT) 
        {
          circleX = circleX - circleSize;
          playerCoordinateX = playerCoordinateX - 1;
          enemyMove = enemyMove + 1;

          if (enemyMove == 2) 
          {
            if (playerCoordinateX < enemyCoordinateX) 
            {
              enemyCircleX = enemyCircleX - circleSize;
              enemyCoordinateX = enemyCoordinateX - 1;
            }

            if (playerCoordinateX > enemyCoordinateX) 
            {
              enemyCircleX = enemyCircleX + circleSize;
              enemyCoordinateX = enemyCoordinateX + 1;
            }

            if (playerCoordinateY < enemyCoordinateY) 
            {
              enemyCircleY = enemyCircleY - circleSize;
              enemyCoordinateY = enemyCoordinateY - 1;
            }

            if (playerCoordinateY > enemyCoordinateY) 
            {
              enemyCircleY = enemyCircleY + circleSize;
              enemyCoordinateY = enemyCoordinateY + 1;
            }
            enemyMove = 0;
          }
        }
      }
    }



    // move right
    if (circleX < width - circleSize) 
    {
      if (key == CODED) 
      {
        if (keyCode == RIGHT) 
        {
          circleX = circleX + circleSize;
          playerCoordinateX = playerCoordinateX + 1;
          enemyMove = enemyMove + 1;

          if (enemyMove == 2) 
          {
            if (playerCoordinateX < enemyCoordinateX) 
            {
              enemyCircleX = enemyCircleX - circleSize;
              enemyCoordinateX = enemyCoordinateX - 1;
            }

            if (playerCoordinateX > enemyCoordinateX) 
            {
              enemyCircleX = enemyCircleX + circleSize;
              enemyCoordinateX = enemyCoordinateX + 1;
            }

            if (playerCoordinateY < enemyCoordinateY) 
            {
              enemyCircleY = enemyCircleY - circleSize;
              enemyCoordinateY = enemyCoordinateY - 1;
            }

            if (playerCoordinateY > enemyCoordinateY) 
            {
              enemyCircleY = enemyCircleY + circleSize;
              enemyCoordinateY = enemyCoordinateY + 1;
            }
            enemyMove = 0;
          }
        }
      }
    }




      // move up
      if (circleY > circleSize / 2) 
      { 
        if (key == CODED) 
        {
          if (keyCode == UP) 
          {
            circleY = circleY - circleSize;
            playerCoordinateY = playerCoordinateY - 1;
            enemyMove = enemyMove + 1;

            if (enemyMove == 2) 
            {
              if (playerCoordinateX < enemyCoordinateX) 
              {
                enemyCircleX = enemyCircleX - circleSize;
                enemyCoordinateX = enemyCoordinateX - 1;
              }
              if (playerCoordinateX > enemyCoordinateX) 
              {
                enemyCircleX = enemyCircleX + circleSize;
                enemyCoordinateX = enemyCoordinateX + 1;
              }
              if (playerCoordinateY < enemyCoordinateY) 
              {
                enemyCircleY = enemyCircleY - circleSize;
                enemyCoordinateY = enemyCoordinateY - 1;
              }
              if (playerCoordinateY > enemyCoordinateY) 
              {
                enemyCircleY = enemyCircleY + circleSize;
                enemyCoordinateY = enemyCoordinateY + 1;
              }
              enemyMove = 0;
            }
          }
        }
      }
    

    // move down
    if (circleY < height - circleSize) 
    { 
      if (key == CODED) 
      {
        if (keyCode == DOWN) 
        {
          circleY = circleY + circleSize;
          playerCoordinateY = playerCoordinateY + 1;
          enemyMove = enemyMove + 1;

          if (enemyMove == 2) 
          {
            if (playerCoordinateX < enemyCoordinateX) 
            {
              enemyCircleX = enemyCircleX - circleSize;
              enemyCoordinateX = enemyCoordinateX - 1;
            }
            if (playerCoordinateX > enemyCoordinateX) 
            {
              enemyCircleX = enemyCircleX + circleSize;
              enemyCoordinateX = enemyCoordinateX + 1;
            }
            if (playerCoordinateY < enemyCoordinateY) 
            {
              enemyCircleY = enemyCircleY - circleSize;
              enemyCoordinateY = enemyCoordinateY - 1;
            }
            if (playerCoordinateY > enemyCoordinateY) 
            {
              enemyCircleY = enemyCircleY + circleSize;
              enemyCoordinateY = enemyCoordinateY + 1;
            }
            enemyMove = 0;
          }
        }
      }
    }
  }
}








