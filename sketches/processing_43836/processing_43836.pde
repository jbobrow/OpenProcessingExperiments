
// sets up the two objects

Pad pad;
Ball ball;

void setup()
{
  size(500, 500);
  // draws objects from center point
  rectMode(RADIUS);
  ellipseMode(RADIUS);
  noStroke();
  smooth();
  //Sets up font
  PFont fontA;
  fontA = loadFont("ArialMT-48.vlw");
  textFont(fontA, 15);

  //Sets up class
  ball = new Ball(width/2, height/2, 2,2);
  pad = new Pad(0, 380, 100);
}

void draw() 
{
  background(0);
  pad.update();
}

class Pad {

  int paddle_width;
  int paddle_height;
  int dist_wall;
  int x = 0;

  public Pad(int paddle_width, int paddle_height, int dist_wall) {

    this.paddle_width = 100;
    this.paddle_height = 20;
    this.dist_wall = 5;
  }



  void update() {

    if (mouseButton == LEFT)
    {
      // if clicked the start button disappears
      fill(0);
      rect(0, 0, width, height);
      if (keyCode == LEFT) {
        x--;
      }  
      if (keyCode == RIGHT) {
        x++;
      }
      else {
        x = x;
      }

      if (x<0) {
        x = width;
      }

      if (x>500) {
        x = 0;
      }
      // Draw the paddle

      // Constrain paddle to screen

      ball.ball_y += ball.ball_dir * 1.0;
      ball.ball_x += ball.dx;
      if (ball.ball_y > height+ball.ball_size) {
        ball.ball_y = -height/2 - ball.ball_size;
        ball.ball_x = random(0, width);
        ball.dx = 0;
      }

      //float paddle_y = constrain(mouseY, pad.paddle_height, height-pad.paddle_height);

      ball.update();

      fill(0, mouseX, 255);
      rect(mouseX, height-dist_wall, paddle_width, paddle_height);
    }
    else
    {

      // starts button appears
      fill(255);
      rect(width/2, height/2, 100, 50);
      fill(mouseX, 0, 0);
      text("Click to Start", 200, height/2);
    }
  }
}

class Ball {

  float ball_y = 1;
  float ball_x;
  float ball_dir;
  float ball_size;  // Radius
  float dx;  // Direction
  int score = 0;
  int rate = 100;
  int life = 3;

  public Ball(float ball_dir, float ball_size, float dx,float ball_x) {
    this.ball_dir = 1;
    this.ball_size = 10;
    this.dx = 0;
    this.ball_x = random(400);
  }
  void update() {
    // framerate increases as game progresses
    frameRate(rate);
    fill(0, 10);
    rect(width,height,0,0);
    fill(255, 255, 0);
    ellipse(ball_x, ball_y, ball_size, ball_size);

      // when the user has no lives left 'game over' is displayed
    if (life == 0) {
      background(mouseX, 255, mouseY);
      fill(255, 0, 0);
      text("GAME OVER!!", width/2, height/2);
    }
    else
    {

      // Tests to see if the ball is touching the paddle
      float px = height-pad.dist_wall-pad.paddle_height-ball_size;
      if (ball.ball_y == px 
        && ball_x > pmouseX - pad.paddle_width - ball_size 
        && ball_x < pmouseX + pad.paddle_width + ball_size) {
        ball_dir *= -1;
        if (mouseX != pmouseX) {
          dx = (mouseX-pmouseX)/2.0;
          if (dx >  5) { 
            dx =  5;
          }
          if (dx < -5) { 
            dx = -5;
          }
        }
      } 

      // If ball hits paddle or back wall, reverse direction
      if (ball_y < ball_size && ball_dir == -1) {
        ball_dir *= -1;
      }

      // If the ball is touching top or bottom edge, reverse direction
      if (ball_x > width-ball_size) {
        dx = dx * -1;
      }
      if (ball_x < ball_size) {
        dx = dx * -1;
      }
      
      // if the ball goes out of the bottom of the screen life is lost and ball back to top
      if (ball_y > height) {
        life--;
        ball_y = random(50);
      }

      score++;
      rate++;

      fill(255);
      //displays score and lives remaining.
      text("Score:" + score + " ", 420, 15);
      text("Lives:" + life + " ", 10, 15);


    }
  }
}


