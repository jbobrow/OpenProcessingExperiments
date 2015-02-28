
/*
Aquarium - a Processing sketch by chris Mealing
January 3, 2013


A relatively simple program to display a tank full of fishes, with psuedo-random
fishy swimming patterns.

A self-teching experiment to use an array of custom (Fish) objects.
*/


int numFish = 40;
float fishSize = 50;  // base fish length
float sizeVar = 0.5;  // factor to randomize fish length
float fishSpeed = 2;  // base fish swim speed
float speedVar = 0.5;  // factor to randomize speed
float fishVSpeed = .20;  // factor to determine fish vertical speed
float fishPace = 90000;  // milliseconds, base timin for one back-and-forth 
float colorVar = 50;  // maximum color variance (of 255)
float tankEdge = 1.5 * (1 + sizeVar) * fishSize;  // make the tank a little wider than the window
Fish[] fishes;  // array to hold all the fishies
PImage img;  // gradient image (jpg) for the background


void setup() {
  smooth();
  size(1000, 600);
  frameRate(30);
  noStroke();
  // generate the array of fishes
  fishes = new Fish[numFish];
  for (int i = 0; i < numFish; i++) {
    fishes[i] = new Fish();
  }
  // load the background image
  img = loadImage("gradient.jpg");
}


void draw() {
  image(img, 0, 0, width, height);  // using a grdient image instead of "background()"
  for (int i = 0; i < numFish; i++) {
    fishes[i].swim();
    fishes[i].display();
  }
  // a bit of green guaze in from to mute the colors a bit
  fill(32, 128, 64, 64);
  rect(0, 0, width, height);
}



  
  

  
class Fish {
  // class variables
  float fishL, fishH;  // fish size
  float ro, go, bo;  // fish base color rgb
  float r, g, b;  // instantaneous fish color rgb
  int cVar;  // fish color variance range
  float fishSpdX, fishSpdY;  // maximum fish speed
  float x, y, spdX, spdY;  // instantaneous fish position and speed
  float pace, offset;  // parameters to establish how quickly fish traverse sin wave and start point
  float spdRatio;  // parameter to determine relative speed of fish
  float dir;  // which direction is fish swimming (-1 or 1)
  
  // constructor
  Fish() {
    // randomize fish size
    fishL = fishSize * random(1 - sizeVar, 1 + sizeVar);
    fishH = fishL * random (0.2, 0.80);
    // base fish color
    cVar = int(random(0.5 * colorVar, colorVar));  // color range for this fish
    int i = int(random(6));
    ro = red(chooseColor(i, cVar));
    go = green(chooseColor(i, cVar));
    bo = blue(chooseColor(i, cVar));  
    // initial position, speed, and pace
    x = random(width);
    y = random(0.75 * fishH, height - 0.75 * fishH);
    fishSpdX = fishSpeed * random(1 - speedVar, 1 + speedVar);  // random maximum speed for this fish
    fishSpdY = fishSpdX * random(0.5 * fishVSpeed, fishVSpeed);  // random maximum vertical speed for this fish
    pace = random(0.5 * fishPace, fishPace);  // milliseconds
    offset = random(pace);  // offset initial speed
  }
  
  void swim() {
    // update fish speed using param() to generate smooth speed profile
    spdX = fishSpdX * param(offset, pace);
    spdY = fishSpdY * param(2 * offset, 1.5 * pace);  // adjust vertical swim at a different pace than horizontal
    spdRatio = abs(spdX / fishSpdX);  
    dir = spdX / abs(spdX);  // which direction is fish swimming (-1 or 1)
    // calculate new position
    x += spdX;
    y += spdY;
    // check if at edge of tank
    if ((x + fishL/2 > width + tankEdge) || (x - fishL/2) < 0 - tankEdge) {
      fishSpdX *= -1;
    }
    if ((y + fishH/2 > height + tankEdge) || (y - fishH/2) < 0 - tankEdge) {
      fishSpdY *= -1;
    }
  }
  
  void display(){
    // vary the fish color over time
    r = ro + param(offset, 0.5 * pace) * cVar;
    g = go + param(offset * 1.5, 0.5 * pace) * cVar;
    b = bo + param(offset * 3, 0.5 * pace) * cVar;
    fill(r, g, b);
    /* adjust apparent fish width to indicate reverse in direction
      as fish slows down to turn, make body shorter. */
    float showFishL = fishL;
    if (spdRatio <= 0.33) {
      showFishL = map(spdRatio, 0, 0.33, 0.33, 1.0) * fishL;
    }
    // display the fish body
    ellipse(x, y, showFishL, fishH);
    // display the fish tail, which also shifts as fish slows and turns
    float tailL = 0.65 * fishL * dir;
    if (spdRatio <= 0.33) {
      tailL *= map(spdRatio, 0, 0.33, 0.20, 1.0);
    }
    triangle(x - tailL, y + fishH / 2, x - tailL, y - fishH / 2, x - 0.6 * tailL, y);
    // ... and the fish eyes! Eyes shift around as fish slows and turns
    fill(0);
    float eyeSize = 0.20 * fishH;
    if (spdRatio > 0.33) {
      // eye in default position normally
      ellipse(x + dir * showFishL / 4, y - fishH / 6, eyeSize * showFishL/fishL, eyeSize);
    } else {
      // eye shifts and narrows as fish turns
      float eyeMax = fishL / 4;
      float eyeMin = 0.33 * fishL / 2;
      float eyeSpc = map(spdRatio, 0, 0.33, -eyeMin, eyeMax);
      ellipse(x + dir * eyeSpc, y - fishH / 6, eyeSize * showFishL/fishL, eyeSize);
    }
  }
  
}


/* function to return a sinusoidal varying parameter over a time period
    "extent" controls the time for the entire wavelength to occur
    "shift" sets a random start position on sin wave (so every fish doesn't 
    change at same rate) 
    
    The param function lets the fish change speed, color, etc. smoothly */
float param(float shift, float extent) {
  float t = (millis() + shift) % extent;
  float a = map (t, 0, extent, 0, TWO_PI);
  return sin(a);
}
    

/* funtion used by Fish class constructor to choose fish colors.
  This function contrains the color combinations to the 6 permutations of 
  (0, 255, random) so as to generate brighter colors (or avoid drab ones).
  The "c" argument offsets the color selected slightly to allow a buffer for
  the color to vary. */
color chooseColor(int i, int c) {
  float r = 0;
  float g = 0;
  float b = 0;
  switch(i) {
    case 0:
      r = c;
      g = 255 - c;
      b = random(c, 256 - c);
      break; 
    case 1:
      r = c;
      g = random(c, 256 - c);
      b = 255 - c;
      break;   
    case 2:
      r = 255 - c;
      g = c;
      b = random(c, 256 - c);
      break;   
    case 3:
      r = random(c, 256 - c);
      g = c;
      b = 255 - c;
      break;   
    case 4:
      r = 255 - c;
      g = random(c, 256 - c);
      b = c;
      break;   
    case 5:
      r = random(c, 256 - c);
      g = 255 - c;
      b = c;
      break; 
  }
  return color(r, g, b);
}  


