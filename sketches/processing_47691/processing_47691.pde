
/*cipher version by al.x*/

ArrayList robotNum = new ArrayList();

float align = 10;
float avoid = 5;
float falloff = 0.5;

float robots = 800;


//--------------------------------------------SETUP

void setup() {
  size(200, 460, P2D);
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();


  for (int i = 0; i < robots; i ++) {

    PVector loc = new PVector(random(width), random(height), 0);    
    PVector vel = new PVector(random(-1, 1), random(-1, 1), 0);

    float s = 2;
    int c = 170;


    Robot AI = new Robot(loc, s, c, vel);
    robotNum.add(AI);
  }
}



//--------------------------------------------DRAW

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);

  for (int i = 0; i < robotNum.size(); i ++ ) {
    Robot AI= (Robot)robotNum.get(i);
    AI.run();
  }
}



class Robot {

  PVector location;
  PVector velocity;

  float robotSize;
 
  float robotColor = 280;
  //float robotColor2 = 0;
  float transparency = 50;
  float colorchange = 30;
  float sizechange = 0.2;


  //--------------------------------------------CLASS CONSTRUCTOR

  Robot (PVector LOCATION, float ROBOTSIZE, int ROBOTCOLOUR, PVector VELOCITY) {

    location = LOCATION;
    robotSize = ROBOTSIZE;
    velocity = VELOCITY;
  }

//--------------------------------------------CLASS FUNCTIONS
  void run() {
    render();
    updatePos();
    flock();
  }


//------------------------------------------------------------
  void render() {

    robotColor = robotColor+ colorchange;
    //robotColor2 = robotColor2+ change;

    if (robotColor> 359) {
      colorchange = -1.5;
      //robotColor = 250;
      //robotColor = robotColor - change ;
      //robotColor2 += robotColor2 ;
    }

    if (robotColor< 280) {
      colorchange = +1.5;
      //robotColor = 170;
      //robotColor = robotColor + change ;
      //robotColor2 -= robotColor2 ;
      //robotColor += robotColor;
   }
//if (robotColor<170 || robotColor>250){
  //robotColor *= -1;
//}

    fill(robotColor, 100, 100, transparency);
    ellipse (location.x, location.y, robotSize, robotSize/2);
  }


//------------------------------------------------------------
  void updatePos() {
    
    location.add(velocity);

    if (location.x < 0) {
      location.x = width;
    }

    if (location.x > width) {
      location.x = 0;
    }

    if (location.y < 0) {
      location.y = height;
    }

    if (location.y > height) {
      location.y = 0;
    }
  }


//------------------------------------------------------------
  void flock() {
    float minDist = 1000000;
    
    for (int i = 0; i <robotNum.size(); i++) {
      Robot AI = (Robot) robotNum.get(i);
      float robotDist = location.dist(AI.location);

      if (robotDist > 0) {
        if (robotDist < minDist) {
          minDist = robotDist;
        }
        
        if (robotDist < align) {
          PVector addVec = AI.velocity.get();
          addVec.mult(falloff/robotDist);
          velocity.add(addVec);
          velocity.normalize();
          robotSize = robotSize-0.05;
        }

        if (robotDist < avoid) {
          PVector addVec = AI.location.get();
          addVec.sub(location);
          addVec.mult(falloff/robotDist);
          velocity.sub(addVec);
          velocity.normalize();
        }
      }
    }

    robotSize+= sizechange;


    if (robotSize < 2) {
      robotSize = 2;
      //sizechange = +0.1;
    }

    if (robotSize > 10) {
      robotSize = 10;
      //sizechange = -0.1;
    }
  }
}


