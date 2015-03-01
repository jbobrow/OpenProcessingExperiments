
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
int numBalls = 10;
Arrow theArrows[];
char selected; // which key selected

void setup() {
  size(500, 500);
  selected = '0';

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(20 + (random(1) * 4), 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  
  //initialise array and fill it with arrows
  theArrows = new Arrow[numBalls];
  for (int i = 0; i < numBalls; ++i){
    theArrows[i] = new Arrow(0,0,0,0);
  }
  background(0);
}

void draw() {
  background(0);
  for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move();
    theBalls[i].display();
   if(selected =='a'){ 
    theArrows[i].startX = theBalls[i].x;
    theArrows[i].startY = theBalls[i].y;
    theArrows[i].aDirect = theBalls[i].direction;
    theArrows[i].aLength = theBalls[i].speed*100;
    theArrows[i].drawArrow();
   }
    if(selected == 't'){
    theBalls[i].textVector();
    }
  }
}  

void keyReleased(){
 //set selected to last key released
selected = key; 
}

/*
 * declaration of the class "Arrow"
 * Which represents the concept of an arrow with an origin point,
 * direction and length.
 *
 */
 class Arrow{
   
   //instance variables
   float startX;  //x co-ord of arrow start
   float startY;  //y co-ord of arrow start
   float aLength; //length of the arrow
   float aDirect; //direction the arrow points
   
   //constructor
   Arrow(float x, float y, float l, float d){
   //store supplied values in instance variables
   startX = x;
   startY = y;
   aLength = l;
   aDirect = d;
   }
   void drawArrow(){
     // need to calculate end points from length and direction
     float endX = startX+aLength*cos(radians(aDirect));
     float endY = startY+aLength*sin(radians(aDirect));
     
     line(startX, startY, endX, endY);
     //draw arrowhead at (endx, endY)
     pushMatrix();
     translate(endX, endY);
     float a = radians(aDirect);
     rotate(a);
     line(0, 0, -10, -10);
     line(0, 0, -10, 10);
     popMatrix();
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
  // does have a return type (not even a void) and can't
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
    speed = random(1);
    direction = random(360);
    omega = random(1) * 0.3;
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
  // draws the ball as a transparent circle with a red point at the centre
  //
  void display() {
    noStroke();
    fill(200,100);
    ellipse(x, y, size, size);
    stroke(255,0,0);
    point(x,y);
  }
  
  //display speed and direction as text
  
  void textVector() {
   String spText = nf(speed,1,2);
 //  spText = spText.substring(0,4);
  String dirText = str((int)direction);
 textSize(10);
float textAsc = textAscent();
fill (255);
text (spText, x-(textWidth(spText)/2), y);
text (dirText, x-(textWidth(dirText)/2), y+textAsc);
  }
}



