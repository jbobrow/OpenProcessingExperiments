
// random number for number of circles in the animation
int numofcirc= int (random (100, 200)); //random must be converted to integer to be used with the moving circle function

// variable define where animation will begin
// if startposition=1, circles begin in random position
// if startposition=2, circles begin in the center of the window 
int startposition = 1;

//Circle Animation 

MovingCircle[] CircleAnimation = new MovingCircle [numofcirc] ; //number of circles

void setup() {
  size (700, 650);
  frameRate (65);


  for (int i=0; i<CircleAnimation.length; i++) {
  if (startposition == 1)
  {
    CircleAnimation[i] = new MovingCircle(random (700), random (600), random (5, 15)); // starts circles at random positions
  }
  if (startposition == 2)
  {
  CircleAnimation[i] = new MovingCircle(width/2, height/2, random (5, 15)); // starts circles in the middle of the window
  }
  }
}




 void draw() {
  background(0);

  // array of circles
  for (int i=0; i<CircleAnimation.length; i++) {

    CircleAnimation[i].update();
    CircleAnimation[i].checkCollisions();
    CircleAnimation[i].drawCircle();
  }
  // displays framerate
  
  fill(255);
  text(frameRate,20,20);
  
}

class MovingCircle {

  float x;
  float y;
  float xSpeed;
  float ySpeed;

  float circleSize;

  MovingCircle(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;


    xSpeed = random(-10, 10);
    ySpeed = random(-10, 10);
  }

  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  void checkCollisions() {

    float r = circleSize/2;

    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    } 

    if ( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }
  }
  float color1= int (random (255));
  float color2= int (random (255));
  float color3= int (random (255));

  void drawCircle() {

    fill(color1, color2, color3);
    ellipse(x, y, circleSize, circleSize);
  }
}



