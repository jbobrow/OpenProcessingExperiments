
/*
 * Taller Programación MDI Veritas
 * Tarea#2
 * Crear un diseño o dibujo que utilice los números de Fibonacci. 
 * Pueden utilizar cualquiera de los dos ejemplos de base. 
 * EL primero simplemente muestra como se calculan los números de Fibonacci, 
 * el segundo juega con ellos
 */

/**
 * Main program file
 *
 * @author Paula Chavarría
 * @since 21/2/14
 * @version 0.1
 */

//================================================================================
// Constants
//================================================================================

float BASE_UNIT = 5;

//================================================================================
// Global Variables
//================================================================================

PVector center = new PVector(width/2, height/2); //Point for the canvas center

//================================================================================
// Program's methods override
//================================================================================

/**
 * @see http://www.processing.org/reference/setup_.html
 */
void setup() {
  
  // Sets the canvas
  size(500,500);
  smooth();
  
  // Sets the center vector
  center = new PVector(width/2, height/2);
  
  // Draws the trapezoids according the fibonnacci number
  for(int i=3; i<30;i++){
    drawTrapezoid(i);
  }
}

//================================================================================
// Drawing operations
//================================================================================

/**
 * Method which draws a trapezoid
 * @param n Number in which the size is based on
 */
void drawTrapezoid(int n){

  PVector p1, p2, p3, p4;
  float a = 0;
  float trapezoideBase = BASE_UNIT * fib(n)-20; // Additional 20 px are added 
                                                // to give the chevron effect
  float trapezoideSide = BASE_UNIT * fib(n-1);
  
  // Sets a trapezoid as a guide in vertical position
  float trapezoideHeight = sqrt(pow(trapezoideSide,2)+pow(trapezoideSide/2,2));
  float horizontalCenter = width/2-(trapezoideHeight/2);
  float verticalCenter = height/2-(trapezoideBase/2)-(trapezoideSide/4);
  
  p1 = new PVector(horizontalCenter, verticalCenter+trapezoideSide/2);
  p2 = new PVector(horizontalCenter+trapezoideHeight, verticalCenter);
  p3 = new PVector(horizontalCenter+trapezoideHeight,verticalCenter+trapezoideBase);
  p4 = new PVector(horizontalCenter, verticalCenter+trapezoideBase+trapezoideSide/2);
  
  // Checks if the trapezoid should be rotated
  if(n!=3){
    a = (n-3)*67.5;
  } else {
    a = 0;
  }
    
  // Create a set of vectors relative to vector'center'
  p1 = PVector.sub(p1, center);
  p2 = PVector.sub(p2, center);
  p3 = PVector.sub(p3, center);
  p4 = PVector.sub(p4, center);
   
  // Rotates the trapezoid points
  p1 = rotatePoint(p1, a);
  p2 = rotatePoint(p2, a);
  p3 = rotatePoint(p3, a);
  p4 = rotatePoint(p4, a);

  // Re-allocates the points according to the center
  p1.add(center);
  p2.add(center);
  p3.add(center);
  p4.add(center);

  // Draws the trapezoid
  stroke(34,79,50,25);
  noFill();
  fill(34,79,50,255/n);
  quad(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);

  // Rotates the entire canvas
  pushMatrix();
  translate(center.x, center.y);
  rotate(a);
  popMatrix();
  
}

//================================================================================
// Math operations
//================================================================================

/**
 * Method which calculates the fibonnacci of a given number
 * @param n The number whose fibonnacci will be computed
 */
long fib(int n) {
  if (n <= 1) return n;
  else return fib(n-1) + fib(n-2);
}

/**
 * Method which rotates a point in a canvas
 * @param n The point which will be rotated
 * @param n The rotation angle
 */
PVector rotatePoint(PVector point, float rotation) {
    PVector rotatedPoint = new PVector();
    float angle  = radians(rotation);
    rotatedPoint.x = (cos(angle) * point.x) - (sin(angle) * point.y);
    rotatedPoint.y = (cos(angle) * point.y) + (sin(angle) * point.x);
    return rotatedPoint;
  }




