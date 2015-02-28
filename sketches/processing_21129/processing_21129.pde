
// we have a new data type -- a Circle
// see the "class" definition at the bottom 
Circle c;

//--------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  fill(255, 91, 0);
  stroke(255);
  strokeWeight(3);
  // create a new Circle object and put it in a variable 
  c = new Circle(width/2, height/2, 50);
}

//--------------------------------------------------------
void draw() {
  background(132, 0, 46);

  // right now, the implementation is the same as in the 
  // previous example, except we are using the variables
  // contained in the Circle object 'c' instead of global
  // variables 

  // draw the circle
  ellipse(c.x, c.y, c.radius*2, c.radius*2);

  // move the circle
  c.x = c.x + c.speedX;
  c.y = c.y + c.speedY;

  // bounce! 
  if ( c.x > (width-c.radius) || c.x < c.radius ) {
    c.speedX = c.speedX * -1;
  }
  if ( c.y > (height-c.radius) || c.y < c.radius ) {
    c.speedY = c.speedY * -1;   
  }
}

//--------------------------------------------------------
// Representing the concept of a circle in our program
// using a class 

class Circle {
  
  // this is what defines a Circle -- some variables
  // each Circle we create will have one of each:
  float x;
  float y;
  float speedX;
  float speedY;
  float radius;
  
  // This is a special function called the Constructor. 
  // It is invoked when we use the "new" keyword
  Circle( float x, float y, float radius ) {
    // store the values of the parameters into the matching object 
    // variables
    this.x = x;
    this.y = y;
    this.radius = radius;
    
    // lets say speed is always random:
    this.speedX = random(-2, 2);
    this.speedY = random(-2, 2);
  }
  
} // end of Circle class

