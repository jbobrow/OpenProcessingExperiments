
//Mira A | PONG | CP1 | Mods 16/17

//The ball is named "circle".
Ball circle;
//The paddle is named "san".
Paddle san;
//At startup, the start screen is shown. It is shown again when the ball goes beyond certain boundaries of the screen.
boolean showstart = true;

void setup()
{
  //Self explanatory.
  size (9000, 9000);
  smooth();
  //"circle" is a new Ball.
  circle = new Ball();
  //"san" is a new Paddle.
  san = new Paddle();
}

void draw()
{
  //If the boolean "showstart" is true, the start screen is shown. It instructs the player to click the text "CLICK HERE TO BEGIN" to start playing.
  if (showstart == true)
  {
    background(0);
    //Pertaining to the "CLICK HERE TO BEGIN" text.
    textSize(32);
    stroke(255);
    textAlign(CENTER);
    text("CLICK HERE TO BEGIN", 350, 320);
    //Pertaining to the instructions. 
    textSize(18);
    text("Hold the left mouse button to move clockwise.\nHold the right mouse button to move counter clockwise. ", 350, 370);
    //Decoration.
    noFill();
    strokeWeight(5);
    ellipse(350, 350, 500, 500);
    //User input will cause the game to begin.
    if (mouseX < 550 && mouseX > 150 && mouseY < 350 && mouseY > 280)
    {
      if (mousePressed == true)
      {
        showstart = false;
      }
    }
  }
  //If the boolean "showstart" is false, the start screen is not shown, and a game is in session.
  else if (showstart == false)
  {
    background(0);
    //Larger, grey circle.
    fill(200);
    ellipse(350, 350, 60, 60);
    //Smaller, white circle.
    fill(255);
    ellipse(350, 350, 50, 50);
    //Pertaining to the paddle "san".
    san.input();
    san.pshow();
    //Pertaining to the ball "circle".
    circle.move();
    circle.lose();
    circle.show();
  }
}

class Ball
{
  //"ballx" >> x location of ball.
  //"bally" >> y location of ball.
  //"a" >> Horizontal movement speed, to the right.
  //"b" >> Horizontal movement speed, to the left.
  //"c" >> Vertical movement speed, upwards.
  //"d" >> Vertical movement speed, downwards.
  int ballx, bally, a, b, c, d;
  //If "ballr" is true, the ball is traveling towards the right. If not, towards the left.
  //If "ballu" is true, the ball is traveling upwards. If not, downwards.
  boolean ballr, ballu;
  Ball()
  {
    //Starting location of ball.
    ballx = 350;
    bally = 350;
    //Starting direction of ball.
    ballr = false;
    ballu = false;
    //Starting movement speed.
    a = 3;
    b = 3;
    c = 3;
    d = 3;
  }
  //"move" directs the ball's movement according to whether ballr and/or ballu are true or false.
  void move()
  {
    //To the right.
    if (ballr == true)
    {
      ballx = ballx + a;
    }
    //To the left.
    else 
    {
      ballx = ballx - b;
    }
    //Upwards.
    if (ballu  == true)
    {
      bally = bally - c;
    }
    //Downwards.
    else
    {
      bally = bally + d;
    }
  }
  //"bounce" directs the ball's activity when bouncing off of a surface.
  void bounce()
  {
    //If an area to the immediate left of the ball is not black in colour, the ball will move towards the right, and movement speeds will randomize.
    if (get(ballx-14, bally)!=color(0))
    {
      ballr = true;
      a = int(random(2, 5));
      b = int(random(2, 5));
      c = int(random(2, 5));
      d = int(random(2, 5));
    }
    //If an area to the immediate right of the ball is not black in colour, the ball will move towards the left, and movement speeds will randomize.
    else if (get(ballx + 14, bally) != color (0))
    {
      ballr = false;
      a = int(random(2, 5));
      b = int(random(2, 5));
      c = int(random(2, 5));
      d = int(random(2, 5));
    }
    //If an area above the ball is not black in colour, the ball will move downwards, and movement speeds will randomize.
    if (get(ballx, bally-14)!=color(0))
    {
      ballu = false;
      a = int(random(2, 5));
      b = int(random(2, 5));
      c = int(random(2, 5));
      d = int(random(2, 5));
    }
    //If an area below the ball is not black in colour, the ball will move upwards, and movement speeds will randomize.
    else if (get(ballx, bally+14)!=color(0))
    {
      ballu = true;
      a = int(random(2, 5));
      b = int(random(2, 5));
      c = int(random(2, 5));
      d = int(random(2, 5));
    }
  }
  //"show" codes for the appearance and location of the ball.
  void show()
  {
    noStroke();
    fill(255);
    ellipse(ballx, bally, 15, 15);
  }
  //If the ball goes beyond certain boundaries of the screen, the start screen will be shown. "bounce" is located in the else statement, as the ball should not bounce off the edge
  //of the screen after the player has lost. Initial location of the ball is also reset.
  void lose()
  {
    if (ballx < 30 || ballx > 670 || bally < 30 || bally > 670)
    {
      showstart = true;
      ballx = 350;
      bally = 350;
    }
    else 
    {
      bounce();
    }
  }
}

class Paddle
{
  //"go" assists in the movement of the paddle.
  float go;
  Paddle()
  {
    //Beginning value of "go".
    go = 0;
  }
  //If the left mouse button is pressed, the paddle will move clockwise. If the right mouse button is pressed, counterclockwise.
  void input()
  {
   if (mousePressed == true)
   {
    if (mouseButton == LEFT)
    {
      go = go + 0.05;
    }
    else if (mouseButton == RIGHT)
    {
      go = go - 0.05;
    }
    }
  }
  //"pshow" codes for the appearance and location of the paddle.
  void pshow()
  {
    //Larger, grey part of paddle.
    strokeWeight(10);
    stroke(200);
    noFill();
    arc(350, 350, 500, 500, HALF_PI + go, PI-1 + go);
    //Smaller, white part of paddle.
    strokeWeight(5);
    stroke(255);
    arc(350, 350, 500, 500, HALF_PI + go, PI-1 + go);
  }
}
