
//Eric K, CP1 mods 4-5, Pong
//url: http://ericsprogrammingsite.webs.com/Pong.html

/* @pjs globalKeyEvents="true"; */

Ball ball;
Paddle [] paddles = new Paddle[2];
Side [] sides = new Side[2];
Button [] buttons = new Button[6];
Slider points = new Slider(450, 135, 6);
Slider difficulty = new Slider(450, 265, 5);
String [] buttonNames = {
  "Single Player", "Double Player", "Single Player\nwith Computer", "Instructions\nand Options", "Play Again", "Return to Menu"
};
int [][] buttonInfo = {
  {
    150, 200
  }
  ,
  {
    150, 300
  }
  ,
  {
    450, 200
  }
  ,
  {
    450, 300
  }
  ,
  {
    300, 250
  }
  ,
  {
    300, 350
  }
};

boolean inProgress = false;
boolean gameOver = false;
boolean server = true;
boolean hitLast = false;
boolean won = false;
boolean wIsPressed = false, sIsPressed = false, iIsPressed = false, kIsPressed = false, spaceIsPressed = false;
int mode = -1;
int waiting = 0; //for computer
int hardness = 3;
int maxScore = 11;

void setup()
{
  size(600, 400);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  for (int i = 0; i < buttons.length; i++)
  {
    buttons[i] = new Button(buttonInfo[i][0], buttonInfo[i][1], buttonNames[i]);
  }
  ball = new Ball();
  points.value = 6;
  difficulty.value = 5;
}

void draw()
{
  background(0);
  if (mode == -1)
  {
    titleScreen();
  }
  else if (mode == 0)
  {
    singlePlayer();
  }
  else if (mode == 1)
  {
    doublePlayer();
  }
  else if (mode == 2)
  {
    withComputer();
  }
  else if (mode == 3)
  {
    options();
  }
  maxScore = points.value + 5;
}

void titleScreen()
{
  fill(255);
  textSize(100);
  text("PONG", 300, 75);
  textSize(12);
  text("by Eric K, 2012", 300, 150);
  for (int i = 0; i < buttons.length - 2; i++)
  {
    buttons[i].show();
    if (mousePressed)
    {
      if (buttons[i].selected == true)
      {
        mode = i;
        if (mode == 0)
        {
          paddles[0] = new Paddle(50, 200);
          sides[0] = new Side(0, true);
          ball = new Ball();
          inProgress = false;
        }
        if (mode == 1)
        {
          paddles[0] = new Paddle(50, height/2);
          paddles[1] = new Paddle(550, height/2);
          sides[0] = new Side(0, true);
          sides[1] = new Side(width - 1, true);
          server = random(1) < 0.5;
          ball = new Ball();
          inProgress = false;
        }
        if (mode == 2)
        {
          paddles[0] = new Paddle(50, height/2);
          paddles[1] = new Paddle(550, height/2);
          sides[0] = new Side(0, true);
          sides[1] = new Side(width - 1, true);
          server = random(1) < 0.5;
          ball = new Ball();
          inProgress = false;
          if (difficulty.value == 0)
          {
            paddles[1].yVel = 10;
          }
        }
      }
    }
  }
}

void singlePlayer()
{
  drawBackground();
  if (gameOver == false)
  {
    frameRate(ball.vel);
    paddles[0].show();
    sides[0].show();
    if (wIsPressed == true && paddles[0].yVel > -5 && paddles[0].y > 40)
    {
      paddles[0].yVel--;
    }
    else if (sIsPressed == true && paddles[0].yVel < 5 && paddles[0].y < 360)
    {
      paddles[0].yVel++;
    }
    else
    {
      if (paddles[0].y < 40 || paddles[0].y > 360)
      {
        paddles[0].yVel = 0;
      }
      else if (paddles[0].yVel > 0)
      {
        paddles[0].yVel -= 0.2;
      }
      else if (paddles[0].yVel < 0)
      {
        paddles[0].yVel += 0.2;
      }
    }
    paddles[0].move();
    if (spaceIsPressed == true && inProgress == false)
    {
      inProgress = true;
    }
    if (inProgress == true)
    {
      ball.move();
      ball.bounce();
    }
    else
    {
      ball.x = paddles[0].x + 20;
      ball.y = paddles[0].y - 2;
      ball.dir = 0;
      textSize(16);
      text("Press the spacebar\nto release the ball.", width/2, height/2);
    }
    ball.show();
    if (paddles[0].contact() == true && paddles[0].alreadyInContact == false)
    {
      paddles[0].score++;
    }
    if (sides[0].contact() == true)
    {
      gameOver = true;
      inProgress = false;
    }
    textSize(20);
    text("Score: " + paddles[0].score, 300, 15);
  }
  else
  {
    fill(255);
    textSize(50);
    text("GAME OVER", 300, 100);
    textSize(20);
    text("Your score is " + paddles[0].score, 300, 150);
    buttons[buttons.length - 2].show();
    buttons[buttons.length - 1].show();
    if (mousePressed)
    {
      if (buttons[buttons.length - 2].selected == true)
      {
        gameOver = false;
        paddles[0] = new Paddle(50, 200);
      }
      else if (buttons[buttons.length - 1].selected == true)
      {
        mode = -1;
        gameOver = false;
      }
    }
  }
}

