
// Integrates the circle intersection code to our class 
// so that we can detect when two circle objects intersect

Circle oneCircle;
Circle anotherCircle;

//=======================================================================
void setup() {
  size(300, 300);
  smooth();
  fill(255);
  noStroke();
  // create a new Circle object and put it in a variable 
  oneCircle = new Circle(random(width), random(height), 50);
  // create another one with a different size and color 
  anotherCircle = new Circle(random(width), random(height), 60);
}

//=======================================================================
void draw() {
  background(64);
  
  // we now have two Instances of the Circle class. They are separate
  // objects and each represent a Circle with the variables and methods 
  // that come with the package

  if (oneCircle.intersects(anotherCircle)) {
    fill(33, 64);
    stroke(255);
    strokeWeight(2);
    line(oneCircle.x, oneCircle.y, anotherCircle.x, anotherCircle.y);
  }
  else {
    noStroke();
    fill(255, 128);  
  }

  // draw and move the first one  
  oneCircle.display();
  oneCircle.move();

  // draw and move the other
  anotherCircle.display();
  anotherCircle.move();
}

//========================================================
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

  //---------------------------------------------------
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

  //---------------------------------------------------
  void display() {
    // draw the circle
    ellipse(this.x, this.y, this.radius*2, this.radius*2);
  }

  //---------------------------------------------------
  void move() {
    // move the circle
    this.x = this.x + this.speedX;
    this.y = this.y + this.speedY;

    // bounce! 
    if ( this.x > (width-this.radius) || this.x < this.radius ) {
      this.speedX = this.speedX * -1;
    }
    if ( this.y > (height-this.radius) || this.y < this.radius ) {
      this.speedY = this.speedY * -1;
    }

    // make sure x and y stay within a certain area
    // this will prevent the "sticking" effect which happens when 
    // the speed is too small 
    this.x = constrain(this.x, this.radius, width-this.radius);
    this.y = constrain(this.y, this.radius, height-this.radius);    
  }

  //---------------------------------------------------
  // Checks if this circle intersects with another 
  boolean intersects(Circle other) {
    float d = dist(this.x, this.y, other.x, other.y);
    if ( d < (this.radius + other.radius) ) {
      return true;
    }
    else {
      return false;
    }
  }
} // end of Circle class

                
