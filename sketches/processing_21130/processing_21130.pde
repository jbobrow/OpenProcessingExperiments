
// we have a new data type -- a Circle
// see the "class" definition at the bottom 
Circle c;

//========================================================
void setup() {
  size(300, 300);
  smooth();
  fill(255, 91, 0);
  stroke(255);
  strokeWeight(3);
  // create a new Circle object and put it in a variable 
  c = new Circle(width/2, height/2, 50);
}

//========================================================
void draw() {
  background(132, 0, 46);

  // the code for drawing and moving the circle are now 
  // methods (ie: functions) of the Circle class 
  c.display();
  c.move();
}

//========================================================
// Representing the concept of a circle in our program
// using a class 

class Circle {

  // this is what defines a Circle
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
  }
} // end of Circle class




