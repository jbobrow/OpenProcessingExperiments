
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

/*
 * I've made my alterations at this code:
 *
 * Added the Arrows poiting to the ball's direction with size proportional to the ball's speed
 * Added a text showing the ball's coordinates
 *
 * Both actions can be activated or deactivated by pressing 1 or 2 at the keyboard
 *
 * If someone happens to download and read this, have fun making editting this program!
 *
 *                                                                                        
 */


// declare array of Balls
Ball theBalls[];
int numBalls = 150;


void setup() {
  //size(500, 500);
  size(displayWidth, displayHeight);

  // initialise array and fill it with balls
  theBalls = new Ball[numBalls];
  for (int i = 0; i < numBalls; ++i) {
    float ballSize = constrain(20 + (randomGaussian() * 4), 1, 100);
    theBalls[i] = new Ball(random(width), random(height), ballSize);
    theBalls[i].randomiseDirection();
  }
  background(0);
}

void draw() {
  background(0);
  for (int i = 0; i < numBalls; ++i) {
    theBalls[i].move();
    theBalls[i].display();
  }
  
}  

void keyPressed(){
  
 if (key == '1'){
    for (int i = 0; i < numBalls; ++i) {
      theBalls[i].triggerShowArrows();    
    } 
 }

 if (key == '2'){
    for (int i = 0; i < numBalls; ++i) {
      theBalls[i].triggerShowCoordinates();    
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
  
  // Variables for the Arrows and text
  int arrowScale;
  int arrowHeadAngle;
  int arrowHeadSize;
  PFont font = createFont("Arial",16,true);
  
  boolean showCoordinates;
  boolean showArrows;
  
 
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
    
    arrowScale = 50;
    arrowHeadAngle = 30;
    arrowHeadSize = 15;
    
    showArrows = false;
    showCoordinates = false;
    
    textFont(font, 10);
  }
  
  // Next two functions change the state of the activation variables for text ans arrows
  void triggerShowArrows(){
   showArrows = showArrows==true? false : true; 
  }

  
  void triggerShowCoordinates(){
   showCoordinates = showCoordinates==true? false : true; 
  }
  
  // randomiseDirection
  // randomise the speed and direction of the ball
  void randomiseDirection() {
    speed = random(1);
    direction = random(360);
    omega = randomGaussian() * 0.3;
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
      //direction = constrain(direction, 0, 360);
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
    
    // Check if user want to show arrows or coordinates
    if (showArrows ==true) drawArrows();
    if (showCoordinates ==true) drawCoordinates();
  }
  
  
  // Draws Arrows poiting to the direction the ball is moving and has size proportional to the ball's speed
  void drawArrows(){
    
  fill(200,100);
  float px = x+speed*cos(radians(direction))*arrowScale;
  float py = y+speed*sin(radians(direction))*arrowScale;
  
  line(x, y, px, py);
  
  //Draws the ArrowHead
  float angle = asin(x/dist(x, y, x+speed*cos(radians(direction))*arrowScale, y+speed*sin(radians(direction))*arrowScale));
  angle = radians(direction)+5*PI/6;
  line(px, py, px+arrowHeadSize*speed*cos(angle), py+arrowHeadSize*speed*sin(angle));
  angle = radians(direction)-5*PI/6;
  line(px, py, px+arrowHeadSize*speed*cos(angle), py+arrowHeadSize*speed*sin(angle));

  }

  // simply draws the coordinate of the ball at its center
  void drawCoordinates(){
  
    fill(255,255,255);
    
    // creates the text string
    String coordinates = "(" + str(int(x)) + "," + str(int(y)) + ")" ;
    // reduces the velue of x coordinate by half the text size so the text will be drawn at the center of the ball
    float textX = x-textWidth(coordinates)/2;
    text ( coordinates , textX, y);
   
  }

  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }

  float getSize(){
    return size;
  }
  


}
}




