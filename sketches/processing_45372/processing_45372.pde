

int cx, cy;
float rx, ry;
int radius;
float rdivs;
float rwiggle;
float nSeed;
float counter;

void setup() {
  size(400,400);
  cx = width /2;
  cy = height / 2;
  radius = (min(width, height)-100) / 2;  
  rdivs = radius / 8;    // Slots for block
  rwiggle = rdivs / 3.5;   // random plus minus wiggle
  frameRate(5);
  nSeed = random(10);
}

void draw() {
  background(0);
  noStroke();
  fill(255,0,0);
  strokeWeight(2);
  rectMode(CENTER);
  
  counter = 0;
  for (int a = 0; a < 360; a+=random(20,22)) {
    float rad = radians(a);
    for (int i = 2; i <= 8; i++) {
      float rSize = random(i*1.7,i*2.2);
      fill(random(0,255), random(0,255), random(0,255));
      rx = cx + random(-rwiggle, rwiggle) + ((rdivs * i) * cos(rad));
      ry = cy + random(-rwiggle, rwiggle) + ((rdivs * i) * sin(rad));

      counter+= 0.1;
      pushMatrix();
      translate(rx, ry);
      rotate(random(0,PI));   
      rect(0, 0, rSize, rSize);  
      popMatrix();

    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    saveFrame("pulsar-####.png");
  }
}



