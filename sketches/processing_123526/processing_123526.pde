
ArrayList bricks;
Ball ball;
Paddle paddle;
int level = 0;
int mouse = 0;
int setup = 0;
float paddleX = 300;
int lives = 3;
boolean arrowsControl = false;
boolean mouseControl = true;

void setup() {
  size (600, 600); 
  bricks = new ArrayList();
  ball = new Ball();
  paddle = new Paddle();

  switch(setup) {
  case 0:
    for (int i = 0; i < 13; i++)
    {
      Brick b = new Brick();
      b.setLocation((42*i) + 30, 100);
      b.setDeathCount(2);
      bricks.add(b);
    }
    for (int i = 0; i < 13; i++)
    {
      Brick b = new Brick();
      b.setLocation((42*i) + 30, 120);
      b.setDeathCount(2);
      bricks.add(b);
    }
    for (int i = 0; i < 13; i++)
    {
      Brick b = new Brick();
      b.setLocation((42*i) + 30, 140);
      b.setDeathCount(2);
      bricks.add(b);
    }
    for (int i = 0; i < 13; i++)
    {
      Brick b = new Brick();
      b.setLocation((42*i) + 30, 160);
      b.setDeathCount(2);
      bricks.add(b);
    }
    for (int i = 0; i < 13; i++)
    {
      Brick b = new Brick();
      b.setLocation((42*i) + 30, 180);
      b.setDeathCount(2);
      bricks.add(b);
    }
    for (int i = 0; i < 13; i++)
    {
      Brick b = new Brick();
      b.setLocation((42*i) + 30, 200);
      b.setDeathCount(2);
      bricks.add(b);
    }
    break;
    case 2:
    
    break;
  }
}



void draw() {
  switch(level) {
  case 0:
    startScreen();
    break;
  case 1:
    options();
    break;
  case 2:
    level1();
    allLevels();
    break;
  case 999:
    // handle end of game display
    break;
  }

  switch(mouse) {
    //use mouse
  case 1:
    //it changes colors to test if it's working
    mouseControl = true;
    arrowsControl = false;
    break;
    //use arrows
  case 2:
    mouseControl = false;
    arrowsControl = true;
    break;
  }
}

