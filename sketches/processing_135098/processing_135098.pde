
float[] MousePositionsX;
float[] MousePositionsY;
int counter;
int numFrames = 15;
float angle;
float speed;

// DECLARE
Fluff[] myFluff;
void setup () {
  size (800, 500);

  //INITIALIZE

  myFluff = new Fluff[700];
  float circleX = width/2;
  float circleY = height/2;
  float radius = 30;

  MousePositionsX = new float[10000];
  MousePositionsY = new float[10000];


  for (int i =0; i<myFluff.length;i=i+1) {
    float angle = map( i, 0, myFluff.length, 0, TWO_PI * 10);
    float circleOffX = cos(angle) * radius;
    float circleOffY = sin(angle) * radius;
    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

    myFluff[i] = new Fluff(x, y);
    radius = radius + 0.1;
  }
}

void draw () {
  background(255,45,68);
  pushMatrix();
  translate(width/2, height/2);

  MousePositionsX[counter] = mouseX;
  MousePositionsY[counter] = mouseY;

  if (counter > numFrames) {
    float deltaX = MousePositionsX[counter-numFrames]-MousePositionsX[counter];
    float deltaY = MousePositionsY[counter-numFrames]-MousePositionsY[counter];
    angle = atan2(deltaX, deltaY) * 360 / PI;
    speed = sqrt(sq(deltaX)*sq(deltaY));
  }
  counter++;
  popMatrix();
  // CALL FUNCTIONALITY


  for (int i =0; i<myFluff.length;i=i+1) {  //show fluff
    myFluff[i].display();
    myFluff[i].update();
  }
  
}

//global variables
class Fluff {
  float resolution = random(8, 16);
  float radius = 0.2;
  float circleX;
  float circleY;
  boolean movement = false;
  float newAngle;
  float newSpeed;
  float theX;
  float theY;

  //constructor - how do i build this class
  Fluff (float theX, float theY) { // 
    circleX = theX;
    circleY = theY;
  }

  void display() {
    fill(0, 80);
    stroke(#ffffff);
    beginShape();
    for ( int i=0; i<resolution; i=i+1) {

      float waveAngle = map(i, 0, resolution, 0, TWO_PI* 15); // amount of resoltion 5- number of waves i want. 
      float waveOffset = sin(waveAngle) * 10; // 10 - have to scale it up as the value returned by the computer will be in the range of 1 pixel

      float angle = map(i, 0, resolution, 0, TWO_PI); //calculating angle-  two Pi is equal to a full circle
      float circleOffX = cos(angle) *(radius - waveOffset);  // always use cos to calculate x angle
      float circleOffY = sin(angle) *(radius - waveOffset);

      float x = circleX + circleOffX; // circleX - centre of the shape, circleOffX shape edges, values in which it could move
      float y = circleY + circleOffY;

      vertex(x, y);
    }

    endShape(CLOSE);
  }


  void update() {
    move();
    keyPressed();
  }

  void move() {
    // if mouse is near enough
    if (abs(circleX-mouseX) < 5 && abs(circleY-mouseY) < 5) {
      //println("asdf");      
      if (movement == false) {
        movement = true;
        newSpeed = speed;
        newAngle = angle;
      }
    }

    if (movement == true) {
      float moveX = sin(radians(newAngle+180))*(newSpeed*.002+10);
      float moveY = cos(radians(newAngle+180))*(newSpeed*.002+10);
      circleX+= moveX;
      circleY+= moveY;
    }
  }
}



