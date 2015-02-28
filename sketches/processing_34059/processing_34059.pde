
// frame size
int frameWidth = 1400;
int frameHeight = 800;
// set the number limit of bubble.
Ripple[] myRipple = new Ripple[500]; //I'm going to make 1000 ripples at one screen
// set array index
int i = 0;
color bg = 0;
float r = random(255);
float g = random(255);
float b = random(255);

void keyPressed() { //changing colors 
  if (keyCode == ' ') {
    if (bg == 0) {
      bg = color(r, g, b);
      background(bg);
    }
    else if (bg != 0) {

      r = random(255);
      g = random(255);
      b = random(255);

      bg = color(r, g, b);
      background(bg);
    }
  }

  if (key == 'a') {
    for (int j = 0; j < myRipple.length; j++) {
      if (myRipple[j] != null) { //if inside the class
        myRipple[j].randomize();
      }
    }
  }
}

void setup() {
  size(frameWidth, frameHeight);
  background(bg);
  smooth();
  frameRate(15);
}


void draw() {
  //background(bg);
  if (mousePressed && i < myRipple.length) { //ball.length = 1000 balls on screen
    myRipple[i] = new Ripple(); //setting myBall as a new Ball class name 
    i = i + 1;
  }
  for (int j = 0; j < myRipple.length; j++) {
    if (myRipple[j] != null) { //if inside the class
      myRipple[j].move();
      myRipple[j].display();
    }
  }

  //  if (keyPressed) {
  //    saveFrame("thumbnail.jpg");
  //  }
}


class Ripple {//global variables
  color c;
  color c2;
  int xpos;
  int ypos;
  float rippleOut;
  float rippleSize;
  float strokeThick;
  float strokeThickrect;
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float t = random(255);

  float r2 = random(255);
  float g2 = random(255);
  float b2 = random(255);
  float t2 = random(255);


  Ripple() {//setup
    c = color(r, g, b, t);
    c2 = color(r2, g2, b2, t2);
    //    c = color(random(100,255));
    xpos = mouseX;
    ypos = mouseY;
    rippleSize = random(20);
    rippleOut = random(20);
    strokeThick = random(10); //stroke of the ball is random from 1-10
    strokeThickrect = random(30); // stroke of rectangle
  }

  void display() { //myRipple.display
    stroke(c);
    strokeWeight(strokeThick);
    //    fill(c2, t);
    fill(c2);
    ellipse(xpos, ypos, rippleSize, rippleSize);

    // rectangle border
    stroke(c);
    strokeWeight(strokeThickrect);
    noFill();
    //    fill(0,15);
    rect(0, 0, frameWidth, frameHeight);
  }

  void move() { //myRipple.move
    // set ripple growing limit
    // if ballsize is greater than 1/8th of framewidth or it is smaller than 10, increase/ decrease growing value
    if (rippleSize > frameWidth / 8 || rippleSize < 10) {
      rippleOut = rippleOut * (-1);
    }
    rippleSize = rippleSize + rippleOut;
  }

  void randomize() {
    println("hit it!!!!!"); //changedcolor;
    r = random(255);
    g = random(255);
    b = random(255);
    t = random(255);

    r2 = random(255);
    g2 = random(255);
    b2 = random(255);
    t2 = random(255);

    c = color(r, g, b, t);
    c2 = color(r2, g2, b2, t2);
  }
}


