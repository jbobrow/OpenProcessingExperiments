
//Mira A | TRON | CP1 | Mods 16/17

//Variables for player.
int x;
int y;
int direction = RIGHT;
//Variables for computer player.
int compx;
int compy;
int cdirection = LEFT;
int rand;
//Variable tracking whether the game is over or not.
boolean lose;

void setup()
{
  //Starting location of player.
  x = 100;
  y = 250;
  //Starting location of computer player.
  compx = 404;
  compy = 250;
  //The game is not over yet.
  lose = false;
  //Self explanatory.
  size(500, 500);
  background(0);
  noStroke();
  //Lighter green border.
  fill(249, 255, 216);
  rect(5, 5, 5, 490);
  rect(490, 5, 5, 490);
  rect(5, 5, 490, 5);
  rect(5, 490, 490, 5);
  //Lighter green obstacles.
  rect(150, 200, 5, 100);
  rect(250, 200, 5, 100);
  rect(350, 200, 5, 100);
  rect(100, 100, 300, 5);
  rect(100, 400, 300, 5);
  rect(50, 100, 5, 305);
  rect(450, 100, 5, 305);
  //Darker green border.
  fill(212, 240, 63);
  rect(0, 0, 5, 500);
  rect(495, 0, 5, 500);
  rect(0, 495, 500, 5);
  rect(0, 0, 500, 5);
  rect(10, 10, 5, 480);
  rect(485, 10, 5, 480);
  rect(10, 485, 480, 5);
  rect(10, 10, 480, 5);
  //Darker green obstacles.
  rect(145, 195, 5, 110);
  rect(155, 195, 5, 110);
  rect(145, 195, 15, 5);
  rect(145, 300, 15, 5);
  rect(245, 195, 5, 110);
  rect(255, 195, 5, 110);
  rect(245, 195, 15, 5);
  rect(245, 300, 15, 5);
  rect(345, 195, 5, 110);
  rect(355, 195, 5, 110);
  rect(345, 195, 15, 5);
  rect(345, 300, 15, 5);
  rect(95, 95, 310, 5);
  rect(95, 105, 310, 5);
  rect(95, 95, 5, 15);
  rect(400, 95, 5, 15);
  rect(95, 395, 310, 5);
  rect(95, 405, 310, 5);
  rect(95, 395, 5, 15);
  rect(400, 395, 5, 15);
  rect(45, 95, 5, 310);
  rect(55, 95, 5, 310);
  rect(45, 95, 15, 5);
  rect(45, 405, 15, 5);
  rect(445, 95, 5, 310);
  rect(455, 95, 5, 310);
  rect(445, 95, 15, 5);
  rect(445, 405, 15, 5);
  rect(85, 242, 15, 15);
  rect(405, 242, 15, 15);
  //misc
  fill(0);
  rect(100, 245, 100, 10);
  rect(300, 245, 100, 10);
  rect(200, 245, 100, 10);
  fill(212, 240, 63);
  rect(145, 240, 15, 5);
  rect(345, 240, 15, 5);
  rect(245, 240, 15, 5);
  rect(145, 255, 15, 5);
  rect(245, 255, 15, 5);
  rect(345, 255, 15, 5);
  fill(249, 255, 216);
  rect(90, 247, 5, 5);
  rect(410, 247, 5, 5);
  //Self explanatory.
  frameRate(100);
}

void draw()
{
  if (lose == true)
  {
    //Reset canvas if the game is over and mouse is pressed.
    if (mousePressed == true && mouseButton == LEFT)
    {
      setup();
      //Returns player direction to right.
      if (keyCode == LEFT)
      {
        keyCode = RIGHT;
      }
      else if (keyCode == UP)
      {
        keyCode = RIGHT;
      }
      else if (keyCode == DOWN)
      {
        keyCode = RIGHT;
      }
      //Returns computer direction to left.
      cdirection = LEFT;
    }
  }
  else
  {
    //If game is not over, computer and player can move.
    keyPressed();
    human();
    computer();
  }
}

void human()
{
  //If player loses, message is displayed and game can be reset.
  if ((get(x, y) != color(0, 0, 0)) && lose == false)
  {
    fill(106, 136, 85);
    textAlign(CENTER);
    textSize(20);
    text("YOU LOSE. \n HOW DISAPPOINTING.", 250, 250);
    lose = true;
  }
  //If both players have not lost, player may continue moving.
  else
  {
    //Light trail.
    stroke(212, 240, 63);
    point(x, y);
    //Direction of movement.
    if (direction == RIGHT)
    {
      x = x + 1;
    }
    else if (direction == LEFT)
    {
      x = x - 1;
    }
    else if (direction == DOWN)
    {
      y = y + 1;
    }
    else if (direction == UP)
    {
      y = y - 1;
    }
  }
}

