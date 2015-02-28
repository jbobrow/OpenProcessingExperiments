
float level = 1;
float lvlmoves;
float savedmoves;
float counter;
boolean Timer;

gameBoard gb;
gameBall ball;
gameBall hole;
Boundaries walls [];

color rgb = color(random(30, 220), random(30, 220), random(30, 220));

void setup()
{
  size (600, 700);
  ellipseMode(CORNER);
  rectMode(CORNER);

  gb = new gameBoard();
  ball = new gameBall();
  hole = new gameBall();
  walls = new Boundaries [10];

  for (int i=0; i < walls.length; i++)
  {
    walls[i] = new Boundaries();
  }

  currentLevels();
}

void draw()
{
  moveFigure();
  bounceOffWalls();
  collisionWithHole();

  background (0);
  fill (255);
  stroke(rgb);   
  strokeWeight(5);

  gb.draw();
  drawFigures ();

  if (Timer == true)
  {
    counter += 1;
  }
  if (level > 10)
  {
    Timer = false;
  }
}

void drawFigures()
{
  for (int i=0; i < walls.length; i++)
  {
    walls[i].draw();
  }

  stroke(0);
  strokeWeight(1);

  if (mousePressed == true)
  {
    line (ball.x + (ball.w / 2), ball.y + (ball.h / 2), mouseX, mouseY);
  }

  fill (0);
  ellipse (hole.x, hole.y, ball.w, ball.h);

  fill (255);
  ball.draw();
}

void moveFigure()
{
  ball.x = ball.x - ball.moveX;
  ball.y = ball.y - ball.moveY;
  ball.moveX *= 0.985;
  ball.moveY *= 0.985;
}


void mouseReleased()
{
  ball.moveX = (ball.x - mouseX) / 25;
  ball.moveY = (ball.y - mouseY) / 25;
  lvlmoves -= 1;
  Timer = true;

  if (lvlmoves < 0)
  {
    currentLevels();
  }
}

void collisionWithHole ()
{
  if (sqrt (sq(ball.x - hole.x) + sq(ball.y - hole.y)) - 5 <= ball.w / 2)
  {
    //Timer = false;
    ball.moveX = 0;
    ball.moveY = 0;
    level += 1;
    rgb = color(random(30, 220), random(30, 220), random(30, 220));
    currentLevels();
  }
}

void bounceOffWalls()
{
  if (ball.x <= gb.x)
  {
    ball.x = gb.x;
    ball.moveX *= -1;
  }

  else if (ball.x + ball.w >= gb.x + gb.w)
  {
    ball.x = (gb.x + gb.w) - ball.w;
    ball.moveX *= -1;
  }

  if (ball.y <= gb.y)
  {
    ball.y = gb.y;
    ball.moveY *= -1;
  }

  else if (ball.y + ball.w >= gb.y + gb.h)
  {
    ball.y = (gb.y + gb.h) - ball.h;
    ball.moveY *= -1;
  }

  for (int i=0; i < walls.length; i++)
  {
    if (ball.intersects(walls[i]))
    {
      ball.moveX = 0;
      ball.moveY = 0;
      lvlmoves = savedmoves;
      currentLevels();
    }
  }
}

void changeLevel(int moves, int x, int tX, int tY, int t2X, int t2Y)
{
  for (int i = 0 ; i < x; i++)
  {
    walls[i].visible = true;
  }

  for (int i = x; i < walls.length; i++)
  {
    walls[i].visible = false;
    walls[i].x = 0;
    walls[i].y = 0;
  }

  lvlmoves = moves;
  savedmoves = moves;
  hole.x = tX;
  hole.y = tY;
  ball.x = t2X;
  ball.y = t2Y;
}

class gameBoard
{
  float x, y, w, h;

  gameBoard ()
  {
    w = 450;
    h = 600;
    x = 75;
    y = 65;
  }

  void draw()
  {
    rect (x, y, w, h);
    rect (75, 5, 450, 50);
    fill(0);
    textSize(15);
    text ("Moves Remaining: " + lvlmoves, 88, 35);
    text ("Level: " + level, 270, 35);
    String td = nf((counter / 60), 1, 2);
    text ("Total Time: " + td, 385, 35);
    fill(255);
    text ("Created by: Jacob Kadzielski", 325, 685);
  }
}


class gameBall
{
  float x, y, w, h, moveX, moveY;

  gameBall ()
  {
    w = 30;
    h = w;
    x = x;
    y = y;
    moveX = moveX;
    moveY = moveY;
  }

  boolean intersects (Boundaries other)
  {
    return (x <= other.x + other.w) && (y <= other.y + other.h) && (x + w >= other.x) && (y + h >= other.y);
  }

  void draw()
  {
    ellipse (x, y, w, h);
  }
}

class Boundaries
{
  float x, y, w, h;
  boolean visible;

  Boundaries ()
  {
    w = w;
    h = h;
    x = x;
    y = y;
    visible = true;
  }

