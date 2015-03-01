
int diameter = 25;
int ydistance = diameter/2;
int xdistance = diameter/2;
int speed = 3;
int ydirection = 1;
int xdirection = 1;
int counter = 0;

void setup() {
  size(800, 600);
  background(50);
  fill(random(255), 150, 220);
}

void draw() {
  background(50);
  ellipse(xdistance, ydistance, diameter, diameter);

  rectMode(CENTER);
  rect(mouseX, height-100, 100, 10);

  //Move me
  ydistance += speed*ydirection;
  xdistance += speed*xdirection;

  //Did I hit the bottom?
  if (ydistance > height-diameter/2) {
    ydirection = -ydirection;
    println("I hit the bottom");
  }

  //Did I hit the top?
  if (ydistance < 0+diameter/2) {           
    ydirection = -ydirection;           
    println("I hit the top");
  }       

  //Did I hit the right side?       
  if (xdistance > width-diameter/2) {
    xdirection = -xdirection;
    println("I hit the right side");
  }

  //Did I hit the left side?
  if (xdistance < 0+diameter/2) {
    xdirection = -xdirection;
    println("I hit the left side");
  } 

  if ((mouseX+100 >= xdistance) && (xdistance >= mouseX-50) && (ydistance >= height-110) && (ydistance <= height-90)) {
    ydirection = -ydirection;
    println("You got me!");
    //if ((mouseX+100 >= xdistance) && (xdistance >= mouseX-50) && (ydistance >= height-110)){
    counter += 1;
    //}
  }
  
  if (counter >= 0) {
    textSize(18);
    text("SCORE: " + counter, 20, 30);
  }
}

//Q1: for the paddle to hit the ball on it's leftmost side, does mouseX-50 need to be used over mouseX?
//Q2: how to make the score count only when the ball hits from the top?

