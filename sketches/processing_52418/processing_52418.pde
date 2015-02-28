
/*****************************************
 * Assignment 03
 * Name:         Warren Schwartz
 * E-mail:       wschwart@haverford.edu
 * Course:       CS 110 - Section 02
 * Submitted:    2/14/12
 * 
 * This sketch depicts a spaceship flying through
 black space near various bright star-like objects.
 The space ship can be controlled with the arrow
 keys. BE CAREFUL NOT TO FLY OFF THE EDGE OF
 SPACE AND/OR THE KNOWN UNIVERSE.
 ***********************************************/

//define variables for ship and general stuff
float playerDirection = (3*PI)/2;
float playerX = 0;
float playerY = 0;
float speed = 0;
float thrust = 2.0;
float imaginarySpaceFriction = 0.99;
float inertialDirection = (3*PI)/2;
float scaleFactor = 2;

//anomaly 1 vars
float thing1x = 0;
float thing1y = 0;
float thing1Direction = random(2*PI);

//anomaly 2 vars
float thing2x = 0;
float thing2y = 0;
float thing2Direction = random(2*PI);

//anomaly 3 vars
float thing3x = 0;
float thing3y = 0;
float thing3Direction = random(2*PI);

void setup() {
  size(800, 600);
  background(0);
  playerX = int(width/2);
  playerY = int(height/2);

  thing1x = random(width);
  thing1y = random(height);

  thing2x = random(width);
  thing2y = random(height);

  thing3x = random(width);
  thing3y = random(height);
}

void keyPressed() {
  //Pilot ship
  if (keyCode == RIGHT) {
    playerDirection = playerDirection + PI/60;
  }
  else if (keyCode == LEFT) {
    playerDirection = playerDirection - PI/60;
  }
  else if (keyCode == UP) {
    inertialDirection = playerDirection;
    speed = thrust;
  }
}

void draw() {
  background(0);

  //Call spacecraft draw function
  drawPlayerShip(playerX, playerY, scaleFactor, playerDirection);

  //Call anomaly 1 draw function
  drawThing1(thing1x, thing1y, random(0.5, 1.5));
  thing1x = thing1x + random(3)*cos(thing1Direction);
  thing1y = thing1y + random(3)*sin(thing1Direction);
  if (thing1x > width || thing1x < 0) {
    thing1x = random(width);
    thing1Direction = random(2*PI);
  }
  if (thing1y > height || thing1y < 0) {
    thing1y = random(height);
    thing1Direction = random(2*PI);
  }

  //Call anomaly 2 draw function
  drawThing2(thing2x, thing2y, random(0.5, 1.5));
  thing2x = thing2x + random(3)*cos(thing2Direction);
  thing2y = thing2y + random(3)*sin(thing2Direction);
  if (thing2x > width || thing2x < 0) {
    thing2x = random(width);
    thing2Direction = random(2*PI);
  }
  if (thing2y > height || thing2y < 0) {
    thing2y = random(height);
    thing2Direction = random(2*PI);
  }

  //Call anomaly 3 draw function
  drawThing3(thing3x, thing3y, random(0.5, 1.5));
  thing3x = thing3x + random(3)*cos(thing3Direction);
  thing3y = thing3y + random(3)*sin(thing3Direction);
  if (thing3x > width || thing3x < 0) {
    thing3x = random(width);
    thing3Direction = random(2*PI);
  }
  if (thing3y > height || thing3y < 0) {
    thing3y = random(height);
    thing3Direction = random(2*PI);
  }
}

