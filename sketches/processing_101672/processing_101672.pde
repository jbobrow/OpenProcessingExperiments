
Ball [] balls = new Ball[1];
PImage basketball, board, net, court;
float powerX = 0;
float powerY = 0;
float ratio, board_width, board_height, hoop_left, hoop_right, hoop_top; 

void setup()
{
  size(800, 600);
  smooth();
  background(200);
  basketball = loadImage("Basketball.png");
  board = loadImage("Board.png");
  net = loadImage("Net.png");
  court = loadImage("bb_court_01.jpg");
  ratio = (float) 273 / 360;
  board_width = 350;
  board_height = board_width * ratio;
  hoop_left = map(270, 0, 720, 0, board_width) + (width - board_width) / 2;
  hoop_right = map(450, 0, 720, 0, board_width) + (width - board_width) / 2;
  hoop_top = map(360, 0, 546, 0, board_height) + 10;
  balls[0] = new Ball(100, 200, 0, -1, basketball);
}

void draw()
{
  background(200);
  image(court, 0, 0, width, height);
  image(board, width / 2 - board_width / 2, 10, board_width, board_height);
  fill(255);
  rect(40, 50, 50, 50, 3);
  fill(0);
  textAlign(CENTER);
  text("Score", 65, 70); 
  text(str(balls[0].score), 65, 95);
  balls[0].display(width, 600, hoop_left, hoop_right, hoop_top, board_height);
  imageMode(CORNER);
  image(net, width / 2 - board_width / 2, 10, board_width, board_height);
}

void mouseDragged()
{
  powerX = mouseX - pmouseX;
  powerY = mouseY - pmouseY;
  balls[0].velocityX = powerX;
  balls[0].velocityY = powerY;
  balls[0].angle_speed =  powerX;
  powerX = 0;
  powerY = 0;
}

void mouseClicked()
{
  bounce.stop();
  bounce.play();
}

class Ball 
{
  float centerX, centerY;
  int diameter = 70;
  float angle = 0;
  float angle_speed = 1;
  float gravity = 0.1;
  float frictionY = 0.98;
  float frictionX = 0.99;
  float ball_radius;
  float velocityX, velocityY;
  int score = 0;
  int scoring = 0;
  PImage art;
  Ball (float cx, float cy, float vx, float vy, PImage a)
  {
    centerX = cx;
    centerY = cy;
    velocityX = vx;
    velocityY = vy;
    art = a;
    ball_radius = 32;
  }

  void display(int x, int y, float hoop_left, float hoop_right, float hoop_top, float hoop_bottom)
  {
    angle = (angle + angle_speed) % 360;
    angle_speed *= frictionX;
    pushMatrix();
    translate(centerX, centerY);
    rotate(radians(angle));
    imageMode(CENTER);
    image(art, 0, 0, diameter, diameter); 
    popMatrix();

    centerX += velocityX;
    centerY += velocityY;

    if ((centerX + ball_radius >= x) || (centerX <= ball_radius))
    {
      velocityX *= - frictionX;
    }
    else if (dist(centerX, centerY, hoop_left, hoop_top) <= ball_radius)
    {
      if (velocityX == 0)
      {
        velocityX += 0.6;
      }
      if (centerX > hoop_left)
      {
        velocityX = abs(velocityX) * frictionX;
      }
      else
      {
        velocityX =  - abs(velocityX) * frictionX;
      }
      velocityY *= - frictionY;
    }
    else if (dist(centerX, centerY, hoop_right, hoop_top) <= ball_radius)
    {
      if (velocityX == 0)
      {
        velocityX -= 0.6;
      }
      if (centerX > hoop_right)
      {
        velocityX = abs(velocityX) * frictionX;
      }
      else
      {
        velocityX =  - abs(velocityX) * frictionX;
      }
      velocityY *= - frictionY;
    }
    else if ((centerX >= hoop_left) && (centerX <= hoop_right) && (centerY >= hoop_top) && (centerY <= hoop_top + 3) && scoring == 0)
    {
      scoring = 1;
    }
    else if ((centerX >= hoop_left) && (centerX <= hoop_right) && (centerY >= hoop_top + 50) && (centerY <= hoop_top + 53) && scoring == 1)
    {
      score++;
      scoring = 2;
    }
    else if (!((centerX >= hoop_left) && (centerX <= hoop_right) && (centerY >= hoop_top) && (centerY <= hoop_bottom)))
    {
      scoring = 0;
      velocityX *= frictionX;
    }
    else
    {
      velocityX *= frictionX;
    }

    if ((velocityY > 0) && (centerY + ball_radius >= y)) {
      velocityY *= - frictionY;
    }
    else
    {
      velocityY += gravity;
      velocityY *= frictionY;
    }
  }
}



