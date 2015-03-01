

int shotx = 250;
int shoty =250;
int speed = 10;
int shotExist = 0;
int targetExist = 0;
int targetDraw = 0;
int targetXpos;
int targetYpos;
int score = 0;
int speedx;

void setup()
{
  size(600, 600);
  background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw()
{
  background(255);
  fill(255);

  targetHit();
  drawShip();
  drawTarget();
  moveShot();
}

void drawTarget()
{
  if (targetDraw == 0)
  {
    targetXpos = int(random(50, width-50));
    targetYpos = 50;
    speedx = int(random(1,4));
    targetDraw = 1;
  }
  if (targetExist == 0)
  {
    fill(0,0,255);
    ellipse(targetXpos, targetYpos, 50, 50);
    targetXpos = targetXpos + speedx;
      if(targetXpos+25 > width || targetXpos-25 < 0)
      {
       speedx = speedx * -1; 
      }
      
  }
}
void drawShip()
{
   fill(0,255,0);
  rect(mouseX, constrain(mouseY, 550, 551), 30, 30);
  fill(255,255,0);
  ellipse(mouseX, constrain(mouseY-15, 535, 536), 15, 15);
}

void keyPressed()
{
  shotx = mouseX;
  shoty = 530;
  ellipse(shotx, shoty, 15, 15);
  shotExist = 1;
}

void moveShot()
{
  if (shotExist == 1)
  {
    shoty = shoty - speed;
    fill(255,0,0);
    ellipse(shotx, shoty,15, 15);
  }
  if (shoty == 0)
  {
    shotExist = 0;
  }
}

void targetHit()
{
  if (shotx > targetXpos-25 && shotx < targetXpos+25 && shoty == targetYpos)
  {
    targetDraw = 0;
    shotExist = 0;
    score = score + 1;
  //  println("WEEE! Your Score is:"score);
  }
}



