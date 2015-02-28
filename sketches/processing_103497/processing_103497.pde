
// animating pacman's mouth variable
boolean IOM = false; //if opening mouth
float MW = PI/4; // mouth width

// pacman variables
float curX = 0;
float curY = 0;
float easing = 0.03;
float pacmanRadius = 20;
float direction = 0;

// dot variables
Dot[] dotGenerate;

Dot dot1;

int score = 0;
int bodyColorRed = 0;
int bodyColorGreen = 0;
int bodyColorBlue = 0;

void setup()
{
  curX = width/2;
  curY = height/2;

  ellipseMode (RADIUS);

  size (500, 500);
  background (0);
  textSize(20);
  fill(255);
  text("Use WASD keys or mouse to move Pacman. \nTry to eat the little dots for points. \nPress SPace to erase this." ,50, 100);

  dot1 = new Dot ();

  dotGenerate = new Dot[5];

  for (int i = 0; i < dotGenerate.length; i = i + 1)
  {
    dotGenerate[i] = new Dot();
  }
}

void draw()
{
  //background(0);
  fill(0);
  ellipse(curX, curY, pacmanRadius, pacmanRadius);
  fill (bodyColorRed, bodyColorGreen, bodyColorBlue);
  strokeWeight(1);
  arc (curX, curY, pacmanRadius, pacmanRadius, MW/2 + direction, 2*PI - MW/2 + direction);
  
  if (IOM)
  {
    MW = MW + .1;
    if (MW > PI*2)
    {
      IOM = false;
    }

  }
  else
  {
    MW = MW - .1;
    if (MW < 0)
    {
      IOM = true;
    }
  }
  if (MW <= PI*2 && MW > PI*5/3)
  {
    bodyColorRed = 255;
    bodyColorGreen = 0;
    bodyColorBlue = 0;
  }
  if (MW <= PI*5/3 && MW > PI*4/3)
  {
    bodyColorRed = 250;
    bodyColorGreen = 150;
    bodyColorBlue = 0;
  }
  if (MW <= PI*4/3 && MW > PI*3/3)
  {
    bodyColorRed = 250;
    bodyColorGreen = 255;
    bodyColorBlue = 10;
  }
  if (MW <= PI*3/3 && MW > PI*2/3)
  {
    bodyColorRed = 0;
    bodyColorGreen = 255;
    bodyColorBlue = 0;
  }
  if (MW <= PI*2/3 && MW > PI*.75/3)
  {
    bodyColorRed = 0;
    bodyColorGreen = 0;
    bodyColorBlue = 255;
  }
  if (MW <= PI*(.75/3) && MW > 0)
  {
    bodyColorRed = 255;
    bodyColorGreen = 0;
    bodyColorBlue = 255;
  }
  

  for (int i = 0; i < dotGenerate.length; i = i + 1)
  {
    dotGenerate[i].checkCollision();
    dotGenerate[i].draw();
  }
  // dot1.draw();

  if (keyPressed) { //wasd mode controls
    if (key == 'd')
    {
      curX = curX + 4;
      direction = 0;
    }
    if (key == 'w')
    {
      curY = curY - 4;
      direction = PI * 3/2;
    }
    if (key == 'a')
    {
      curX = curX - 4;
      direction = PI;
    }
    if (key == 's')
    {
      curY = curY + 4;
      direction = PI/2;
    }
    if (key == ' ') {
      background(0);
      score = 0;
    }
  }
  if(mousePressed == true) {  //mouse mode controls
    float targetX = mouseX;
    float dx = targetX - curX;
    if(abs(dx) > 1) {
      curX += dx * easing;
    }
    float targetY = mouseY;
    float dy = targetY - curY;
    if(abs(dy) > 1) {
      curY += dy * easing;
    }
    direction = atan((mouseY-curY)/abs((mouseX-curX)));
  }
  
  // Draw score
  fill(100);
  rect(width - 175, 20, 140, 60, 7);
  textAlign(RIGHT);
  textSize(50);
  fill(255);
  text(score, width - 50, 70);
}

class Dot 
{
  float x, y, size;

  Dot ()
  {
    this.x = random (25, width - 25);
    this.y = random (25, height - 25);
    this.size = 12;
  }

  Dot ( float x, float y)
  {
    this.x = x;
    this.y = y;
    this.size = 25;
  }

int dotColorRandomizerRed = int(random(0,2));
int dotColorRandomizerGreen = int(random(0,2));
int dotColorRandomizerBlue = int(random(0,2));

  void draw ()
  {
    //noStroke();
    fill (dotColorRandomizerRed*255 , dotColorRandomizerGreen*255 , dotColorRandomizerBlue*255);
    
    ellipse (this.x, this.y, size, size);
  }

  boolean checkCollision ()
  {
    if (  sqrt(  (this.x - curX) * (this.x - curX) + (this.y - curY) * (this.y - curY)  ) < pacmanRadius)
    {
      this.x = random (25, width - 25);
      this.y = random (25, height - 25);
      score += 5;
      println(score);
      return true;
    }
    return false;
  }
}
// animating pacman's mouth variable
boolean IOM = false; //if opening mouth
float MW = PI/4; // mouth width