void startScreen() {
  background(0);
  PFont font;
  //sets the color for the start button
  fill(#034F00);
  if ((mouseY>370) && (mouseY<410) && (mouseX>395) && (mouseX<465)) {
    fill(#FFBC00);
    if (mousePressed) {
      level = 2;
    }
  }
  rect(395, 370, 70, 40);

  //sets the color for the options button
  fill(#034F00);
  if ((mouseY>370) && (mouseY<410) && (mouseX>95) && (mouseX<205)) {
    fill(#FFBC00);
    if (mousePressed) {
      level = 1;
    }
  }
  rect(95, 370, 110, 40);

  //displays the text
  font = loadFont("Helvetica-48.vlw");
  textFont(font, 48);
  fill(#FF0505);
  text("BRICK BREAKER", 120, 200);
  textSize(30);
  fill(#08FF05);
  text("start", 400, 400);
  text("options", 100, 400);
}

void options() {
  background(0);
  PFont font;
  font = loadFont("Helvetica-48.vlw");
  textFont(font, 45);
  fill(#008EFF);
  text("OPTIONS", 200, 150);

  //mouse
  fill(#1FCB40);
  if ((mouseY>330) && (mouseY<370) && (mouseX>395) && (mouseX<490)) {
    fill(#FFBC00);
    if (mousePressed) {
      mouse = 1;
    }
  }
  rect(395, 330, 95, 40);

  //arrowsControl
  fill(#1FCB40);
  if ((mouseY>330) && (mouseY<370) && (mouseX>95) && (mouseX<205)) {
    fill(#FFBC00);
    if (mousePressed) {
      mouse = 2;
    }
  }
  rect(95, 330, 100, 40);
  //mouseControl
  fill(#AF0000);
  if ((mouseY>70) && (mouseY<100) && (mouseX>50) && (mouseX<120)) {
    fill(#FFBC00);
    if (mousePressed) {
      level = 0;
    }
  }
  rect(50, 70, 70, 30);

  //text stuff
  textSize(30);
  fill(#D400FF);
  text("Mouse", 400, 360);
  text("Arrows", 100, 360);
  textSize(26);
  text("back", 55, 95);
}

void level1() {
}


void allLevels() {
  background(0);
  for (int i = 0; i < bricks.size(); i++)
  {
    Brick b = (Brick) bricks.get(i);
    b.display();
    if (b.intersect(ball))
    {
      ball.yspeed *= -1;
      b.deathcount -= 1;
      if (b.getDeathCount() == 0)
      {
        bricks.remove(b);
      }
      else
      {
        b.setColor();
      }
    }
  }
  if (keyPressed == true) {
    if (key == '/') {
      frameRate(10);
    }
    else {
      frameRate(30);
    }
  }
  paddle.display();
  //    noCursor();
  if (mouseControl == true) {
    paddle.setLocation(paddleX, height-40);
    paddleX = mouseX- 40;
    if (paddleX < 0) paddleX = 0 ;
    if (paddleX > width-80) paddleX = width-80;
  }
  if (arrowsControl == true) {
    paddle.setLocation(paddleX, height-40);
    if (keyPressed == true) {   
      if (key=='a'|| keyCode==LEFT) paddleX-=10;
    }
    if (keyPressed == true) {
      if (key=='d'|| keyCode==RIGHT) paddleX+=10;
    }
    if (paddleX < 0) paddleX = 0 ;
    if (paddleX > width-80) paddleX = width-80;
  }
  ball.move();
  ball.display();
  if (paddle.intersect(ball))
  {
    ball.yspeed *= -1;
  }
}

class Ball
{
  float x, y, xspeed, yspeed;
  Ball()
  {
    x = 400;
    y = height-100;
    xspeed = -4;
    yspeed = -4;
  }

  void move()
  {
    x += xspeed;
    y += yspeed;
    if ((x > width) || (x < 0))
    {
      xspeed *= -1;
    }

    if (y < 0)
    {
      yspeed *= -1;
    }
    if (y > height) {
      lives = lives -1;
    }
  }

  void display()
  {
    stroke(0);
    fill(255);
    ellipse(x, y, 10, 10);
  }
}

class Brick
{
  float x, y;
  color c;
  int deathcount;
  Brick()
  {
    deathcount = 3;
  }

  void setLocation(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void display()
  {
    stroke(0);
    setColor();
    fill(c);
    rect(x, y, 40, 15);
  }

  void setColor()
  {
    switch(deathcount)
    {
    case 1:
      c = color(255, 0, 0);
      break;
    case 2:
      c = color(0, 255, 0);
      break;
    case 3:
      c = color(0, 0, 255);
      break;
    }
  }

  int getDeathCount()
  {
    return deathcount;
  }

  void setDeathCount(int dcount)
  {
    deathcount = dcount;
  }

  boolean intersect(Ball b)
  {
    float p1 = x;
    float p2 = x + 40;
    if (((b.y - 5) >= y) && ((b.y - 5) <= y + 15))
    {
      if ((b.x >= p1) && (b.x <= p2 ))
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
      return false;
  }
}
class Paddle
{
  float x, y;
  Paddle()
  {
    x = 80;
    y = 20;
  }

  void setLocation(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void display()
  {
    stroke(0);
    fill(0, 0, 255);
    rect(x, y, 80, 20);
  }

  boolean intersect(Ball b)
  {
    float p1 = x;
    float p2 = x + 80;
    if ((b.y +10) >= y) 
    {
      if ((b.x >= p1) && (b.x <= p2))
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      return false;
    }
  }
}


