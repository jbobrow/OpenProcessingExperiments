
float[] MousePositionsX;
float[] MousePositionsY;
int counter;
int numFrames = 5;
float angle;
float speed;

// DECLARE
Fluff[] myFluff;
void setup () {
  size (650, 650);

//INITIALIZE

//stating amount in array
  myFluff = new Fluff[1000]; 
  float circleX = width/2;
  float circleY = height/2;
  float radius = 10;

// registering 10000 mouse positions
  MousePositionsX = new float[10000]; 
  MousePositionsY = new float[10000];

//creating spiral formation
  for (int i =0; i<myFluff.length;i=i+1) { 
    float angle = map( i, 0, myFluff.length, 0, TWO_PI * 20);
    float circleOffX = cos(angle) * radius;
    float circleOffY = sin(angle) * radius;
    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

//placing fluff on points caluculated above
    myFluff[i] = new Fluff(x, y);
    radius = radius + 0.1;
  }
}

void draw () {
  background(255);
  pushMatrix();
  translate(width/2, height/2);

//linking mouse to counter
  MousePositionsX[counter] = mouseX;
  MousePositionsY[counter] = mouseY;

//
  if (counter > numFrames) {
    float deltaX = MousePositionsX[counter-numFrames]-MousePositionsX[counter];
    float deltaY = MousePositionsY[counter-numFrames]-MousePositionsY[counter];
    angle = atan2(deltaX, deltaY) * 180 / PI;
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
  float resolution = random(5, 9);
  float radius = 5;
  float circleX;
  float circleY;
  boolean movement = false;
  float newAngle;
  float newSpeed;
  float theX;
  float theY;
  float minSpeed;
  float maxSpeed;

  //constructor - how do i build this class
  Fluff (float theX, float theY) { // 
    circleX = theX;
    circleY = theY;
  }

  void display() {
    fill(0, 70);
    stroke(#ffffff);
    beginShape();
    for ( int i=0; i<resolution; i=i+1) {

      float waveAngle = map(i, 0, resolution, 0, TWO_PI* 16); // amount of resoltion 5- number of waves i want. 
      float waveOffset = sin(waveAngle) * 5; // 10 - have to scale it up as the value returned by the computer will be in the range of 1 pixel

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
    if (movement == true) {
      addGravity();
    }
  }


  void move() {
    minSpeed= 4; 
    maxSpeed =10;

    // if mouse is near enough
    if (abs(circleX-mouseX) < 16 && abs(circleY-mouseY) < 16) {
      //println("asdf");      
      movement = true;
      newSpeed = speed * 100;
      if ( newSpeed < minSpeed ) {
        newSpeed = minSpeed;
      }
      newAngle = angle;
    }
  
  //limit the speed to 7 per update
  if (newSpeed > maxSpeed) {
    newSpeed = maxSpeed;
  }
  
  //add friction
  newSpeed = newSpeed * 0.98;


  float moveX = sin(radians(newAngle+180))*(newSpeed);
  float moveY = cos(radians(newAngle+180))*(newSpeed);
  circleX+= moveX;
  circleY+= moveY;

  }


  void addGravity() {
    //
    circleY = circleY + 0.15;
    // ****************************************************************

  minSpeed= 1; 
  maxSpeed =4;
    if (abs(circleX-mouseX) < 10 && abs(circleY-mouseY) < 10) {
        movement = true;
        newSpeed = speed * 80;
        if ( newSpeed < minSpeed ) {
          newSpeed = minSpeed;
        }
        newAngle = angle;
      }
  
    //limit the speed to 7 per update
    if (newSpeed > maxSpeed) {
      newSpeed = maxSpeed;
    }
    //
    //add friction
    newSpeed = newSpeed * 0.98;

    //
    float moveX = sin(radians(newAngle+180))*(newSpeed);
    float moveY = cos(radians(newAngle+180))*(newSpeed);
    circleX+= moveX;
    circleY+= moveY;
  }
}



