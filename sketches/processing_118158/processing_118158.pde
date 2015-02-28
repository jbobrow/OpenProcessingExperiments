
// Assignment 3: green, green grass of home 10/30
// use loops to allow repetitions 
// use customized random/noise functions to create randomness with patterns
// refference form schien@mail.ncku.edu.tw
// by chen-hsin chang

int div =6;



void setup() {
  size(700, 200);
  frameRate(10); 
  smooth();
}
void draw() {
  background(255);
  //butterfly;
  stroke(0,150);
  noFill(); 
  triangle(mouseX, mouseY,mouseX+random(1,2), mouseY+random(5,10),mouseX+random(5,10), mouseY+random(1,2));
  triangle(mouseX+5, mouseY+5,mouseX+random(1,2), mouseY+random(5,10),mouseX+random(5,10), mouseY+random(1,2));
  // use loop to grow grass
  for (int i =1; i<700; i++) {
    wiggleLine(i, 0, i+random(0, 5), 100);
    wiggleLine(i, 0, i+random(0, 5), 90);
  }
}

void wiggleLine(float sx, float sy, float ex, float ey) {


  // divide the line into some baby lines
  float xstep = (ex - sx)/div;
  float ystep = (ey - sy)/div;
  float lastx = sx;
  float lasty = sy;
  float y = sy;
  float x = sx;
  for (int i=0; i<div; i++) {
    x= x+ xstep;
    x = x + random(30) -5; // wiggle on x
    y= y+ ystep;
    y = y + random(100) - 25; // wiggle on y
    stroke(i*30, 240, 86, 60);
    line(x, height-y, lastx, height-lasty);
    fill(250, 200, 135);
    lastx = x;
    lasty = y;

    //flowers
    noStroke();
    fill(250, 200, 135, 70);    
    ellipse(x, y, random(1, 5), random(1, 5));
  }
}



