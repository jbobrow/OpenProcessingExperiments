
PVector pos; 

///Second2 
float x = 0;
float speed = second();

///Minute2 
float x2 = 0;
float speed2 = minute();

///Hour2 
float x3 = 0;
float speed3 = hour();

void setup() {
  size (1000, 600);
}

void draw() {
  background (#CDCFD9);
  Second();
  Minute();
  Hour();
  Second2();
  Minute2();
  Hour2();
  Second3();
  secondsLines();
  minutesLines();
  hoursLines();

  //Minute3();
  //Hour3();
} 

void Second() {
  float s = second();
  //fill(255, 181, 184);
  fill(250);
  noStroke();
  float d = map (s, 0, 59, 0, 1000);
  rectMode(CENTER);
  rect (0, 25, d, 50);
} 

void Second2() {
  if (millis() < 1000) {
    x += speed;
  } else if (millis() > 1000) {
    x += second();
  }
  if (x>width + 10) {
    x = 0;
  } 
  //fill (255, 181, 252);
  fill(224);  
  rectMode(CENTER);

  rect (x, 100, 100, 100);
}

void Minute() {
  float m = minute();
  //fill(255, 227, 181);
  fill(188);
  noStroke();
  float n = map (m, 0, 59, 0, 1000);
  rectMode(CENTER);

  rect (0, 225, n, 50);
} 

void Minute2() {
  if (millis() < 1000) {
    x2 += speed2;
  } else if (millis() > 1000) {
    x2 += minute();
  }
  if (x2>width + 10) {
    x2 = 0;
  } 
  //fill(181, 255, 250);
  fill(181);
  rectMode(CENTER);

  rect (x2, 300, 100, 100);
}

void Hour() {
  float h = hour();
  //fill(255, 255, 181);
  fill(66);
  noStroke();
  float g = map (h, 0, 23, 0, 1000);
  rect (0, 425, g, 50);
} 

void Hour2() {
  if (millis() < 1000) {
    x3 += speed3;
  } else if (millis() > 1000) {
    x3 += hour();
  }
  if (x3>width + 10) {
    x3 = 0;
  }
  //fill(181, 255, 192);
  fill(80);
  rectMode(CENTER);

  rect(x3, 500, 100, 100);
}

void Second3() {
  int i;
  stroke(255);
  for (i = 0; i < 1000; i= i+second ()) {
    line(i, 100, i, 300);
  }
}

void secondsLines() {
  int i;
  for (i = 0; i < 1000; i = i + 100) {
    line (0, random(0, 600), second()*70, random(0, 600));
  }
}

void minutesLines() {
  int k;
  for (k = 0; k < 1000; k = k + 100) {
    line (0, random(0, 600), minute()*50, random(0, 600));
  }
}

void hoursLines() {
  int m;
  for (m = 0; m < 1000; m = m + 100) {
    line (0, random(0, 600), hour(), random(0, 600));
  }
}
 
 
 //I tried to make it so there are rotating handles like a clock
 //but couldn't figure it out 
 //here is what I worked on (in a separate window 
 //hence the draw and setup loops)
 
 /* 
 float x = second();
float timer;
int Size;


void setup() {

  size(800, 800);
  smooth();
  noStroke();

 Size = 0;
}

void draw() {
  background(225);

  rotatePart();
  handlePart();
}

void  handlePart() {
  fill(100);
  ellipseMode(CENTER);
  ellipse (x+300, 100, 100, 100);
  fill(0);
  ellipse(x+300, 100, 10, 10);

  pushMatrix();
  fill(255);
  rotate(radians(timer));
  rectMode(CENTER);
  line(0, -100, 4, 100); 
  popMatrix();
}

void rotatePart() {

  timer = map(second(), 0, 60, 0, 360);
}
*/
