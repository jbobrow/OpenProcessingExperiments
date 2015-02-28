
Ball[] balls;
Leg[] legs;
int past_second = -1;
PImage leg_img;

class Ball{
  int x, y, diameter, stop_point;
  float speed, acceleration;
  int dx, dy, dd;

  Ball(int a, int b, int d)
  {
    x = a;
    y = b;
    diameter = d;
    speed = 0.0;
    acceleration = 0.0;
    stop_point = (int)random(-30, 30);
    dx = (int)random(-3,3);
    dy = (int)random(-3,3);

    // delta diameter
    dd = (int)random(5,15);
    if(random(-1,1) < 0.0)
      dd *= -1.0;
  }

  /**
   * drops the ball
   */
  void drop()
  {
    acceleration = 0.9;
  }

  void draw_ball()
  {
    // make the ball fall
    if(y < height - 40 + stop_point || (speed < 0.0))
    {
      y += speed;
      speed += acceleration;
    }
    else if(abs(speed) > 3.5)
      speed *= -0.4;

    float percent = (millis() % 1000.0)/1000.0;
    if(percent > 0.5)
      percent = 1.0 - percent;

    stroke(200, 50 + diameter);
    fill(20, 50 + diameter);
    ellipse(x+percent*dx, y+percent*dy, diameter+percent*dd, diameter+percent*dd);
  }
}

class Leg{
  float direction;
  float theta, leg_scale, dtheta;
  Ball ball;

  Leg(Ball ba)
  {
    ball = ba;
    leg_scale = random(0.8, 1.2);
    theta = random(-0.5, 0.5);
     
    direction = 1.0;
    if(random(-1,1) < 0.0)
      direction *= -1;
  }

  void draw_leg()
  {
    pushMatrix();
    
    float percent = (millis() % 1000.0)/1000.0;
    if(percent > 0.5)
      percent = 1.0 - percent;

    translate(ball.x, ball.y);

    if(ball.x > width/2)
      scale(-leg_scale,leg_scale);
    else
      scale(leg_scale,leg_scale);

    if(0.0 < ball.speed && ball.speed < 0.1)
      percent = 1.0 + 0.03*percent;

    float on_ground = 0.0;
    float speed = 1.0;
    if(ball.acceleration != 0.0)
    {
      on_ground = 0.006*ball.y;
      speed = ball.speed;
    }

    rotate(theta+percent*0.09*(direction*speed)+on_ground);

    image(leg_img, 0, 0);

    popMatrix();
  }
}

void setup() {
  size(600, 600);
  randomSeed(15251);
  initialize_balls();
  leg_img = loadImage("leg.png");
  initialize_legs();
  set_to_current_time();
  
}

/**
 * initializes the clock to current time
 */
void set_to_current_time()
{
  int minute_passed = 60*hour() + minute();
  for(int i = 0; i < minute_passed; i++)
  {
    int r = (int)random(0,720);
    Ball random_ball = balls[r];
    
    // select a ball that hasnt already fallen
    while(random_ball.speed != 0.0)
    {
      r = (int)random(0,720);
      random_ball = balls[r];
    }

    random_ball.drop();
  }
}

/**
 * allocate the ball objects
 */
void initialize_balls(){
  balls = new Ball[720];
  int i = 0;
  while(i < balls.length)
  {
    int x = 0;
    int y = 20;
    while((x < width/2 && y > 2*x/3 + random(-10,10)) || 
          (x > width/2 && y > 2*(width - x)/3 + random(-10,10))
          )
    {
      x = (int)random(20, width-20);
      y = (int)random(5, height/3);
    }

    int s = (int)random(20, 50);

    balls[i] = new Ball(x, y, s);
    i++;
  }
}

/**
 * allocate the leg objects
 */
void initialize_legs()
{
  legs = new Leg[20];
  for(int i = 0; i < legs.length; i++)
  {
    Ball b = balls[(int)random(0,720)];
    while(!(b.x < 200 || b.x > 300))
      b = balls[(int)random(0,720)];

    legs[i] = new Leg(b);
  }

}

/**
 * draw the gradient for the background
 */
void draw_background(){

  for(int i = 0; i < height; i++)
  {
    stroke(100-i/7, 50-i/12, 70-i/10);
    line(0, i, width, i);
  }
}

void draw() {
  draw_background();

  // resets the clock every 12 hours
  if(hour() % 12 == 0 && minute() % 60 == 0 && millis() % 1000.0 < 100.0)
  {
    initialize_balls();
    initialize_legs();
  }

  // selects random ball to drop every minute
  if(second() == 0 && past_second != second())
  {
    int r = (int)random(0,720);
    Ball random_ball = balls[r];
    
    // select a ball that hasnt already fallen
    while(random_ball.speed != 0.0)
    {
      r = (int)random(0,720);
      random_ball = balls[r];
    }
    random_ball.drop();
  }
  past_second = second();

  // draw the balls
  for(int i = 0; i < balls.length; i++)
  {
    Ball b = balls[i];
    b.draw_ball();
  }

  // draw the legs
  for(int i = 0; i < legs.length; i++)
  {
    Leg l = legs[i];
    l.draw_leg();
  }
}


