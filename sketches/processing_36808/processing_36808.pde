
void setup() {
  size(600, 300);
  background(0);
}

int numOfTries = 250; // number of tries
float rndRadius;
float rndHeight;
float Mcolor1;
float Mcolor2;

void draw() { 
  // generate random number
  rndRadius = random(width);
  rndHeight = random(height);

  //if the radius is greater than 200 then it fills blue and if not then it fills orange
  if (rndRadius < 200) {
    fill(237, 92, 24, 50);
  }
  else {
    fill(24, 86, 237, 15);
  }
  //if the height is less than 50 then it fills green
  if (rndHeight < 50) {
    fill(50, 200, 50, 50);
  }

  if (numOfTries > 0) {
    // use the number in the X coordinate; don't make the radius too big
    ellipse(rndRadius + random(-200, 200), rndHeight, rndRadius/2, rndRadius/2);
    rect(rndRadius + random(-200, 200), rndHeight, rndRadius/2, rndRadius/2);
  }

  numOfTries--;
}


