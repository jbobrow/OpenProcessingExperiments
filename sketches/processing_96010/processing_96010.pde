
int x = 345;
int y = 250;
int direction = LEFT;
int compX= 365;
int compY= 250;
int compDir= RIGHT;
int dcompDir = DOWN;
int dcompX =355;
int dcompY =260;
int pcompX =355;
int pcompY =243;
int pcompDir = UP;
boolean GAMEOVER = false;
boolean DEAD1 = false;
boolean DEAD2 = false;
boolean DEAD3 = false;
boolean DEAD4 = false;
void setup()
{
  size(700, 500);
  background(0);
  noFill();
  stroke(255);
  strokeWeight(10);
  rect(0, 0, 700, 500);
}
void draw()
{
  frameRate(100);
if (GAMEOVER == false)
{
    elhuman();
    elcomputer1();
    elcomputer2();
    elcomputer3();
    humanover();
    comp1over();
    comp2over();
    comp3over();
   elmaster();
}
}

void elmaster()
{
 if (DEAD1 ||(DEAD2 && DEAD3&& DEAD4))
 {
    GAMEOVER = true;
     if ( DEAD1 == false)
 {
   fill(255,150,0);
    textAlign(CENTER);
    textSize(30);
    text("YOU WIN",350, 450);
 }
 
 if (GAMEOVER)
 {   fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAMEOVER",350, 350);
    textSize(20);
    text("Press 1 to restart",350, 400);
 }
 }

 
}

void keyPressed()
{
  if (key == 'w')
  {
    direction = UP;
  }
  else if (key == 's')
  {
    direction = DOWN;
  }
  else if (key == 'd')
  {
    direction = RIGHT;
  }
  else if (key == 'a')
  {
    direction = LEFT;
  }
  else if (key == '1')
  {
    GAMEOVER = false;
    background(0);
    noFill();
    stroke(255);
    strokeWeight(10);
    rect(0, 0, 700, 500);
    x = 345;
    y = 250;
    direction = LEFT;
    compX= 365;
    compY= 250;
    compDir= RIGHT;
    dcompDir = DOWN;
    dcompX =355;
    dcompY =260;
    pcompX =355;
    pcompY =243;
    pcompDir = UP;
    DEAD1 = false;
    DEAD2 = false;
    DEAD3 = false;
    DEAD4 = false;
  }
}

void humanover()
{
  if ( (get(x, y) != color(0, 0, 0)))
  {
    DEAD1 = true;
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text("human is dead", 150, 50);
  }
}

void comp1over()
{
  if ( (get(compX, compY) != color(0, 0, 0)))
  {
    DEAD2 = true;
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text("Comp1 is dead", 350, 50);
  }
}

void comp2over()
{
  if ( (get(dcompX, dcompY) != color(0, 0, 0)))
  {
    DEAD3 = true;
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text("Comp2 is dead", 150, 150);
  }
}

void comp3over()
{
  if (get(pcompX, pcompY) != color(0, 0, 0))
  {
    DEAD4 = true;
    fill(255);
    textSize(15);
    textAlign(CENTER);
    text("Comp3 is dead", 250, 50);
  }
}

void elhuman()
{
  strokeWeight(1);
  stroke(255, 150, 0);
  point(x, y);
  if ( direction ==RIGHT)
  {
    x++;
  }
  if (direction == LEFT)
  {
    x--;
  }
  if (direction == UP)
  {
    y--;
  }
  if (direction == DOWN)
  {
    y++;
  }
}

void elcomputer1()
{
  stroke(255, 0, 0);
  point(compX, compY);
  if ( compDir == LEFT)
  {
    compX--;
    if (get(compX-1, compY) !=color(0, 0, 0))
    {
      compDir = UP;
    }
  }
  else if (compDir == RIGHT)
  {
    compX++;
    if (get(compX+1, compY) !=color(0, 0, 0))
    {
      compDir = DOWN;
    }
  }
  else if (compDir == DOWN)
  {
    compY++;
    if (get(compX, compY+1) !=color(0, 0, 0))
    {
      compDir = LEFT;
    }
  }
  else if (compDir == UP)
  {
    compY--;
    if (get(compX, compY-1) !=color(0, 0, 0))
    {
      compDir = RIGHT;
    }
  }
}

void elcomputer2()
{
  strokeWeight(1);
  stroke(0, 255, 255);
  point(dcompX, dcompY);
  if ( dcompDir == LEFT)
  {
    dcompX--;
    if (get(dcompX-(int(random(0,100))), dcompY) !=color(0, 0, 0) || get(dcompX-1, dcompY) !=color(0, 0, 0))
    {
      dcompDir = UP;
    }
  }
  else if (dcompDir == RIGHT)
  {
    dcompX++;
    if (get(dcompX+(int(random(0,100))), dcompY) !=color(0, 0, 0) || get(dcompX+1, dcompY) !=color(0, 0, 0))
    {
      dcompDir = DOWN;
    }
  }
  else if (dcompDir == DOWN)
  {
    dcompY++;
    if (get(dcompX, dcompY+(int(random(0,100)))) !=color(0, 0, 0) || get(dcompX, dcompY+1) !=color(0, 0, 0))
    {
      dcompDir = LEFT;
    }
  }
  else if (dcompDir == UP)
  {
    dcompY--;
    if (get(dcompX, dcompY-(int(random(0,100)))) !=color(0, 0, 0) || get(dcompX, dcompY-1) !=color(0, 0, 0))
    {
      dcompDir = RIGHT;
    }
  }
}

void elcomputer3()
{
  strokeWeight(1);
  stroke(0, 255, 0);
  point(pcompX, pcompY);
  if ( pcompDir == LEFT)
  {
    pcompX--;
    if (get(pcompX-(int(random(0,5))), pcompY) !=color(0, 0, 0)|| get(pcompX-1, pcompY) !=color(0, 0, 0))
    {
      pcompDir = UP;
    }
  }
  else if (pcompDir == RIGHT)
  {
    pcompX++;
    if (get(pcompX+(int(random(0,5))), pcompY) !=color(0, 0, 0)|| get(pcompX+1, pcompY) !=color(0, 0, 0))
    {
      pcompDir = DOWN;
    }
  }
  else if (pcompDir == DOWN)
  {
    pcompY++;
    if (get(pcompX, pcompY+(int(random(0,5)))) !=color(0, 0, 0)|| get(pcompX, pcompY+1) !=color(0, 0, 0))
    {
      pcompDir = LEFT;
    }
  }
  else if (pcompDir == UP)
  {
    pcompY--;
    if (get(pcompX, pcompY-(int(random(0,5)))) !=color(0, 0, 0)|| get(pcompX, pcompY-1) !=color(0, 0, 0))
    {
      pcompDir = RIGHT;
    }
  }
}
