

 /*
Tarea 01
Taller de programación MDI UVeritas
 
Date:         28/1/14
Author:       Paula Chavarría (class & main file)
Modified by:  David Morera Chavarría
 
Description:  Crear un código donde múltiples círculos,se muevan a diferentes velocidades. 
              Cuando cualquier círculo se acerca a otro,a un radio menor predefinido, 
              entonces dibujar una línea entre ambos círculos.

New features: strokes con random colors
              stroke con pesos aleatorios
              Cercanía al aparecer la línea de unión
              # de elipses que aparecen
              velocidad del movimiento
              cualidades de la elipse
*/

 
/*
 * Class Circle
 */

class Circle {
   
  //================================================================================
  // Constants
  //================================================================================
 
  static final float CIRCLE_MIN_RADIUS = 5.0;
  static final float CIRCLE_MAX_RADIUS = 55.0;
  static final float MAX_ANGLE = 360;
  static final float MIN_ANGLE = 0;
  static final float MAX_SPEED = 5;
  static final float MIN_SPEED = 0.1;
   
  //================================================================================
  // Attributes
  //================================================================================
 
  float yPosition; // the y position within the canvas
  float xPosition; // the x position within the canvas
  float speed; // the distance the circle is expected to move on each update
  float radius; // the circle radius
  float angle; // the direction that the circle would take when animated,
               // the angle is given based on a clockwise direction.
               // i.e Right is 0 and Up is 90.
  float deltaX; // the difference from x1 to x2, according to the angle
  float deltaY; // the difference from y1 to y2, according to the angle
   
  //================================================================================
  // Constructor
  //================================================================================
 
  /**
   * Default constructor
   */
  Circle() { 
     
    // Randomly sets the circles attributes
    this.radius = random(CIRCLE_MIN_RADIUS, CIRCLE_MAX_RADIUS);
    this.yPosition = random(radius, SCREEN_HEIGHT-radius);
    this.xPosition = random(radius, SCREEN_WIDTH-radius);
    this.angle = random(MIN_ANGLE, MAX_ANGLE);
    this.speed = random(MIN_SPEED, MAX_SPEED);
     
    // Sets the deltas before any update is performed
    calculateDelta();
  }
   
  //================================================================================
  // UI Related Methods
  //================================================================================
 
  /**
   * Method which draws the circle on the canvas, and updates the deltas
   * information for the next update
   */
  void update() {
     
    // Draws the circle
    //noStroke();
    stroke(200,10);
    noFill();
    //fill(0,255,255,100);
    //fill(0, random(10, 255), random(10, 255), 0);
    ellipse(xPosition, yPosition, radius*2, radius*2);
     
    // Handles collisions with the canvas borders
     
    // Checks if the circle has reached the right or left border
    if(xPosition + deltaX > SCREEN_WIDTH-radius || xPosition + deltaX < radius) {
      // As a collision is inminent the circle should "bounce", to do so the opposite of the
      // angle (direction) is needed. e.g The opposite of 180 is 0.
      angle = MAX_ANGLE/2 - angle;
      calculateDelta();
   // Checks if the circle has reached the bottom or top border
    } else if (yPosition + deltaY > SCREEN_HEIGHT-radius || yPosition + deltaY < radius) {
      // As a collision is inminent the circle should "bounce", to do so the opposite of the
      // angle (direction) is needed. e.g The opposite of 90 is 270.
      angle = MAX_ANGLE - angle;
      calculateDelta();
    }
     
    // Sets the circle's position for the next update
    xPosition += deltaX;
    yPosition += deltaY;
  }
   
  /**
   * Method which calculates the deltas. The circle new position is calculated upon the
   * trigonometric functions.
   */
  void calculateDelta() {
     
    // Calculates the deltas based on the angle, as the angle is based on a clockwise direction
    // the trigonometric functions result are multiplied by -1.
    deltaY = -1 * speed * sin(radians(angle));
    deltaX = -1 * speed * cos(radians(angle));
  }
}



/*
 * Main program file
 */
 
//================================================================================
// Constants
//================================================================================
 
 
int SCREEN_WIDTH = 1000;
int SCREEN_HEIGHT = 300;
int CIRCLES_COUNT = 150;
int NEIGHBOR_DISTANCE = 80

;
 
//================================================================================
// Global Variables
//================================================================================
 
ArrayList<Circle> circlesCollection; // The collection of circles presented on the
                                     // canvas
 
//================================================================================
// Program's methods override
//================================================================================
 
/**
 * @see http://www.processing.org/reference/setup_.html
 */
void setup() {
   
  // Sets the canvas
  size(1000,300);
  noCursor();
  smooth();
   
  // Initializes the circles collection
  circlesCollection = new ArrayList<Circle>();
   
  // Populates the circles collection
  for(int i = 0; i < CIRCLES_COUNT; i++) {
    Circle circle = new Circle();
    circlesCollection.add(circle);
  }
}
 
/**
 * @see http://www.processing.org/reference/draw_.html
 */
void draw() {
   
  // As we are animating we must clean the canvas background
  // on every update cycle
  background(50);
   
  // Iterates backwards through the circles collection.
  for (int i=CIRCLES_COUNT-1; i >= 0; i--) {
     
    // Gets the circle
    Circle circle = circlesCollection.get(i);
     
    // Draws or updates the circle within the canvas
    circle.update();
     
    // Gets the position from the circle, in order to calculate its distance
    // with his neighbors
    float x1 = circle.xPosition;
    float y1 = circle.yPosition;
     
    // Iterates backwards through the circles posible neighbors.
    for(int j = i - 1; j >= 0 ; j --) {
       
      // Gets the circle posible neighbor
      Circle posibleNeighbor = circlesCollection.get(j);
       
      // Gets the position from the posible neighbor
      float x2 = posibleNeighbor.xPosition;
      float y2 = posibleNeighbor.yPosition;
   
      // Calculates the distance from the posible neighbor to the circle
      float distance = sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
       
      // Checks if the distance is less or equal to the min distance to be considered a neighbor
      if (distance <= NEIGHBOR_DISTANCE) {
        // As the possible neighbor is actually a neigbor a line should be drawn
        // within the two circles
       
        //stroke(100, 255, 0);
        strokeWeight(random(0.5, 3));
        stroke(random(100, 255), random(100, 255), 100);
        line(x1, y1, x2, y2);
      }
    }
  }
}

