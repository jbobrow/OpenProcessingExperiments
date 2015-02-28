
/* @pjs globalKeyEvents=true; 
 */



// Oject variables
Ball ball1;  // this will be the current ball in play
Ball [] balls;  //this will hold an array of game balls
Paddle paddle;
Bumper bumper1;  //two bumpers
Bumper bumper2;
int ballsRemaining;  // keep count of balls remaining
int score = 0; //keep score

void setup() {
  size(400,500);
  smooth();
  
  // Initialize ball array
  balls = new Ball[3];
  for (int i=0; i < balls.length; i++)  {
    balls[i] = new Ball();
  }
   ballsRemaining = 3;
   
   //create the bumpers
   bumper1 = new Bumper(100, 100);
   bumper2 = new Bumper(300, 100);
  
  //initialize slider
  paddle = new Paddle(width/2, 450);
  // launch the first ball
  launchBall();
}

void draw() {
  background(255);
  bumper1.display();  //display the bumpers
  bumper2.display();

  if (ballsRemaining == 0)  {  // game is over
    println("Congratulations.  Your score is: " + str(score) + " points");
  }
  // Move and display ball
  ball1.move();
  ball1.display();
  //check if the ball has left the window
  if (ball1.y > height)  {
    ballsRemaining--;
    launchBall();  //if so, launch a new ball
  }
  if (ball1.hitTestBumper(bumper1))  {
    score++;
  }
  if (ball1.hitTestBumper(bumper2))  {
    score++;
  }
  paddle.display();
  // test if the slider and ball intersect
  ball1.hitTestPaddle(paddle);
}

void keyPressed()  {
  if (keyCode == LEFT)  {
    paddle.move(-10, 0);  //move the slider 1 pixels to the left
  }
  if (keyCode == RIGHT)  {
    paddle.move(10, 0);  //move the slider 1 pixel to the right
  }
  if (keyCode == UP)  {
    paddle.move(0, -10);
  }
  if (keyCode == DOWN)  {
    paddle.move(0, 10);
  }
}
  
void launchBall()  {
  //test to see if there are more balls left
  if (balls.length > 0)  {
    ball1 = balls[balls.length-1];  // get the last ball in the array
    balls = (Ball [])shorten(balls);
  }
}


// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-2: Bouncing ball class

class Ball {

  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  
  // Constructor
  Ball() {
    r = 16;
    x = random(width);
    y = 0;
    xspeed = 2;
    yspeed = 2;
  }
  
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    
    // Check left and right edges
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
    //Check top edge
    if (y < 0) {
      yspeed *= - 1;
    }
  }
  
  // Draw the ball
  void display() {
    stroke(0);
    fill(0,50);
    ellipse(x,y,r*2,r*2);
  }
  
  Boolean hitTestBumper(Bumper b)  {
    float d = dist(x, y, b.x, b.y);
    if (d <= (r + b.r))  {
      xspeed *= -1;  //change travel of the ball
      return true;
    }
    else {
      return false;
    }
  }
  
  // A function that returns true or false based on
  // if the slider collides a ball
  boolean hitTestPaddle (Paddle p) { 
    // test if slider and ball intersect
    float x1 = p.x;        // get the top left point of the paddle
    float y1 = p.y;
    float x2 = p.x + p.w;  // get the bottom right point of the paddle
    float y2 = p.y + p.h;
    if (((x + r) < x1)  
    || ((x - r) > x2)
    || ((y + r) < y1)
    || ((y - r) > y2))
    { 
      return false;
    } 
    else {
      yspeed *= -1;  //reverse the direction of the ball
      return true;
    }
  }

}

class Bumper  {
  int x;  //the location of the bumper
  int y;
  int r;  // the radious of the bumper
  
  Bumper(int tempX, int tempY)  {
    x = tempX;
    y = tempY;
    r = 32;
  }
  
  void display()  {
    fill(255,0,0);
    ellipse(x, y, 2*r, 2*r);
  }
}
class Paddle {

  float x; //location (top left)
  float y;
  float x2;  //location (bottom right)
  float y2;
  float w;  // dimensiosn of slider
  float h;

  Paddle(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    w = 100;
    h = 10;
  }

  void move(float movePixelsX, float movePixelsY) { //sets position of the slider
    x += movePixelsX;
    x = constrain(x, 0, width);  //keep x value within the window
    y += movePixelsY;
    y = constrain(y, 0, height);  // keep y value within the window
  }

  void display() { //draw the slider
    stroke(0);
    fill(0);
    rect(x, y, w, h);
  }
}



