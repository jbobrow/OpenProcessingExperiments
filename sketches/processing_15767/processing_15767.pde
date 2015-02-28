
/*
*Amy Zhen
 *October 29, 2010
 *Eat!
 */

int x, y, u, v;
int screenNumber;
int aScore;
int speed;
float bombx, bomby, icecreamx, icecreamy;
PFont font;
PImage bomb;
PImage icecream;
PImage goat;

void setup()
{
  size(700, 700);
  rectMode(CENTER);
  font = loadFont("ComicSansMS-48.vlw");
  bomb = loadImage("bomb copy.gif");
  icecream = loadImage("ice cream copy.gif");
  goat = loadImage("goat.gif");
  textFont(font, 48);

  x += ( mouseX - width/2  ) * 0.1 * v;
  y += ( mouseY - height/2 ) * 0.1 * v;
  u = v = width/4;
  bombx = bomby = width/2;
  icecreamx = icecreamy = width/3;

  screenNumber = 0;
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

    checkPrize();
    drawPrize();

    checkPlayerOverlap();
    setSpeedLevel();
    displayScore();
  }
  else if (screenNumber == 2)
  {
    displayWinner();
  }
}

void displayWinner()
{
  aScore = 0;
  fill(229, 151, 170);
  text("You win!!", 50, 100);
  if (mousePressed) screenNumber = 0;
}

void displayInstructions()
{
  fill(193, 115, 183);
  text("Eat!", 50, 100);
  fill(122, 95, 167);
  text("Click to start playing", 50, 200);
  fill(19, 55, 191);
  text("Eat the         !", 50, 300);
  image(icecream, icecreamx, icecreamy, 90, 103);
  fill(252, 157, 31);
  text("Use the mouse", 50, 400);
  if (mousePressed)
  {
    screenNumber = 1;
    icecreamx = random(width);
    icecreamy = random(height);
  }
}

void displayScore()
{
  fill(252, 31, 75);
  text("Your Score: " + aScore, 10, 40);
}

void setSpeedLevel()
{
  speed = 2;
  if(aScore>20) speed = 3;
  if(aScore>50) speed = 4;
  if(aScore>70) speed = 5;
  if(aScore>100) screenNumber = 2;
}

void checkPlayerOverlap()
{
  if (dist(x, y, bombx, bomby) < 15)
  {
    aScore -= 10;
  }
  if (dist(x, y, icecreamx, icecreamy) < 15)
  {
    aScore += 10;
  }
}

void drawPrize()
{
  image(bomb, bombx, bomby);
  image(icecream, icecreamx, icecreamy);
}

void checkPrize()
{
  if(abs(mouseX - bombx) < 10 && abs(mouseY - bomby) < 10)
  {
    aScore -= 10;
    drawPlayers();
  }
  if(abs(mouseX - icecreamx) < 9 && abs(mouseY - icecreamy) < 9)
  {
    aScore += 10;
    drawPlayers();
  }
}

void drawPlayers()
{
  image(bomb, bombx, bomby, 62, 72);
  image(icecream, icecreamx, icecreamy, 77, 90);
  bombx += 1;
  bomby += 1;
  bombx = bombx + speed;
  bomby = bomby - speed;
  if(bombx > width) 
  {
    bombx = 0;
    bomby = random(height);
  }
  icecreamx += 1;
  icecreamy += 1;
  icecreamx = icecreamx + speed;
  icecreamy = icecreamy - speed;
  if (icecreamx > width)
  {
    icecreamx = 0;
    icecreamy = random(height);
  }
}

void movePlayers()
{
  image(goat, mouseX-60, mouseY-60, 120, 120);
}


