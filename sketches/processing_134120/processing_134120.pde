
// crashCourse processing by Corneel Cannaerts 2014
// arraylist, classes & tabs

// just like an array an ArrayList can store a number of variables
// the advantage of an ArrayList is thta it does not have a fixed length
// see reference for more info:http://www.processing.org/reference/ArrayList.html

// classes gropup a number of variables and functions
// they like a blue-print for objects
// see reference for more info: http://www.processing.org/reference/class.html

// if the code becomes to long its is a godd practice to split it in different tabs
// click the trangle to add, rename, remove or navigate through tabs

// flags <> can used to specify a datatype for the arraylist in this case Ball
ArrayList<Ball> balls;

void setup() {
  background(0);
  size(800, 400);
  noStroke();
  // initialize arraylist with new ArrayList()
  balls = new ArrayList();
  //use .add() to add variable to the arraylist
  for (int i=0; i<300; i++) {
    Ball temp = new Ball(random(width), random(height), random(20, 80), random(-15, 15), random(-15, 15));
    balls.add(temp);
  }
}

void draw() {
  background(0);
  fill(0, 5);
  rect(0, 0, width, height);
  // if you use flags, you can use this sytax to loop trough all variables in an ArrayList()
  for (Ball b: balls) {
    b.update();
  }
}



class Ball {
  float x;
  float y;
  float r;
  float speedX;
  float speedY;

  Ball(float _x, float _y, float _r, float _speedX, float _speedY) {
    x = _x;
    y = _y;
    r = _r;
    speedX = _speedX;
    speedY = _speedY;
  }
  void render() {
    fill(10,random(100,240),random(200,240),20);
    ellipse(x, y, r*1.25, r*1.25);
    fill(0,240);
    ellipse(x, y, r*0.75, r*0.75);
  }
  void update() {
    move();
    bounce();
    render();
  }
  void move() {
    x = x + speedX;
    y = y + speedY;
  }
  void bounce() {
    if (x > width) {
      speedX = -speedX; 
      x = width;
    }
    if (x < 0) {
      speedX = -speedX;
      x = 0;
    }
    if (y > height) {
      speedY = -speedY;
      y = height;
    }
    if (y < 0) {
      speedY = -speedY;
      y=0;
    }
  }
}


