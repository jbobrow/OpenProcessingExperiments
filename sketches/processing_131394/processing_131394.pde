
/* Jellyfish (Spring 2014, Nature of Code, Wk1 Assignment)
 *
 *   Circles moving like jellyfish(not really though)
 *   Jellyfish floats in the space; Perlin-noisy wind and gravity are individually applied
 *   Sometimes, jellyfish soars up
 *   Moving distance and the frequency of movement are decided by normal distribution
 *   Size of the circle is proportional to the mean value of the jellyfish
 *
 * Jaewoong Hwang
 */


import java.util.Random;

ArrayList<Jellyfish> school;
int numJellyfish = 27;    //number of total Jellyfish

void setup() {
  size(200, 500);
  
  //make Jellyfish and add it to school
  school = new ArrayList();
  for(int i = 0; i < numJellyfish; i++) {
    Jellyfish j = new Jellyfish(random(width), random(height), random(30, 80), 1.0);
    school.add(j);
  }
}


void draw() {
  fill(155, 155, 0, 55); noStroke(); rect(0, 0, width, height);

  for(Jellyfish j : school) {
    j.update();
    j.render();
  }
}


class Jellyfish {
  float x, y;          //position
  Random generator;    //normal distribution random number generator
  float mean, sigma;   //mean and standard deviation for normal distribution
  float size;          //size of jellyfish, which is proportional to the mean value
  float actualSize;    //actual size to draw, all effects applied
    final float sizeMin = 10;
    final float sizeMax = 30;
    final float meanMin = 30;
    final float meanMax = 80;
  color col;                  //color of jellyfish
  float destX, destY;         //destination coordinate
  boolean onPosition = true;  //true if the jellyfish gets to the destination
  long idleTime;              //time that the jellyfish stays still until next move
  long idleTimer;             //time counter for idle phase
  
  float wind;
    final float windMin = -0.4;
    final float windMax = +0.4;
    final int windSeed;             //noise seed for individual wind effect
    float windOffset = 0;           //for Perilin noise
    final float offsetStep = 0.001;
  float gravity;                    //each Jellyfish has different gravity value
    final float gravityMin = 0.01;
    final float gravityMax = 0.20;
  
  Jellyfish(float _x, float _y, float _mean, float _sigma) {
    x = _x; y = _y;
    generator = new Random();
    mean = _mean; sigma = _sigma;
    size = map(mean, meanMin, meanMax, sizeMin, sizeMax);  //size is proportional to the mean value
    col = color(255, 197);
    wind = 0;
    windSeed = (int)random(65536);
    gravity = random(gravityMin, gravityMax);
  }
  
  void render() {
    noStroke(); fill(col);
    float sizeCoeff = map(dist(x, y, destX, destY), 0, meanMax, 1.0, 0.0);  //size varies depending on how far the jellyfish is from the destination
    float sizeSmooth = 0.5;                                                  //smoothing value for the size change
    actualSize = size + (size*sizeCoeff - size) * sizeSmooth;                //smoothing
    actualSize *= random(0.9, 1.1);                                          //jittering
    ellipse(x, y, actualSize, actualSize);
  }
  
  void update() {
    //make wind
    noiseSeed(windSeed);
    wind = noise(windOffset) * (windMax-windMin) + windMin;
    windOffset += offsetStep;

    //apply wind and gravity
    x += wind;    destX += wind;
    y += gravity; destY += gravity;

    if(!onPosition) {  //moving now
      float moveSmooth = 0.01;  //smoothing value for the movement
      x += (destX - x) * moveSmooth;
      y += (destY - y) * moveSmooth;
      
      //check if the jellyfish went out of the screen and fix it
      if(x < 0) {
        x = width + x;
        if(destX < 0) destX = width + destX;
        else destX += width;
      } else if(x >= width) {
        x = x - width;
        if(destX >= width) destX = destX - width;
        else destX -= width;
      }
      if(y < 0) {
        y = height + y;
        if(destY < 0) destY = height + destY;
        else destY += height;
      } else if(y >= height) {
        y = y - height;
        if(destY >= height) destY = destY - height;
        else destY -= height;
      }
      
      //check if the jellyfish got to the destination
      float samePosThreshold = gravity;       //tolerance distance to decide the arrival
      if(dist(x, y, destX, destY) < samePosThreshold) {
        onPosition = true;                    //flag up
        idleTime = (long)(getRandom() * 5);  //set idle phase duration; it's proportional to the gaussian random value
        idleTimer = millis();                 //record current time
      }
    } else {           //not moving now
      //check if the jellyfish has been on idle phase long enough
      if(millis() - idleTimer >= idleTime) {
        onPosition = false;  //flag down
        
        //set new destination
        float direction = PI * 1.5;  //goes upward only
        destX = x + getRandom() * cos(direction);
        destY = y + getRandom() * sin(direction);
      }
    }
  }
  
  float getRandom() {
    float val = (float)generator.nextGaussian()*sigma+mean;
    return abs(val);
  }
}
