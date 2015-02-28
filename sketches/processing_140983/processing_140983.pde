
float x;
float y;
float easing = 0.05;
float diameter = 35;
int score = 0;
int nextScoreLevel = 100;
int level = 1;
long startTime = 0;
long storedTime = 0;
boolean gameOver = false;
boolean gamePaused = false;
PFont impact;
 
void setup()
{
  size(740, 480);
  smooth();
  noStroke();
  background(102);
  startTime = millis();
  frameRate(30);
  impact = createFont("Impact", 40);
}
 
void draw()
{
  if (gameOver) return;
  if (millis() % 1000 < 100) redrawAll();
  noStroke();
  float targetX = mouseX;
  x += (targetX - x) * easing;
  float targetY = mouseY;
  y += (targetY - y) * easing;
  boolean outOfBounds = ((closeEnough(mouseX, 0) || closeEnough(mouseX, width)) || (closeEnough(mouseY, 0) || closeEnough(mouseY, height)));
  if (gamePaused && outOfBounds) return;
  if (overEllipse() && !outOfBounds)
  {
    fill(255, 0, 255, 255);
    score-=10;
  } 
  else if(!overEllipse())
  {
    fill(255, 255, 0, 255);
    score++;
  } 
  else
  {
    pauseGame();
  }
  if (!outOfBounds && gamePaused)
  {
    resumeGame();
  }
  ellipse(x, y, diameter, diameter);
  if (score > nextScoreLevel)
  {
    easing *= 1.5;
    println("Increasing difficulty");
    nextScoreLevel += 100;
    level++;
  }
  if (score < 0)
  {
    fill(255, 255);
    textFont(impact);
    text("You made it to level " + level + ".", width/8, 60);
    text("press 'r' to restart.", width/8, 120);
    text("Press 'q' to quit.", width/8, 180);
    gameOver = true;
  }
  fill(102);
  rect(0, height - 100, 100, 100);
  drawBorder();
  textFont(impact);
  fill(255, 75);
  text(score + "", 0, height);
}
 
boolean overEllipse()
{
  return (dist(x, y, mouseX, mouseY) < diameter);
}
 
void redrawAll()
{
  background(102);
}
 
void drawBorder()
{
  stroke(255);
  line(0,0,0,height-1);
  line(0,height-1,width-1,height-1);
  line(width-1,height-1,width-1,0);
  line(width-1,0,0,0);
}
 
boolean closeEnough(int a, int b)
{
  return abs(a-b)<10;
}
 
void mousePressed()
{
  if ((mouseButton == RIGHT) && gameOver)
  {
    reset();
  }
}
 
void pauseGame()
{
  storedTime = millis() - startTime + storedTime;
  gamePaused = true;
}
 
void resumeGame()
{
  startTime = millis() - storedTime;
  gamePaused = true;
}
 
void keyTyped()
{
  if (key == 'q')
  {
    exit();
  } else if ((key == 'r') && gameOver)
  {
    reset();
  }
}
 
void reset()
{
  score = 0;
  startTime = millis();
  redrawAll();
  gameOver = false;
  easing = 0.05;
}



