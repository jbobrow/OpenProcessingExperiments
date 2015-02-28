
/*
 * Taller Programación MDI Veritas
 * Tarea#4
 */

/**
 * Main program file
 *
 * @author Paula Chavarría
 * @since 28/1/14
 * @version 0.2
 */

//================================================================================
// Constants
//================================================================================


int SCREEN_WIDTH = 1000;
int SCREEN_HEIGHT = 600;
int STARS_COUNT = 200;
int NEIGHBOR_DISTANCE = 75;

//================================================================================
// Global Variables
//================================================================================

ArrayList<Star> starsCollection; // The collection of stars presented on the
                                     // canvas

//================================================================================
// Program's methods override
//================================================================================

/**
 * @see http://www.processing.org/reference/setup_.html
 */
void setup() {
  
  // Sets the canvas
  size(1000,600);
  noCursor();
  smooth();
  
  // Initializes the stars collection
  starsCollection = new ArrayList<Star>();
  
  // Populates the stars collection
  for(int i = 0; i < STARS_COUNT; i++) {
    Star star = new Star();
    starsCollection.add(star);
  }
}

/**
 * @see http://www.processing.org/reference/draw_.html
 */
void draw() {
  
  // As we are animating we must clean the canvas background 
  // on every update cycle
  background(255);
  
  // Iterates backwards through the stars collection.
  for (int i=STARS_COUNT-1; i >= 0; i--) {
    
    // Gets the star
    Star star = starsCollection.get(i);
    
    // Draws or updates the star within the canvas
    star.update();
  }
}

/*
 * Taller Programación MDI Veritas
 * Tarea#4
 */

/**
 * Class which serves as a model for a star
 *
 * @see http://www.openprocessing.org/sketch/26358
 * @author Paula Chavarría
 * @since 28/1/14
 * @version 0.2
 */
class Star { 
  
  //================================================================================
  // Constants
  //================================================================================

  static final float CIRCLE_MIN_RADIUS = 10.0;
  static final float CIRCLE_MAX_RADIUS = 75.0;
  static final float MAX_ANGLE = 360;
  static final float MIN_ANGLE = 0;
  static final float MAX_SPEED = 2;
  static final float MIN_SPEED = 0.1;
  
  //================================================================================
  // Attributes
  //================================================================================

  float yPosition; // the y position within the canvas
  float xPosition; // the x position within the canvas
  float speed; // the distance the star is expected to move on each update
  float radius; // the star radius
  float angle; // the direction that the star would take when animated, 
               // the angle is given based on a clockwise direction. 
               // i.e Right is 0 and Up is 90.
  float deltaX; // the difference from x1 to x2, according to the angle
  float deltaY; // the difference from y1 to y2, according to the angle
  color background; // the background color
  
  //================================================================================
  // Constructor
  //================================================================================

  /**
   * Default constructor
   */
  Star() {  
    
    // Randomly sets the stars attributes
    this.radius = random(CIRCLE_MIN_RADIUS, CIRCLE_MAX_RADIUS);
    this.yPosition = random(radius, SCREEN_HEIGHT-radius);
    this.xPosition = random(radius, SCREEN_WIDTH-radius);
    this.angle = random(MIN_ANGLE, MAX_ANGLE);
    this.speed = random(MIN_SPEED, MAX_SPEED);
    
    // Sets the deltas before any update is performed
    calculateDelta();
    
    // Sets the star color
    background = color(random(255), random(255), random(255), 60);
  } 
  
  //================================================================================
  // UI Related Methods
  //================================================================================

  /**
   * Method which draws the star on the canvas, and updates the deltas 
   * information for the next update
   */
  void update() { 
    
    // Draws the star
    noStroke();
    fill(background);
    
pushMatrix();
translate(xPosition,yPosition);
   
star(xPosition, yPosition, radius);

popMatrix();
    
    // Handles collisions with the canvas borders
    
    // Checks if the star has reached the right or left border
    if(xPosition + deltaX > SCREEN_WIDTH-radius || xPosition + deltaX < radius) {
      // As a collision is inminent the star should "bounce", to do so the opposite of the 
      // angle (direction) is needed. e.g The opposite of 180 is 0.
      angle = MAX_ANGLE/2 - angle;
      calculateDelta();
   // Checks if the star has reached the bottom or top border
    } else if (yPosition + deltaY > SCREEN_HEIGHT-radius || yPosition + deltaY < radius) {
      // As a collision is inminent the star should "bounce", to do so the opposite of the 
      // angle (direction) is needed. e.g The opposite of 90 is 270.
      angle = MAX_ANGLE - angle;
      calculateDelta();
    }
    
    // Sets the star's position for the next update
    xPosition += deltaX;
    yPosition += deltaY;
  }
  
  /**
   * Method which calculates the deltas. The star new position is calculated upon the 
   * trigonometric functions. 
   */
  void calculateDelta() {
    
    // Calculates the deltas based on the angle, as the angle is based on a clockwise direction
    // the trigonometric functions result are multiplied by -1.
    deltaY = -1 * speed * sin(radians(angle));
    deltaX = -1 * speed * cos(radians(angle));
  }
  
  void star(float x, float y, float radius){
  beginShape();
  for(int i = 0; i <= 20; i++){
    fill(200,100,100);
    stroke(200,100,100);
    float yStar = sin(radians(i*135)) * radius + y;
    float xStar = cos(radians(i*135)) * radius + x;
    vertex(xStar, yStar);
     
   }
   endShape();
   
}

} 


