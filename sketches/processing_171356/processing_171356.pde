
// Atomic Clock by Brian Cantrell
// Procedural Expression - time project

float reverse = 0;
int seconds = 0;
int minutes = 0;
int hours = 0;
int days = 0;
float rate = 50;
float theta;
boolean pulseNow = false;
color lineCol = color(100, 200, 255, 30);
color prevLineCol = lineCol;

Bogon[] bogons = new Bogon[30]; //declare 'nucleus' array.

//--------------------------------------

void setup() {
  size(800, 800);
  frameRate(30);
  background(0);
  smooth();
  strokeWeight(.75);
  fill(100, 200, 255);

  //initialize 'nucleus' array in a circular area. Radius = 80px.

  for (int i = 0; i<bogons.length; i++) {
    float theta = random(360);
    bogons[i] = new Bogon(width/2+sin(theta)*random(80), height/2+cos(theta)*random(80));
  }
}

//--------------------------------------

void draw() {
  background(0);

  //Instantiate nucleus.
  for (int i=0; i<bogons.length; i++) {
    bogons[i].display();
    bogons[i].jiggle();
  }


  noFill();
  stroke(100, 200, 255);

  //draw rings
  for (int i=400; i<=700; i+=100) { 
    ellipse(width/2, height/2, i, i);
  }
  
  //call functions
  secondHand();
  minuteHand();
  hourHand();
  dayHand();

  //pulse nucleus
  for (int i=0; i<bogons.length; i++) {
    bogons[i].pulse(pulseNow);
  }
  
  //set line color
  if (pulseNow) {
    lineCol = color(255, 255, 255, 100);
  } 
  else {
    lineCol = lerpColor(lineCol, prevLineCol, .05);
  }

  //draw lines between bogons
  for (int i=0; i<bogons.length; i++) {
    for (int j=0; j<bogons.length; j++) {
      if (i != j) {
        stroke(lineCol);
        line(bogons[i].x, bogons[i].y, bogons[j].x, bogons[j].y);
      }
    }
  }
}

//----------functions------------------

void secondHand() {

  seconds+=2;
  float theta1 = map(seconds, 0, 60, 0, TWO_PI)-HALF_PI;
  float r = 200;
  noStroke();
  fill(100, 200, 255);
  ellipse(width/2+cos(theta1)*r, height/2+sin(theta1)*r, 15, 15);
}

void minuteHand() { 
  pulseNow = false; 
  if (seconds >= 60) {
    minutes++;
    seconds = 0;
  }
  float theta2 = map(minutes, 0, 6, 0, TWO_PI)-HALF_PI;
  float r = 250;
  noStroke();
  fill(100, 200, 255);
  ellipse(width/2+cos(theta2)*r, height/2+sin(theta2)*r, 15, 15);
  if (minutes >= 6) {
    hours+=3;
    minutes = 0;
    pulseNow = true;
    for (int i=0; i<bogons.length; i++) {
      bogons[i].c = color(255, 255, 255, 255);
    }
  }
}

void hourHand() {
  float theta3 = map(hours, 0, 12, 0, TWO_PI)-HALF_PI;
  float r = 350;
  noStroke();
  fill(100, 200, 255);
  ellipse(width/2+cos(theta3)*r, height/2+sin(theta3)*r, 15, 15);
  if (hours >= 12) {
    days++;
    hours = 0;
  }
}

void dayHand() {
  if (seconds >= 30) {
    reverse = random(-1, 1);
  }
  days+=2*reverse;
  float theta4 = map(days, 0, 60, 0, TWO_PI)-HALF_PI;
  float r = 300;
  noStroke();
  fill(100, 200, 255);
  ellipse(width/2+sin(theta4)*r, height/2+cos(theta4)*r, 15, 15);
}

class Bogon {
  float x;
  float y;
  float prevX;
  float prevY;
  boolean isPulsed;
  color c = color(100, 200, 255, 100);
  color prevC = color(100, 200, 255, 100);

  Bogon(float _x, float _y) {
    x = _x;
    y = _y;
    prevX = _x;
    prevY = _y;
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, 30, 30);
  }

  void jiggle() {
    x += random(-1, 1);
    y += random(-1, 1);
  }

  void pulse(boolean _pulsed) {
    float theta = random(360);
    isPulsed = _pulsed;
    if (isPulsed) {
      //send bogon to a larger area than currently occupied
      x = width/2+sin(theta)*random(150); 
      y = height/2+cos(theta)*random(150);
    }
    //return bogon to original state at slower speed
    c = lerpColor(c, prevC, .05);
    x = lerp(x, prevX, .05);
    y = lerp(y, prevY, .05);
  }
}



