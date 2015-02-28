
// Fractal tree, inspired by Daniel Shiffman's example: http://processing.org/examples/tree.html 

// These variables are declared here in order to be globally accessible
float angleInRadians;
float x;
float y;

void setup() {
  size(500, 500);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
// Layer 1: Sky
  float skyHue = map(mouseX, 0, width, 225, 200);
  float skyTime = map(mouseX, 0, width, 75, 125);
  background(skyHue, 50, skyTime); // Dude - try removing this! o_O
  
// Layer 2: Mountains
  mountains();

// Layer 3.1: Sun rays
float sunHue = map(mouseX, 0, width, 25, 50);
float reach = map(mouseY, 0, height, 5, 15);
  for(int i = 0; i<360; i+=18) {
    rectMode(CENTER);
    float x = cos(radians(i));
    float y = sin(radians(i));
    stroke(sunHue, 50, 100);
    fill(sunHue, 50, 100);
    line(0, 0, x*sunHue*reach, y*sunHue*reach);
    rect(x*sunHue*reach, y*sunHue*reach, 5, 5);
  }

// Layer 3.2: Sun
  fill(sunHue, 50, 100);
  ellipse(0, 0, width/4+(mouseX/5), width/4+(mouseX/5));

// Layer 4: Randomly placed stars
  int numberOfStars = 50;
  int starMovement = (int) mouseX/10;
  float starVisibility = map(mouseX, 0, width, 360, 0);
  randomSeed(starMovement);
  for (int i = 0; i<=numberOfStars; i++) {
    float xpos = random(500);
    float ypos = random(height/3);
    fill(0, 0, 100, starVisibility);
    rect(xpos, ypos, 2, 2);
  }

// Layer 5: Clouds
  int numberOfClouds = 25;
  float cloudTransparency = map(mouseX, 0, width, 180, 25);
  for (int i = 0; i<=numberOfClouds; i++) {
    randomSeed(i);
    float cloudSize = random(90, 110);
    float cloudPosX = random(0-(mouseX/10), width+(mouseX/10));
    float cloudPosY = random(100-(mouseX/10), (height/3)+(mouseX/10));
    fill(0, 0, 100, cloudTransparency);
    arc(cloudPosX, cloudPosY, cloudSize, cloudSize, PI, TWO_PI);
  }

// Layer 6: Fractal tree! This is the base - the rest is in drawBranches()
  float base = height/3;
  int minAngle = 0; 
  int maxAngle = 90;
  float angle = map(mouseX, 0, width, minAngle, maxAngle);
  angleInRadians = radians(angle);

  translate(width/2, height); // Move to the bottom centre of the screen
  strokeWeight(base/20);
  stroke(30, 50, 50);
  line(0, 0, 0, -base);
  translate(0, -base); // Move to the end of the line, and start making branches!
  drawBranches(base);
}

void drawBranches(float branchLength) {
  branchLength *= 0.66;
  float branchThickness = branchLength/10;

  if (branchLength > 2) {
    // All the branches that go to the right
    strokeWeight(branchThickness);
    stroke(branchLength, 50, 100);
    pushMatrix();
    rotate(angleInRadians);
    line(0, 0, 0, -branchLength);
    translate(0, -branchLength);
    drawBranches(branchLength);
    popMatrix();

    // Rotation direction changes - everything else stays
    strokeWeight(branchThickness);
    stroke(branchLength, 50, 100);
    pushMatrix();
    rotate(-angleInRadians);
    line(0, 0, 0, -branchLength);
    translate(0, -branchLength);
    drawBranches(branchLength);
    popMatrix();
  }
}

void mountains() {
  float mountainSize = map(mouseX, 0, width, 1.1, 1.0);
  scale(mountainSize);
  fill(120, 25, 50);
  triangle(0, height, width/4, height/2, width/2, height);
  fill(0, 0, 100);
  
  scale(0.5);
  pushMatrix();
  translate(125, height/2);
  triangle(0, height, width/4, height/2, width/2, height);
  popMatrix();
  scale(2);
}