//Define spacecraft draw function
void drawPlayerShip(float x, float y, float scalefac, float direction) {
  //wing pylons
  smooth();
  strokeWeight(1);
  stroke(200);
  line(x+scalefac*23*cos(direction+((4*PI)/3)), y+scalefac*23*sin(direction+((4*PI)/3)), x+scalefac*21.4*cos(direction-(70*PI/180)), y+scalefac*21.4*sin(direction-(70*PI/180)));
  line(x+scalefac*23*cos(direction-((4*PI)/3)), y+scalefac*23*sin(direction-((4*PI)/3)), x+scalefac*21.4*cos(direction+(70*PI/180)), y+scalefac*21.4*sin(direction+(70*PI/180)));
  strokeWeight(4);
  stroke(100);
  line(x+scalefac*23*cos(direction+((4*PI)/3)), y+scalefac*23*sin(direction+((4*PI)/3)), x+scalefac*20*cos(direction-(PI/2)), y+scalefac*20*sin(direction-(PI/2)));
  line(x+scalefac*23*cos(direction-((4*PI)/3)), y+scalefac*23*sin(direction-((4*PI)/3)), x+scalefac*20*cos(direction+(PI/2)), y+scalefac*20*sin(direction+(PI/2)));
  //fuselage
  strokeWeight(1);
  stroke(0);
  fill(200);
  quad(x+scalefac*10*cos(direction-(PI/2)), y+scalefac*10*sin(direction-(PI/2)), x+scalefac*10*cos(direction+(PI/2)), y+scalefac*10*sin(direction+(PI/2)), x+scalefac*25*cos(direction-((4*PI)/3)), y+scalefac*25*sin(direction-((4*PI)/3)), x+scalefac*25*cos(direction+((4*PI)/3)), y+scalefac*25*sin(direction+((4*PI)/3)));
  fill(160, 0, 30);
  triangle(x+scalefac*10*cos(direction-(PI/2)), y+scalefac*10*sin(direction-(PI/2)), x+scalefac*10*cos(direction+(PI/2)), y+scalefac*10*sin(direction+(PI/2)), x+scalefac*30*cos(direction), y+scalefac*30*sin(direction));
  //tail
  triangle(x, y, x+scalefac*17*cos(direction-PI), y+scalefac*17*sin(direction-PI), x+scalefac*30*cos(direction-(4*PI/5)), y+scalefac*30*sin(direction-(4*PI/5)));
  triangle(x, y, x+scalefac*17*cos(direction+PI), y+scalefac*17*sin(direction+PI), x+scalefac*30*cos(direction+(4*PI/5)), y+scalefac*30*sin(direction+(4*PI/5)));
  //cockpit
  fill(100);
  quad(x+scalefac*25*cos(direction-(17*PI/18)), y+scalefac*25*sin(direction-(17*PI/18)), x+scalefac*25*cos(direction+(17*PI/18)), y+scalefac*25*sin(direction+(17*PI/18)), x+scalefac*5*cos(direction+(PI/6)), y+scalefac*5*sin(direction+(PI/6)), x+scalefac*5*cos(direction-(PI/6)), y+scalefac*5*sin(direction-(PI/6)));
  fill(0, 0, 255);
  quad(x+scalefac*8*cos(direction-(13*PI/18)), y+scalefac*8*sin(direction-(13*PI/18)), x+scalefac*8*cos(direction+(13*PI/18)), y+scalefac*8*sin(direction+(13*PI/18)), x+scalefac*5*cos(direction+(PI/6)), y+scalefac*5*sin(direction+(PI/6)), x+scalefac*5*cos(direction-(PI/6)), y+scalefac*5*sin(direction-(PI/6)));
  fill(80, 80, 255);
  quad(x+scalefac*5*cos(direction-(16*PI/18)), y+scalefac*5*sin(direction-(16*PI/18)), x+scalefac*5*cos(direction+(16*PI/18)), y+scalefac*5*sin(direction+(16*PI/18)), x+scalefac*5*cos(direction+(PI/6)), y+scalefac*5*sin(direction+(PI/6)), x+scalefac*5*cos(direction-(PI/6)), y+scalefac*5*sin(direction-(PI/6)));
  playerX = playerX + speed*cos(inertialDirection);
  playerY = playerY + speed*sin(inertialDirection);
  speed = speed * imaginarySpaceFriction;
}

//Define anomaly 1 draw function
void drawThing1(float x, float y, float scalefac) {
  float angle = 0;
  noStroke();
  fill(random(200, 255), random(80), random(80));
  beginShape();
  curveVertex(x+scalefac*15*cos(angle-(PI/2)), y+scalefac*15*sin(angle-(PI/2)));
  for (angle = 0; angle < (2*PI); angle += (PI/6)) {
    curveVertex(x+scalefac*random(10, 50)*cos(angle), y+scalefac*random(10, 50)*sin(angle));
  }
  curveVertex(x+scalefac*15*cos(angle+(PI/2)), y+scalefac*15*sin(angle+(PI/2)));
  endShape(CLOSE);
}


//Define anomaly 2 draw function
void drawThing2(float x, float y, float scalefac) {
  float angle = 0;
  noStroke();
  fill(random(80), random(200, 255), random(80));
  beginShape();
  curveVertex(x+scalefac*15*cos(angle-(PI/2)), y+scalefac*15*sin(angle-(PI/2)));
  for (angle = 0; angle < (2*PI); angle += (PI/6)) {
    curveVertex(x+scalefac*random(10, 50)*cos(angle), y+scalefac*random(10, 50)*sin(angle));
  }
  curveVertex(x+scalefac*15*cos(angle+(PI/2)), y+scalefac*15*sin(angle+(PI/2)));
  endShape(CLOSE);
}

//Define anomaly 3 draw function
void drawThing3(float x, float y, float scalefac) {
  float angle = 0;
  noStroke();
  fill(random(80), random(80), random(200, 255));
  beginShape();
  curveVertex(x+scalefac*15*cos(angle-(PI/2)), y+scalefac*15*sin(angle-(PI/2)));
  for (angle = 0; angle < (2*PI); angle += (PI/6)) {
    curveVertex(x+scalefac*random(10, 50)*cos(angle), y+scalefac*random(10, 50)*sin(angle));
  }
  curveVertex(x+scalefac*15*cos(angle+(PI/2)), y+scalefac*15*sin(angle+(PI/2)));
  endShape(CLOSE);
}