  void draw()
  {
    if (visible == true)
    {
      fill (rgb);
      rect (x, y, w, h);
    }
  }
}

void currentLevels()
{
  if (level == 1)
  {
    changeLevel(5, 1, 450, 115, 100, 115); 
    walls[0].w = 185;
    walls[0].h = 500;
    walls[0].x = 200;
    walls[0].y = 65;
  }
  if (level == 2)
  {
    changeLevel(5, 2, 450, 585, 100, 115); 
    walls[0].w = 350;
    walls[0].h = 200;
    walls[0].x = 175;
    walls[0].y = 65;
    walls[1].w = 350;
    walls[1].h = 300;
    walls[1].x = 75;
    walls[1].y = 365;
  }
  if (level == 3)
  { 
    changeLevel(7, 3, 475, 90, 475, 595);
    walls[0].w = 350;
    walls[0].h = 55;
    walls[0].x = 175;
    walls[0].y = 475;
    walls[1].w = 55;
    walls[1].h = 300;
    walls[1].x = 175;
    walls[1].y = 70;
    walls[2].w = 200;
    walls[2].h = 50;
    walls[2].x = 325;
    walls[2].y = 175;
  }
  if (level == 4)
  {
    changeLevel(5, 2, 100, 605, 100, 90);
    walls[0].w = 300;
    walls[0].h = 250;
    walls[0].x = 150;
    walls[0].y = 140;
    walls[1].w = 375;
    walls[1].h = 130;
    walls[1].x = 75;
    walls[1].y = 455;
  }
  if (level == 5)
  {
    changeLevel(5, 3, 355, 605, 200, 605);
    walls[0].w = 75;
    walls[0].h = 505;
    walls[0].x = 255;
    walls[0].y = 155;
    walls[1].w = 100;
    walls[1].h = 100;
    walls[1].x = 150;
    walls[1].y = 155;
    walls[2].w = 100;
    walls[2].h = 100;
    walls[2].x = 330;
    walls[2].y = 155;
  }
  if (level == 6)
  {
    changeLevel(7, 2, 450, 585, 100, 115); 
    walls[0].w = 50;
    walls[0].h = 500;
    walls[0].x = 175;
    walls[0].y = 65;
    walls[1].w = 50;
    walls[1].h = 500;
    walls[1].x = 350;
    walls[1].y = 165;
  }
  if (level == 7)
  {
    changeLevel(8, 4, 455, 605, 100, 605);
    walls[0].w = 225;
    walls[0].h = 230;
    walls[0].x = 185;
    walls[0].y = 435;
    walls[1].w = 75;
    walls[1].h = 275;
    walls[1].x = 80;
    walls[1].y = 70;
    walls[2].w = 75;
    walls[2].h = 275;
    walls[2].x = 450;
    walls[2].y = 70;
    walls[3].w = 75;
    walls[3].h = 275;
    walls[3].x = 260;
    walls[3].y = 270;
  }
  if (level == 8)
  {
    changeLevel(9, 5, 475, 90, 475, 595);
    walls[0].w = 200;
    walls[0].h = 405;
    walls[0].x = 325;
    walls[0].y = 165;
    walls[1].w = 75;
    walls[1].h = 80;
    walls[1].x = 250;
    walls[1].y = 490;
    walls[2].w = 100;
    walls[2].h = 350;
    walls[2].x = 75;
    walls[2].y = 315;
    walls[3].w = 75;
    walls[3].h = 100;
    walls[3].x = 175;
    walls[3].y = 315;
    walls[4].w = 175;
    walls[4].h = 75;
    walls[4].x = 175;
    walls[4].y = 165;
  }
  if (level == 9)
  {
    changeLevel(8, 3, 475, 595, 475, 90);
    walls[0].w = 75;
    walls[0].h = 375;
    walls[0].x = 375;
    walls[0].y = 65;
    walls[1].w = 250;
    walls[1].h = 50;
    walls[1].x = 275;
    walls[1].y = 515;
    walls[2].w = 130;
    walls[2].h = 425;
    walls[2].x = 150;
    walls[2].y = 140;
  }
  if (level == 10)
  {
    changeLevel(9, 6, 475, 575, 100, 90);
    walls[0].w = 50;
    walls[0].h = 300;
    walls[0].x = 175;
    walls[0].y = 65;
    walls[1].w = 50;
    walls[1].h = 200;
    walls[1].x = 175;
    walls[1].y = 465;
    walls[2].w = 50;
    walls[2].h = 50;
    walls[2].x = 300;
    walls[2].y = 615;
    walls[3].w = 50;
    walls[3].h = 430;
    walls[3].x = 300;
    walls[3].y = 140;
    walls[4].w = 100;
    walls[4].h = 50;
    walls[4].x = 425;
    walls[4].y = 265;
    walls[5].w = 100;
    walls[5].h = 50;
    walls[5].x = 350;
    walls[5].y = 440;
  }
}



