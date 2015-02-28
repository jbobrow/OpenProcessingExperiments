
int NUM_OF_ASTEROIDS = 8;

Asteroid[] asteroids = new Asteroid [NUM_OF_ASTEROIDS];
Vect2D[] vels = new Vect2D[NUM_OF_ASTEROIDS];
SpaceShip ship;
boolean collision;

public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);
  
  stroke(255,0,0);
  strokeWeight(2);
  smooth();
  
  collision = false;
  
  //create a spaceship 
  ship = new SpaceShip(width/2,height/2,10);
  
  // create some rocks
  // half of the asteroids appear on the left and half on the right
  for (int i = 0; i < NUM_OF_ASTEROIDS; i++) {
    if (i%2 == 0) {
      asteroids[i] = new Asteroid(0, random(height), 10);
      float down = random(-5,5);
      float vAccross = random(-5,5);
      vels[i] = new Vect2D(vAccross,down);
    } else {
      asteroids[i] = new Asteroid(width, random(height), 10);
      float down = random(-5,5);
      float vAccross = random(5,5);
      vels[i] = new Vect2D(vAccross,down);
    }    
  }
  
}

void draw() {
  
  //if the ship has not been hit move things
  if (collision == false) {
  
    //rotate ship round and round
    ship.rotateShip(random(-10,2));
    background(0);
    ship.buildShip();
    ship.drawShip();
  
    //check if asteroids are bouncing off the walls or hitting the ship
    for(int i=0; i<NUM_OF_ASTEROIDS; i++) {
      asteroids[i].moveAsteroid(vels[i]);
      checkBoundaryCollision(i);
      checkShipCollision(i);
    }
  } else {
    //explode stuff
    background(random(0,100),0,0);
    for(int i=0; i<NUM_OF_ASTEROIDS; i++) {
      asteroids[i].radius++;
      if (asteroids[i].radius > 70) {
        setup();
      }
      ship.bigness++;
      ship.buildShip();
      ship.drawShip();
      ship.rotateShip(random(-1,10));
      asteroids[i].buildAsteroid();
      asteroids[i].drawAsteroid();
    }
  }
}
// Asteroid Object ----------------------------------------
class Asteroid {
  
  float x, y;
  float radius;
  float[][] points = new float [7][2];
  
  Asteroid() {
  }
  
  Asteroid (float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    buildAsteroid();
  }
  
  void drawAsteroid() {
    for (int i = 0; i < 7; i++)
    {
      if (i > 0) {
        line(points[i][0],points[i][1],points[i-1][0],points[i-1][1]);
      }
    }
    line(points[0][0],points[0][1],points[6][0],points[6][1]);
 }
 
  void buildAsteroid()
  {
    //draw wiggly circle
    float drawX,drawY,radiusNoise;
    float rad; 
    int i = 0;
    int j = 0;
    
    for (int ang = 0; ang <= 360; ang+=60) {
     rad = radians(ang);
     radiusNoise = noise(random(0.8,11.3));
     //I set this to one because the randomly drawn shapes were a bit naff when it came to collision detection
     radiusNoise = 1;
     //draws points along a circle
     drawX = x + radiusNoise*(radius * cos(rad));
     drawY = y + radiusNoise*(radius * sin(rad));
     points[i][j] = drawX;
     points[i][j+1] = drawY;
     i++;      
    }
  }
  
  void moveAsteroid(Vect2D vect) {
    float vx = vect.vx;
    float vy = vect.vy;
    x += vx;
    y += vy;
    
    for (int i = 0; i < 7; i++)
    {
        points[i][0] += vx;
        points[i][1] += vy;
    }
    drawAsteroid();
  }
}

// Vector Object -----------------------------------------
// Corresponds to a asteroid object probably could have being incorporated in it and
// saved me quite a bit of typing
class Vect2D {
  float vx,vy;
  
  Vect2D() {
  }
  
  Vect2D(float vx, float vy) {
    this.vx = vx;
    this.vy = vy;
  }
}

// Bouncing off wall detector ---------------------------  
void checkBoundaryCollision(int i) {
  
  Asteroid asteroid = asteroids[i];
  Vect2D vel = vels[i];
   if (asteroid.x > width - asteroid.radius) {
    asteroid.x = width - asteroid.radius;
    vel.vx *=-1;
    } 
  else if (asteroid.x < asteroid.radius) {
    asteroid.x = asteroid.radius;
    vel.vx *= -1;
    }
  else if ( asteroid.y > height - asteroid.radius) {
    asteroid.y = height-asteroid.radius;
    vel.vy *= -1;
    }
  else if ( asteroid.y < asteroid.radius) {
   asteroid.y = asteroid.radius;
   vel.vy *= -1;
   }
  
  asteroids[i] = asteroid;
  vels[i] = vel;
}


// Ship into rock detector ---------------------------------------
void checkShipCollision(int i) {
  float asteroidDistance = dist(ship.x,ship.y,
                                    asteroids[i].x,asteroids[i].y);
  
  if (asteroidDistance < ship.bigness)
    collision = true;
}

// Bouncing off each other detector -------------------------------
// This isn't actually used as the performance was a bit ropey in terms
// of things not being detected properly, I left it here in case anybody
// wanted to fix it.
void checkObjectCollision() {
  float asteroidDistance;
  
  
  for(int i=0; i<NUM_OF_ASTEROIDS;i++) {
    for (int j = 0; j < i; j++) {
      if (j != i) {
        asteroidDistance = dist(asteroids[i].x,asteroids[i].y,
                                    asteroids[j].x,asteroids[j].y);
                             
        if (asteroidDistance < asteroids[i].radius + asteroids[j].radius) {
          Vect2D vTemp = new Vect2D();
          vTemp.vx = vels[i].vx;
          vels[i].vx = vels[j].vx;
          vels[j].vx = vTemp.vx;
        }
      }
    }
  }
}

// An asteroid style spaceship -----------------------------------

class SpaceShip {
 
 float x,y;
 float bigness;
 float [][] points = new float[3][2];
 float angle;
 
 SpaceShip() {
 }
 
 SpaceShip(float x, float y, float bigness) {
   this.x = x;
   this.y = y;
   this.bigness = bigness;
   angle = 0;
 }
 
 void buildShip() {
   float drawX, drawY;
   drawX = x + bigness*cos(radians(0+angle));
   drawY = y + bigness*sin(radians(0+angle));
   points[0][0] = drawX;
   points[0][1] = drawY;
   drawX = x + bigness*cos(radians(120+angle));
   drawY = y + bigness*sin(radians(120+angle));
   points[1][0] = drawX;
   points[1][1] = drawY;
   drawX = x + bigness*cos(radians(240+angle));
   drawY = y + bigness*sin(radians(240+angle));
   points[2][0] = drawX;
   points[2][1] = drawY;
 }
 
 void drawShip() {
   line(points[0][0],points[0][1],points[1][0],points[1][1]);
   line(points[1][0],points[1][1],x,y);
   line(x,y,points[2][0],points[2][1]);
   line(points[2][0],points[2][1],points[0][0],points[0][1]);
 }
 
 void rotateShip(float angle) {
   this.angle += angle;
   buildShip();
   drawShip();
 }
 
 void moveShip(float vx, float vy) {
   x += vx;
   y += vy;
 }
 
} 