// pacman variables
float curX = 0;
float curY = 0;
float easing = 0.05;
float pacmanRadius = 20;
float direction = 0;

// dot variables
Dot[] dotGenerate;

Dot dot1;

int score = 0;
int bodyColorRed = 0;
int bodyColorGreen = 0;
int bodyColorBlue = 0;

void setup()
{
  curX = width/2;
  curY = height/2;

  ellipseMode (RADIUS);

  size (500, 500);
  background (0);
  textSize(20);
  fill(255);
  text("Use WASD keys or mouse to move Pacman. \nTry to eat the little dots for points. ,50, 100);

  dot1 = new Dot ();

  dotGenerate = new Dot[5];

  for (int i = 0; i < dotGenerate.length; i = i + 1)
  {
    dotGenerate[i] = new Dot();
  }
}

void draw()
{
  //background(0);
  fill(0);
  ellipse(curX, curY, pacmanRadius, pacmanRadius);
  fill (bodyColorRed, bodyColorGreen, bodyColorBlue);
  strokeWeight(1);
  arc (curX, curY, pacmanRadius, pacmanRadius, MW/2 + direction, 2*PI - MW/2 + direction);
  
  if (IOM)
  {
    MW = MW + .1;
    if (MW > PI*2)
    {
      IOM = false;
    }

  }
  else
  {
    MW = MW - .1;
    if (MW < 0)
    {
      IOM = true;
    }
  }
  if (MW <= PI*2 && MW > PI*5/3)
  {
    bodyColorRed = 255;
    bodyColorGreen = 0;
    bodyColorBlue = 0;
  }
  if (MW <= PI*5/3 && MW > PI*4/3)
  {
    bodyColorRed = 250;
    bodyColorGreen = 150;
    bodyColorBlue = 0;
  }
  if (MW <= PI*4/3 && MW > PI*3/3)
  {
    bodyColorRed = 250;
    bodyColorGreen = 255;
    bodyColorBlue = 10;
  }
  if (MW <= PI*3/3 && MW > PI*2/3)
  {
    bodyColorRed = 0;
    bodyColorGreen = 255;
    bodyColorBlue = 0;
  }
  if (MW <= PI*2/3 && MW > PI*.75/3)
  {
    bodyColorRed = 0;
    bodyColorGreen = 0;
    bodyColorBlue = 255;
  }
  if (MW <= PI*(.75/3) && MW > 0)
  {
    bodyColorRed = 255;
    bodyColorGreen = 0;
    bodyColorBlue = 255;
  }
  

  for (int i = 0; i < dotGenerate.length; i = i + 1)
  {
    dotGenerate[i].checkCollision();
    dotGenerate[i].draw();
  }
  // dot1.draw();

  if (keyPressed) { //wasd mode controls
    if (key == 'd')
    {
      curX = curX + 4;
      direction = 0;
    }
    if (key == 'w')
    {
      curY = curY - 4;
      direction = PI * 3/2;
    }
    if (key == 'a')
    {
      curX = curX - 4;
      direction = PI;
    }
    if (key == 's')
    {
      curY = curY + 4;
      direction = PI/2;
    }
    if (key == ' ') {
      background(0);
      score = 0;
    }
  }
  if(mousePressed == true) {  //mouse mode controls
    float targetX = mouseX;
    float dx = targetX - curX;
    if(abs(dx) > 1) {
      curX += dx * easing;
    }
    float targetY = mouseY;
    float dy = targetY - curY;
    if(abs(dy) > 1) {
      curY += dy * easing;
    }
    direction = atan((mouseY-curY)/abs((mouseX-curX)));
  }
  
  // Draw score
  fill(100);
  rect(width - 175, 20, 140, 60, 7);
  textAlign(RIGHT);
  textSize(50);
  fill(255);
  text(score, width - 50, 70);
}

class Dot 
{
  float x, y, size;

  Dot ()
  {
    this.x = random (25, width - 25);
    this.y = random (25, height - 25);
    this.size = 12;
  }

  Dot ( float x, float y)
  {
    this.x = x;
    this.y = y;
    this.size = 25;
  }

int dotColorRandomizerRed = int(random(0,2));
int dotColorRandomizerGreen = int(random(0,2));
int dotColorRandomizerBlue = int(random(0,2));

  void draw ()
  {
    //noStroke();
    fill (dotColorRandomizerRed*255 , dotColorRandomizerGreen*255 , dotColorRandomizerBlue*255);
    
    ellipse (this.x, this.y, size, size);
  }

  boolean checkCollision ()
  {
    if (  sqrt(  (this.x - curX) * (this.x - curX) + (this.y - curY) * (this.y - curY)  ) < pacmanRadius)
    {
      this.x = random (25, width - 25);
      this.y = random (25, height - 25);
      score += 5;
      println(score);
      return true;
    }
    return false;
  }
  /* class badGuys { //unfinished. please ignore.
  this.x = x;
  this.y = y;
  noStroke();
  fill(255)
  rect(-10, randomLeftSpawn, 5, 30);
  rect(randomTopSpawn, -10, 30 , 5);
  rect(width + 10, randomRightSpawn, 5, 30);
  rect(RandomLeftSpawn, height + 10, 30, 5);
  
} **/
}
