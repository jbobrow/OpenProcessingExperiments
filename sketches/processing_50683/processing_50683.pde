
/**
 * Project 1 Template
 * UCLA Design Media Arts, Fall 2011 
 * Prof. Casey Reas
 * 
 * Note: Put all of your code in the "testFace" tab. Leave
 * this tab and the "volume" tab as they are. You can set
 * your variables at the top of "testFace".
 * 
 * Based on code from Lorenzo Bravi:
 * http://www.lorenzobravi.com/projects/workshop-isia/
 */

float v; 
float easing = 0.2;  // Between 0 and 1
float volumeScalar = 500;
boolean mic = true;



void setup() {
  size(600, 600);
  smooth();
  setupVolume();

  noCursor();
  background(200, 250, 0);



  ellipse(50, 300, 50, 100);
  ellipse(550, 300, 50, 100);

  ellipse(300, 300, 100, 50);
  fill(0, 0, 0);
  ellipse(300, 300, 500, 400);

   
}

void draw() {
  //background(255);

  getVolume();

  if (mic == false) {
    v = mouseX;
  }

  testFace();

  //saveFrame("mask-####.png");
}