void computer()
{
  //If computer player loses, message is displayed and game can
  //be reset.
  if ((get(compx, compy) != color(0, 0, 0)) && lose == false)
  {
    fill(106, 136, 85);
    textAlign(CENTER);
    textSize(20);
    text("YOU WIN. \n CONGRATULATIONS.", 250, 250);
    lose = true;
  }
  //If both players have not lost, computer player may continue 
  //moving.
  else
  {
    //Light trail.
    stroke(249, 255, 216);
    point(compx, compy);
    //Direction of movement.
    if (cdirection == LEFT)
    {
      compx = compx - 1;
      //Change direction (up or down) randomly if in danger of
      //collision. If area is blocked, move in the opposite
      //direction.
      if ((get(compx - 1, compy)) != color(0, 0, 0))
      {
        if (get(compx, compy - 1) != color(0, 0, 0))
        {
          cdirection = DOWN;
        }
        else if (get(compx, compy + 1) != color(0, 0, 0))
        {
          cdirection = UP;
        }
        else 
        {
          rand = int(random(2));
          if (rand == 0)
          {
            cdirection = UP;
          }
          else if (rand == 1)
          {
            cdirection = DOWN;
          }
        }
      }
    }
    //Change direction (up or down) randomly if in danger of
    //collision. If area is blocked, move in the opposite
    //direction.
    if (cdirection == RIGHT)
    {
      compx = compx + 1;
      if ((get(compx + 1, compy)) != color(0, 0, 0))
      {
        if (get(compx, compy + 1) != color(0, 0, 0))
        {
          cdirection = UP;
        }
        else if (get(compx, compy - 1) != color(0, 0, 0))
        {
          cdirection = DOWN;
        }
        else 
        {
          rand = int(random(2));
          if (rand == 0)
          {
            cdirection = DOWN;
          }
          else if (rand == 1)
          {
            cdirection = UP;
          }
        }
      }
    }
    //Change direction (right or left) randomly if in danger of
    //collision. If area is blocked, move in the opposite
    //direction.
    if (cdirection == UP)
    {
      compy = compy - 1;
      if ((get(compx, compy - 1)) != color(0, 0, 0))
      {
        if (get(compx + 1, compy) != color(0, 0, 0))
        {
          cdirection = LEFT;
        }
        else if (get(compx - 1, compy) != color(0, 0, 0))
        {
          cdirection = RIGHT;
        }
        else 
        {
          rand = int(random(2));
          if (rand == 0)
          {
            cdirection = RIGHT;
          }
          else if (rand == 1)
          {
            cdirection = LEFT;
          }
        }
      }
    }
    //Change direction (right or left) randomly if in danger of
    //collision. If area is blocked, move in the opposite
    //direction.
    if (cdirection == DOWN)
    {
      //If direction is down, move downwards.
      compy = compy + 1;
      if ((get(compx, compy + 1)) != color(0, 0, 0))
      {
        if (get(compx - 1, compy) != color(0, 0, 0))
        {
          cdirection = RIGHT;
        }
        else if (get(compx + 1, compy) != color(0, 0, 0))
        {
          cdirection = LEFT;
        }
        else 
        {
          rand = int(random(2));
          if (rand == 0)
          {
            cdirection = LEFT;
          }
          else if (rand == 1)
          {
            cdirection = RIGHT;
          }
        }
      }
    }
  }
}

//Moves player in a certain direction when a key corresponding
//to said direction is pressed.
void keyPressed()
{
  if (key == CODED)
  {
    //If the "right" key is pressed, the player will move right.
    if (keyCode == RIGHT)
    {
      direction = RIGHT;
    }
    //If the "left" key is pressed, the player will move right.
    else if (keyCode == LEFT)
    {
      direction = LEFT;
    }
    //If the "down" key is pressed, the player will move right.
    else if (keyCode == DOWN)
    {
      direction = DOWN;
    }
    //If the "up" key is pressed, the player will move right.
    else if (keyCode == UP)
    {
      direction = UP;
    }
  }
}
