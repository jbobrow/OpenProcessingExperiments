
/*
 * Creative Coding
 * Week 5, 03 - Moving balls
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with member functions that move and display
 *
 */

// declare array of Balls
Ball theBalls[];
int numBalls = 100;

// setup font
PFont myFont;      
float xSize = 10;

void setup() {
  size(500, 500);

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(random(20,24), 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  background(0);
  
  //setup fonts
  String [] fonts = PFont.list();
  println("Fonts available:");
  println(fonts);
  myFont = createFont("Arial", 16, true);
  textFont(myFont, 15);
  fill(255);
}

void draw() {
  
  colorMode(HSB,360,100,100);
  
  background(#C7EAE6);
  for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move();
    theBalls[i].display();
    theBalls[i].vector_display();
    theBalls[i].speed_display();
    theBalls[i].direction_display();
    
    fill(0);
    text(" PRESS MOUSE FOR SPEED AND DIRECTION OF BALL ",50,50);
    
  }
}  

/*
 * declaration of the class "Ball"
 * Which represents the concept of a moving ball with a direction, speed
 * and rate of change in direction.
 *
 */
class Ball {

  // instance variables
  float x;        // x position
  float y;        // y position
  float size;     // ball size
  float speed;    // how fast the ball is moving
  float direction;// direction of travel
  float omega;    // rotational speed


  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does not have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, float size_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    size = size_;

    // set speed and directions to 0
    speed = 0;
    direction = 0;
    omega = 0;
  }


  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed =  random (1);
    direction = random(360);
    omega = random(0.3);
  }

  // move method
  // moves the ball in the current direction
  void move() {
    float dx, dy; 
    /*
     * direction is an angle that represents the current
     * direction of travel.
     * speed is the current speed in units/frame
     */
    dx = cos(radians(direction)) * speed;
    dy = sin(radians(direction)) * speed;
    x += dx;
    y += dy;
    direction += omega;
    checkBounds();
  }

  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, move in the opposite direction
  void checkBounds() {
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      direction += 180;
      direction = direction % 360;
    }
  }


  // display method
  // draws the ball as a coloured circle depending on direction, speed and angle of rotation
  
  void display() {
    
    // to stop colour fill being black due to low direction,sat and hue
    float direction_hue= direction;
    float speed_sat=speed;
    float omega_bri=omega;
    if ( direction<=0) {
      direction_hue=-direction_hue;
    }
    if (speed_sat <=0) {
      speed_sat=-speed_sat;
    }
    if (omega_bri<=0) {
      omega_bri=-omega_bri;
    }

    fill(direction, speed_sat*100, omega_bri*100, 80);
    stroke(direction, speed_sat*100, omega_bri*100);
    ellipse(x, y, size, size);
    
  }

  void vector_display() {
    // add triangle in direction of travel
    float delta_x = x + cos(radians(direction))* speed*size;
    float delta_y = y + sin(radians(direction))*speed*size;
    // to stop colour fill being black due to low direction,sat and hue
    float direction_hue= direction;
    float speed_sat=speed;
    float omega_bri=omega;
    if ( direction<=0) {
      direction_hue=-direction_hue;
    }
    if (speed_sat <=0) {
      speed_sat=-speed_sat;
    }
    if (omega_bri<=0) {
      omega_bri=-omega_bri;
    }

    fill(direction, speed_sat*100, omega_bri*100, 180);
    stroke(direction, speed_sat*100, omega_bri*100);   
    triangle( x+ size/4, y+size/4, x-size/4, y-size/4, delta_x, delta_y);
  }

  void speed_display() {
    //add speed display if mouse pressed
    if ( mousePressed ) {
      //textFont(myFont, 10);
      fill(234, 57, 93);
      String short_speed= nfs(speed, 1, 2);
      String speed_display = "speed" + "=" + short_speed ;
      if (dist(mouseX, mouseY, x, y)<10) { 
        text(speed_display, x-30, y );
      }
    }
  }
  void direction_display() {
    //add direction display if mouse pressed
    if ( mousePressed ) {
      //textFont(myFont, 10);
      fill(350, 100, 100);
      String direction_display = "direction" + "=" + int (direction) ;
      if (dist(mouseX, mouseY, x, y)<10) { 
        text(direction_display, x-40, y+15 );
      }
    }
  }
}



