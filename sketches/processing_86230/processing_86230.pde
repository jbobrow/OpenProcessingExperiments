
int numOfBalls = 100;
Ball[] bunchOfBalls = new Ball[numOfBalls]; // Determine Ball Array.
int totalNumOfBallsColored = 0;
Curtain mouseCurtain = new Curtain();

// ____________________________________________________________
void setup() {
  size(1200,600);
  background(100);
  // Fill in Array Positions with created Ball Objects.
  for ( int index = 0; index < bunchOfBalls.length; index++ ) {
    bunchOfBalls[index] = new Ball(); // Use Default Ball Constructor.
  }

} // End of setup()

// ____________________________________________________________
void draw() {
  
  background(100);
  
  mouseCurtain.display();
  
  // Move all the balls inside of Array.  
  for ( int index = 0; index < bunchOfBalls.length; index++ ) {
    bunchOfBalls[index].display();
    bunchOfBalls[index].moveObject();
  }
  
  // Any of the balls jumps if touched to Screen Edges.
  for ( int index = 0; index < bunchOfBalls.length; index++ ) {
    bunchOfBalls[index].jump(mouseCurtain);    // if touches the black mouse drawen curtain
    bunchOfBalls[index].jump();                // if touches the edges of screen.

  }

} // End Of draw()


class Ball {

// Instance Variables
public float x, y, ballRad, ballDiam;
private float speedX, speedY;
public float colorValue, originalColor;
  
  
// Constructor
  Ball() {  
    ballRad = random(10,50);
    ballDiam = 2 * ballRad;
    x = random(0,width);
    y = random(0,height);
    
    speedX = random(0, 10);
    speedY = random(0,10);  
    colorValue = 255;
    originalColor = colorValue;   // Keep track of randomly created color value inside another variable.
  }
  
// Object Methods
  void display() {
    stroke(127);
    ellipse( x, y, ballDiam, ballDiam );
  }
  
  void moveObject() {
    x += speedX;
    y += speedY;
  }
 
  boolean intersect(Ball ballObject) { 
    boolean result = false;
    // if distance between balls center coordinates is equal to or less than sum of balls radiuses, this means they intersect.
    if ( dist( x, y, ballObject.x, ballObject.y ) <= ballRad + ballObject.ballRad ) {
      result = true;
    }
    return result;  
  }

  void jump() {
    if ( y < ballRad ) {                     // if Ball touches Top of Screen , change SpeedY direction
      y = ballRad;
      speedY *= -1;
    } else if ( y > height - ballRad ) {     // if Ball touches Bottom of Screen, change SpeedY direction
      y = height - ballRad;
      speedY *= -1; 
    } else if ( x < ballRad ) {              // if Ball touches Left side Of Screen, change SpeedX direction
      x = ballRad;
      speedX *= -1;
    } else if ( x > width - ballRad ) {    // if Ball touches Right side of Screen, change SpeedX direction
        x = width - ballRad;
        speedX *= -1;
    }
    
  }
  
  void jump(Curtain tempCurtain) {
    if ( x <= tempCurtain.x + ballRad ) {
      x = tempCurtain.x + ballRad;
      speedX *= -1;
    }  
  }
  
} // END OF CLASS
 
class Curtain {
  
  public float x, topY, bottomY;
  
  // Constructor
  Curtain() {
    x = 0;
  }
  
  void display() {
    
    x = mouseX;
    fill (50);
    rectMode(CORNER);
    rect(0, 0, x, height);
  }
  
  
} // End of Class


