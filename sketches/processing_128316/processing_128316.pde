

/**
 In this example, I moved the bouncing ball we had eariler into its own
 class. By bundling all of the details of managing the Ball into its own
 class, we can now create ridiculous numbers of balls with very little effort.
 
 This also introduces arrays as a way for us to manage all of these balls.
 
 C. Andrews
 2014-01-14
 **/



Ball balls[]; // This declares an array that can hold Ball objects
float acceleration = .9; // the acceleration constant


/**
 This sets up the environment. In this instance, we create the array and
 populate it with a collection of Ball objects/
 **/
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);

  // this is where the array is actually created
  // this says it can hold 1000 Balls
  balls = new Ball[1000];

  // We iterate through the array, creating a new Ball for each spot
  for (int i =0; i < balls.length; i = i+1) {

    balls[i] = new Ball(); // instantiate a new Ball object

    // Now we set some of the properties with random values
    balls[i].hue = (int)random(360);
    balls[i].vx = random(-4, 4);
    balls[i].y = balls[i].y + random(-20, 20);
    balls[i].vy = random(-5, 5);
  }
}


/**
 Draw is now pretty simple. We loop through the array and draw each 
 Ball by calling its update() method.
 **/
void draw() {

  // background is commented out for maximum chaos
  // background(0, 0, 100);

  // visit each Ball in the list and update it
  for (int i =0; i < balls.length; i = i+1) {

    balls[i].update();
  }
}

/**
 This is the Ball class -- it serves as the template for Ball objects, 
 defining the properties and fucntionality.
 **/
class Ball {
  float x, y; // the position of the ball
  float vy, vx; // the velocity of the ball
  int diameter = 20; // the diameter of the ball
  int hue; // the color of the ball

  /**
   This is the _constructor_ of the class. When a new object is instantiated,
   this function is immediately called.
   
   In this case, I am just placing the Ball in the middle of the canvas, 20
   pixels from the top.
   **/
  Ball() {
    x = width / 2;
    y = 20;
    vy = 0;
  }

  /**
   This function is responsible for updating the position of the ball, and
   making sure that it doesn't leave the canvas.
   **/
  void update() {
    paint();

    // update the position of the ball
    y = y + vy;
    x = x + vx;

    // check to see if it has hit the "floor" of the canvas
    if (y + diameter/2 >= height) {
      // it did, reverse the velocity to simulate the strike
      vy = -vy;
    }
    else {
      // it didn't, update the velocity with the acceleration
      vy = vy + acceleration;
    }

    if (x + diameter/2 >= width) {

      vx = -vx;
    } 
    else if (x - diameter/2 <= 0) {

      vx = -vx;
    }
  }

  /**
   This handles the actual drawing of the Ball objects.
   **/
  void paint() {
 
    fill(hue, 100, 100);
    ellipse(x, y, diameter, diameter);
  }
}