void doublePlayer()
{
  drawBackground();
  if (gameOver == false)
  {
    frameRate(ball.vel);
    paddles[0].show();
    paddles[1].show();
    sides[0].show();
    sides[1].show();
    if (wIsPressed == true && paddles[0].yVel > -5 && paddles[0].y > 40)
    {
      paddles[0].yVel--;
    }
    else if (sIsPressed == true && paddles[0].yVel < 5 && paddles[0].y < 360)
    {
      paddles[0].yVel++;
    }
    else
    {
      if (paddles[0].y < 40 || paddles[0].y > 360)
      {
        paddles[0].yVel = 0;
      }
      else if (paddles[0].yVel > 0)
      {
        paddles[0].yVel -= 0.2;
      }
      else if (paddles[0].yVel < 0)
      {
        paddles[0].yVel += 0.2;
      }
    }
    paddles[0].move();
    if (iIsPressed == true && paddles[1].yVel > -5 && paddles[1].y > 40)
    {
      paddles[1].yVel--;
    }
    else if (kIsPressed == true && paddles[1].yVel < 5 && paddles[1].y < 360)
    {
      paddles[1].yVel++;
    }
    else
    {
      if (paddles[1].y < 40 || paddles[1].y > 360)
      {
        paddles[1].yVel = 0;
      }
      else if (paddles[1].yVel > 0)
      {
        paddles[1].yVel -= 0.2;
      }
      else if (paddles[1].yVel < 0)
      {
        paddles[1].yVel += 0.2;
      }
    }
    paddles[1].move();
    if (spaceIsPressed == true)
    {
      inProgress = true;
    }
    if (inProgress == true)
    {
      ball.move();
      ball.bounce();
    }
    else
    {
      if (server == true)
      {
        ball.x = paddles[0].x + 20;
        ball.y = paddles[0].y - 2;
        ball.dir = 0;
      }
      else
      {
        ball.x = paddles[1].x - 20;
        ball.y = paddles[1].y - 2;
        ball.dir = 180;
      }
      ball.vel = 60;
      fill(255);
      textSize(16);
      text("Press the spacebar\nto release the ball.", width/2, height/2);
    }
    ball.show();
    if (sides[0].contact() == true)
    {
      inProgress = false;
      server = true;
      paddles[1].score++;
    }
    else if (sides[1].contact() == true)
    {
      inProgress = false;
      server = false;
      paddles[0].score++;
    }
    if (paddles[0].score > maxScore - 1 || paddles[1].score > maxScore - 1)
    {
      if (paddles[0].score - paddles[1].score > 1)
      {
        won = true;
        inProgress = false;
        gameOver = true;
      }
      else if (paddles[0].score - paddles[1].score < -1)
      {
        won = false;
        inProgress = false;
        gameOver = true;
      }
    }
    textSize(50);
    text(paddles[0].score, 250, 30);
    text(paddles[1].score, 350, 30);
    stroke(255);
    line(width/2, 0, width/2, height);
    noFill();
    ellipse(width/2, height/2, 200, 200);
  }
  else
  {
    fill(255);
    textSize(50);
    if (won == true)
    {
      text("PLAYER 1 WINS", 300, 100);
    }
    else
    {
      text("PLAYER 2 WINS", 300, 100);
    }
    textSize(20);
    text(paddles[0].score + " - " + paddles[1].score, 300, 150);
    buttons[buttons.length - 2].show();
    buttons[buttons.length - 1].show();
    if (mousePressed)
    {
      if (buttons[buttons.length - 2].selected == true)
      {
        gameOver = false;
        paddles[0] = new Paddle(50, 200);
        paddles[1] = new Paddle(550, 200);
      }
      else if (buttons[buttons.length - 1].selected == true)
      {
        mode = -1;
        gameOver = false;
      }
    }
  }
}

