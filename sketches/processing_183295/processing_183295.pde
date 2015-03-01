
// CONSTANTS
// =========
// Constants for X, Y, and Z to make code more readable when
// storing XYZ coordinates in a var[]
final int x = 0;
final int y = 1;
final int z = 2;

// SETTINGS
// ========
int canvasWidth = 600;
int canvasHeight = 800;
// Clouds are made up of "balls" (tee-hee)
int minNumberOfBalls = 12;
int maxNumberOfBalls = 14;
float minBallRadius = 30;
float maxBallRadius = 70;
float minBallOverlapPercentage = 0.32f; // Golden ratio FTW
float maxBallOverlapPercentage = 0.68f;
float timestep = 0.005;
float startingPositionX = 100;
float startingPositionY = 100;
float startingPositionZ = -100;
float endingPositionX = canvasWidth - startingPositionX;
//float endingPositionY = startingPositionY;
//float endingPositionZ = startingPositionZ;
int minDarkness = 120;

// Objects
Cloud cloud;

void setup() {
  size(canvasWidth, canvasHeight, P3D);
  cloud = new Cloud();
  noStroke();
}

void draw() {
  background(#1199CC);
  lights();
  cloud.draw();
}

void respawnCloud() {
  cloud = new Cloud();
}

class Cloud {
  // Properties
  // ==========
  int numberOfBalls;
  float maturity; // 0 = new cloud, 1 = time to rain
  float[] position = new float[3];
  float scaleRatio = 1;
  boolean isRespawning = true;
  boolean isAtStartingPoint = true;
  
  // Objects
  Ball[] balls;
  
  Cloud () {
    print("Beginning condensation\n");
    maturity = .5; // Clearly, if we're talking about balls
    resetPosition();
    numberOfBalls = (int)random(minNumberOfBalls, maxNumberOfBalls);
    balls = new Ball[numberOfBalls];
    balls[0] = new Ball(this, true, null);
    for(int ballIndex = 1; ballIndex < numberOfBalls; ballIndex ++) {
      balls[ballIndex] = new Ball(this, false, balls[0]);
    }
  }
  
  void draw() {
    translate(position[x], position[y], position[z]);
    
    maturity += timestep * ((isRespawning) ? -1 : 1);
    if(isRespawning){
      scaleRatio = abs(maturity - .5f) / .5f;
      // Can't just test scaleRatio for zero because it might skip 0 given timestep
      if (maturity <= .5f && !isAtStartingPoint) {
        respawnCloud();
      };
      rotate(TWO_PI * scaleRatio, 0, 1, 0); 
      scale(scaleRatio, scaleRatio, scaleRatio);
    } else {
      // Move
      position[x] = startingPositionX + maturity * (endingPositionX - startingPositionX);
      isAtStartingPoint = false;
      // Rotate
      rotate(TWO_PI * maturity * 3, 0, 1, 0); 
    }
    
    if((maturity >= 1 && !isRespawning) || (maturity <= 0 && isRespawning)) {
      isRespawning = !isRespawning;
      if (isRespawning) {
        print("Raining!\n");
      } else {
        print("Being blown away\n");
        print("Collecting more moisture\n");
      }
    }
    
    for(int ballIndex = 0; ballIndex < numberOfBalls; ballIndex ++) {
     balls[ballIndex].draw(); 
    }
  }
  
  void resetPosition() {
    isAtStartingPoint = true;
    position[x] = startingPositionX;
    position[y] = startingPositionY;
    position[z] = startingPositionZ;
  }
}

class Ball {
  // Properties
  // ==========
  float[] offset = new float[3];
  float radius;
  Ball mainBall;
  Cloud cloud;
  
  Ball (Cloud _cloud, boolean isMainBall, Ball _ball) {
    radius = random(minBallRadius, maxBallRadius);
    cloud = _cloud;
    
    if (isMainBall) {
      for(int xyz = x; xyz <= z; xyz ++) {
        offset[xyz] = 0;
      }
    } else {
      mainBall = _ball;
      
      for(int xyz = x; xyz <= z; xyz ++) {
        float offsetBase = mainBall.offset[xyz] + mainBall.radius + radius;
        float myMinOffset =  offsetBase - (maxBallOverlapPercentage * mainBall.radius);
        float myMaxOffset =  offsetBase - (minBallOverlapPercentage * mainBall.radius);
        offset[xyz] = random(myMinOffset, myMaxOffset) / 2;
        if ((xyz == z) || (random(0,1) > 0.5f)) offset[xyz] *= -1;
      }
    }
  }
  
  void draw() {
    pushMatrix();
    int brightness = 255 - (int)(255 * cloud.maturity - minDarkness / 255);
    fill(brightness, brightness, brightness);
    translate(offset[x], offset[y], offset[z]);
    sphere(radius);
    popMatrix();
  }
}
