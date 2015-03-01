
/*
 * Creative Coding
 * Week 5, 03 - Moving balls
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with member functions that move and display
 * add vectors and add text
 */

// declare array of Balls
Ball theBalls[];

//PImage bgImage;
PFont myFont;    // font data
int numBalls = 100;
char  selected;  // what is selected (a,b,t,n)


void setup() {
  size(1000, 800);                //set size of image
//  bgImage = loadImage("IMG_2365.JPG");
  
  selected = 'b';
  myFont = loadFont("SansSerif.plain-16.vlw");        //load font
  textFont(myFont);  // set the current font to myFont

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {    
    float ballSize = constrain(20 + (random(1) * 4), 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
//  background(bgImage);
}

void draw() {
  if (selected == 'k'){
  }  else background(0);

  
  for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move();
    theBalls[i].display();
    switch(selected){
      case 'a':
        theBalls[i].speedVector();
        break;
      case 'b':
        theBalls[i].speedVector();
        theBalls[i].drawNumbers();
        break;
      case 't':
        theBalls[i].drawNumbers();
        break;
      case 'n':
        break;
    }
  }  
}

void keyReleased() {
  // set selected to be the last key released
  selected = key;
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
  float x2;        // x position of vector point
  float y2;        // y position of vector point
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
    speed = random(2);
    direction = random(360);
    omega = random(1) * 1.0;
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
    if (x <= 0 || x >= width) { 
      direction += 180;
    }
    else if (y <= 0 || y >= height){
      direction += 180;      
    }
    direction = direction % 360;
  }
      

  // display method
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    noStroke();
    colorMode(HSB,360,100,100);
    fill(map(direction%360, -360, 360 , 0, 360), map(constrain(omega, -10, 10),-10 ,10 , 0, 100), map(speed, 0, 1, 0, 150));
    ellipse(x, y, size, size);
    strokeWeight(1);
    colorMode(RGB);
    stroke(255,0,0);
    point(x,y);
    strokeWeight(1);
  }
  
  // speed vector method
  void speedVector(){
    float dx, dy; 
    dx = cos(radians(direction))*50 * speed;
    dy = sin(radians(direction))*50 * speed;
    stroke(0,255,0);
    //draw arrow for vector
    line(x,y,x+dx,y+dy);
    line(x+dx, y+dy, x+dx+(cos(radians(direction-150))*10*speed), y+dy+(sin(radians(direction-150))*10*speed));
    line(x+dx, y+dy, x+dx+(cos(radians(direction+150))*10*speed), y+dy+(sin(radians(direction+150))*10*speed));    
  }
  
  void drawNumbers() {
  
    String theText = nf(speed , 1, 2) + ", " + str((int)(direction%360)); // convert speed and direction to string
    textSize(16);  // normal font size
    float textW = textWidth(theText) * 0.5;
    float textA = textAscent() * 0.5;
    fill(255,255,0);  //Set text blue
    // draw text offset from the centre of the balls
    text(theText, x - textW, y + textA);
  }
  
}



