
/*
 * Creative Coding
 * Week 5, 04 - Moving balls 2
 *
 * Click to add more streaks of balls
 *
 * select number of directions by pressing numbers 1-9
 * press c to clear
 *
 */
MovingBall centre;
MovingBall[] arounds;

int chosenNum;

int numOfObjects;

  int hue = 0;


void setup() {
  size(600, 600);
  
  colorMode(HSB);

  numOfObjects = 10;
  chosenNum = 3;

  centre = new MovingBall(width/2, height/2);
  
  arounds = new MovingBall[numOfObjects];
  
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(random(mouseX - 50 , mouseX + 50 ), random(mouseY - 50 , mouseY + 50 ) );
  }



  background(0);
}

void draw() {
  // background(0);

  centre.run();
  
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i].run();
  }


}
// change number of directions and clear 
void  keyPressed() {
    if (key == '1')
    {
      chosenNum = 1;
    }
    if (key == '2')
    {
      chosenNum = 2;
    }
    if (key == '3')
    {
      chosenNum = 3;
    }
    if (key == '4')
    {
      chosenNum = 4;
    }
    if (key == '5')
    {
      chosenNum = 5;
    }
    if (key == '6')
    {
      chosenNum = 6;
    }
    if (key == '7')
    {
      chosenNum = 7;
    }
    if (key == '8')
    {
      chosenNum = 8;
    }
    if (key == '9')
    {
      chosenNum = 9;
    }
    
    // reset background to black
    if (key == 'c' || key == 'C' )
    {
      background(0);
    }
}

void  mouseClicked() {  
  

  
  for (int i=0; i < arounds.length; i++ ) {
    arounds[i] = new MovingBall(random(mouseX - 50 , mouseX + 50 ), random(mouseY - 50 , mouseY + 50 ) );
  }


}
  
/*
 * MovingBall class
 *
 * Represents a moving ball that moves in a single direction
 *
 */
class MovingBall {

  float x, y;        // position
  float tx, ty;      // target in x and y
  float step, inc;
  float radius;

  

  int direction;

  // constructor
  // create a moving ball at the supplied position (x_, y_)
  MovingBall(float x_, float y_) {
    x = x_;
    y = y_;
    
    hue = hue + 3;
    hue = hue % 250;
    //hue = int(random(255));

    reset();
  }
  
  // run
  // calls move() followed by display()
  // 
  void run() {
    this.move();
    this.display();
  }

  // move
  // move the ball in the desired direction
  //
  void move() {

    step -= inc;

    if (step < 0) {
      x = tx;
      y = ty;
      reset();
    }

    x = lerp(tx, x, step); 
    y = lerp(ty, y, step);

    checkBounds();
  }

  // checkBounds
  // checks that the ball is within the display window.
  // If it reaches the edge, move in the opposite direction
  void checkBounds() {
    if (x <= 0 || x >= width || y <= 0 || y >= height) {
      x = width/2;
      y = height/2;
      reset();
    }
  }


  void reset() {
    step = 1;
    inc = random(0.01);
    radius = random(10, 50);
    int numDirections = chosenNum;
    float angleUnit = TWO_PI/numDirections; 
    direction = (int) random(numDirections);

    tx = x + radius*cos(direction * angleUnit);
    ty = y + radius*sin(direction * angleUnit);
  }

  // display method
  //
  //
  void display() {
    noStroke();
    rectMode(CENTER);
    fill(0, 30);
    rect(tx, ty, 10, 10);
    fill(hue, 255,255, 60);
    ellipse(x, y, 3, 3);
  }
}