void withComputer()
{
  drawBackground();
  if (gameOver == false)
  {
    frameRate(ball.vel);
    paddles[0].show();
    paddles[1].show();
    sides[0].show();
    sides[1].show();
    if (wIsPressed == true && paddles[0].yVel > -5 && paddles[0].y > 40)
    {
      paddles[0].yVel--;
    }
    else if (sIsPressed == true && paddles[0].yVel < 5 && paddles[0].y < 360)
    {
      paddles[0].yVel++;
    }
    else
    {
      if (paddles[0].y < 40 || paddles[0].y > 360)
      {
        paddles[0].yVel = 0;
      }
      else if (paddles[0].yVel > 0)
      {
        paddles[0].yVel -= 0.2;
      }
      else if (paddles[0].yVel < 0)
      {
        paddles[0].yVel += 0.2;
      }
    }
    paddles[0].move();
    if (spaceIsPressed == true && server == true)
    {
      inProgress = true;
    }
    computer();
    if (inProgress == true)
    {
      ball.move();
      ball.bounce();
    }
    else
    {
      if (server == true)
      {
        ball.x = paddles[0].x + 20;
        ball.y = paddles[0].y - 2;
        ball.dir = 0;
        fill(255);
        textSize(16);
        text("Press the spacebar\nto release the ball.", width/2, height/2);
      }
      else
      {
        ball.x = paddles[1].x - 20;
        ball.y = paddles[1].y - 2;
        ball.dir = 180;
      }
      ball.vel = 60;
      hitLast = true;
    }
    ball.show();
    if (sides[0].contact() == true)
    {
      inProgress = false;
      server = true;
      paddles[1].score++;
    }
    else if (sides[1].contact() == true)
    {
      inProgress = false;
      server = false;
      paddles[0].score++;
    }
    if (paddles[0].score > maxScore - 1 || paddles[1].score > maxScore - 1)
    {
      if (paddles[0].score - paddles[1].score > 1)
      {
        won = true;
        inProgress = false;
        gameOver = true;
      }
      else if (paddles[0].score - paddles[1].score < -1)
      {
        won = false;
        inProgress = false;
        gameOver = true;
      }
    }
    textSize(50);
    text(paddles[0].score, 250, 30);
    text(paddles[1].score, 350, 30);
    stroke(255);
    line(width/2, 0, width/2, height);
    noFill();
    ellipse(width/2, height/2, 200, 200);
  }
  else
  {
    fill(255);
    textSize(50);
    if (won == true)
    {
      text("YOU WIN", 300, 100);
    }
    else
    {
      text("COMPUTER WINS", 300, 100);
    }
    textSize(20);
    text(paddles[0].score + " - " + paddles[1].score, 300, 150);
    buttons[buttons.length - 2].show();
    buttons[buttons.length - 1].show();
    if (mousePressed)
    {
      if (buttons[buttons.length - 2].selected == true)
      {
        gameOver = false;
        paddles[0] = new Paddle(50, 200);
        paddles[1] = new Paddle(550, 200);
      }
      else if (buttons[buttons.length - 1].selected == true)
      {
        mode = -1;
        gameOver = false;
      }
    }
  }
}

void computer()
{
  if (difficulty.value == 0)
  {
    if (paddles[1].y > 360)
    {
      paddles[1].yVel = -10;
    }
    else if (paddles[1].y < 40)
    {
      paddles[1].yVel = 10;
    }
  }
  else if (difficulty.value == 10)
  {
    paddles[1].y = int(ball.y);
    if (paddles[1].y < 40)
    {
      paddles[1].y = 40;
    }
    if (paddles[1].y > 360)
    {
      paddles[1].y = 360;
    }
  }
  else
  {
    if (hitLast == true)
    {
      if (paddles[1].y > ball.y + 20 && paddles[1].yVel > -2.6 - difficulty.value * 0.2)
      {
        paddles[1].yVel--;
      }
      else if (paddles[1].y < ball.y - 20 && paddles[1].yVel < 2.6 + difficulty.value * 0.2)
      {
        paddles[1].yVel++;
      }
      else
      {
        if (paddles[1].y < 40 || paddles[1].y > 360)
        {
          paddles[1].yVel = 0;
        }
        else if (paddles[1].yVel > 0)
        {
          paddles[1].yVel -= 0.2;
        }
        else if (paddles[1].yVel < 0)
        {
          paddles[1].yVel += 0.2;
        }
      }
    }
    else
    {
      if (paddles[1].y > height/2 + 30 && paddles[1].yVel > -1.5 - difficulty.value * 0.1)
      {
        paddles[1].yVel--;
      }
      else if (paddles[1].y < height/2 - 30 && paddles[1].yVel < 1.5 + difficulty.value * 0.1)
      {
        paddles[1].yVel++;
      }
      else if (paddles[1].yVel > 0)
      {
        paddles[1].yVel -= 0.2;
      }
      else if (paddles[1].yVel < 0)
      {
        paddles[1].yVel += 0.2;
      }
    }
  }
  if (server == false && inProgress == false)
  {
    waiting++;
    if (waiting > 90)
    {
      inProgress = true;
      waiting = 0;
    }
  }
  paddles[1].move();
}

void options()
{
  fill(255);
  textSize(30);
  text("INSTRUCTIONS AND OPTIONS", 300, 15);
  textSize(12);
  text("Instructions:\nThe object of Pong is to keep the ball in play\nby bouncing it with the paddle. If there are\ntwo players, you gain a point if the other\nplayer fails to return the ball. The player who\ngets " + maxScore + " points first wins, unless both players\nreach " + (maxScore - 1) + ", in which case the player who gains a\n2-point lead first wins.", 150, 120);
  text("Controls:\nFor single-player mode , use \'w\' and \'s\'\nto move the ball up and down, respectively.\nFor double-player mode , the second player\nuses \'i\' and \'k\', respectively.\nThe rest is self-explanatory.", 150, 260);
  text("Options:", 450, 60);
  text("Points", 450, 90);
  points.show();
  text(maxScore, 450, 180);
  text("Computer Difficulty", 450, 210);
  difficulty.show();
  if (difficulty.value == 0)
  {
    text("Unimaginably Easy", 450, 300);
  }
  else if (difficulty.value == 1)
  {
    text("Very Easy", 450, 300);
  }
  else if (difficulty.value <= 3)
  {
    text("Easy", 450, 300);
  }
  else if (difficulty.value <= 6)
  {
    text("Medium", 450, 300);
  }
  else if (difficulty.value <= 8)
  {
    text("Hard", 450, 300);
  }
  else if (difficulty.value == 9)
  {
    text("Very Hard", 450, 300);
  }
  else if (difficulty.value == 10)
  {
    text("Unimaginably Hard", 450, 300);
  }
  buttons[buttons.length - 1].show();
  if (mousePressed == true)
  {
    if (buttons[buttons.length - 1].selected == true)
    {
      mode = -1;
    }
  }
}

void drawBackground()
{
  stroke(255);
  fill(0);
  rect(300, 200, 599, 399);
}

class Paddle
{
  int x, y, score;
  float xVel, yVel;
  boolean alreadyInContact;
  Paddle(int tempX, int tempY)
  {
    x = tempX;
    y = tempY;
    score = 0;
    xVel = 0;
    yVel = 0;
    alreadyInContact = false;
  }
  void move()
  {
    x += int(xVel);
    y += int(yVel);
  }
  void show()
  {
    fill(255);
    rect(x, y, 10, 80);
    checkContact();
  }
  void checkContact()
  {
    if (alreadyInContact == false && contact() == true)
    {
      alreadyInContact = true;
    }
    else if (alreadyInContact == true && contact() == false)
    {
      alreadyInContact = false;
    }
  }
  boolean contact()
  {
    return ball.x > x - 15 && ball.x < x + 15 && ball.y > y - 50 && ball.y < y + 50;
  }
}

class Side
{
  int pos;
  boolean orientation; //true for vertical, false for horizontal
  Side(int tempPos, boolean tempOrientation)
  {
    pos = tempPos;
    orientation = tempOrientation;
  }
  void show()
  {
    stroke(0);
    if (orientation == true)
    {
      line(pos, 0, pos, height);
    }
    else
    {
      line(0, pos, width, pos);
    }
  }
  boolean contact()
  {
    if (orientation == true)
    {
      return ball.x > pos - 5 && ball.x < pos + 5;
    }
    else
    {
      return ball.y > pos - 5 && ball.y < pos + 5;
    }
  }
}

class Ball
{
  float x, y, dir, vel;
  Ball()
  {
    x = width/2;
    y = height/2;
    dir = random(360);
    vel = 60;
  }
  void move()
  {
    x += cos(radians(dir)) * 5;
    y += sin(radians(dir)) * 5;
  }
  void bounce()
  {
    if (get(int(x) - 5, int(y)) != color(0, 0, 0))
    {
      dir = 180 - dir;
      xBounce();
    }
    else if (get(int(x) + 5, int(y)) != color(0, 0, 0))
    {
      dir = 180 - dir;
      xBounce();
    }
    if (get(int(x), int(y) - 5) != color(0, 0, 0))
    {
      dir = 0 - dir;
      yBounce();
    }
    else if (get(int(x), int(y) + 5) != color(0, 0, 0))
    {
      dir = 0 - dir;
      yBounce();
    }
    dir = dir % 360;
  }
  void show()
  {
    fill(255);
    ellipse(x, y, 10, 10);
  }
  void xBounce()
  {
    if (paddles[0] != null)
    {
      if (paddles[0].contact() == true)
      {
        dir += int((ball.y - paddles[0].y)*3/4);
        vel += 2;
        hitLast = true;
        move();
      }
    }
    if (paddles[1] != null)
    {
      if (paddles[1].contact() == true)
      {
        dir -= int((ball.y - paddles[1].y)*3/4);
        vel += 2;
        hitLast = false;
        move();
      }
    }
  }
  void yBounce()
  {
    for (int i = 0; i < paddles.length; i++)
    {
      if (paddles[i] != null)
      {
        if (paddles[i].contact() == true)
        {
          dir += int((ball.x - paddles[i].x)*3/4);
          vel += 2;
          move();
        }
      }
    }
  }
}

class Button
{
  int x, y;
  String text;
  boolean selected;
  Button(int tempX, int tempY, String tempText)
  {
    x = tempX;
    y = tempY;
    text = tempText;
    selected = false;
  }
  void show()
  {
    stroke(255);
    textSize(12);
    if (mouseX > x - 100 && mouseX < x + 100 && mouseY > y - 20 && mouseY < y + 20)
    {
      fill(255);
      rect(x, y, 200, 40);
      fill(0);
      text(text, x, y);
      selected = true;
    }
    else
    {
      fill(0);
      rect(x, y, 200, 40);
      fill(255);
      text(text, x, y);
      selected = false;
    }
  }
}

class Slider
{
  int x, y, value;
  Slider(int tempX, int tempY, int tempValue)
  {
    x = tempX;
    y = tempY;
    value = tempValue;
  }
  void show()
  {
    stroke(255);
    fill(0);
    rect(x, y, 204, 34);
    fill(255);
    rect(x - 100 + value * 10, y, value * 20, 30);
    if (mousePressed == true && mouseX > x - 102 && mouseX < x + 102 && mouseY > y - 17 && mouseY < y + 17)
    {
      value = round((mouseX - x + 100)/20.0);
    }
  }
}

void keyPressed()
{
  if (key == 'w')
  {
    wIsPressed = true;
  }
  if (key == 's')
  {
    sIsPressed = true;
  }
  if (key == 'i')
  {
    iIsPressed = true;
  }
  if (key == 'k')
  {
    kIsPressed = true;
  }
  if (key == ' ')
  {
    spaceIsPressed = true;
  }
}

void keyReleased()
{
  if (key == 'w')
  {
    wIsPressed = false;
  }
  if (key == 's')
  {
    sIsPressed = false;
  }
  if (key == 'i')
  {
    iIsPressed = false;
  }
  if (key == 'k')
  {
    kIsPressed = false;
  }
  if (key == ' ')
  {
    spaceIsPressed = false;
  }
}
