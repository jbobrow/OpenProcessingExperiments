
//adapted mainly from http://www.local-guru.net/processing/bouncingball/bouncingball.html
//Also: http://www.learningprocessing.com/examples/chapter-10/example-10-2/
//http://www.openprocessing.org/sketch/8493
//http://www.instructables.com/id/Control-a-RepStrap-RepRap-CNCCartesian-Bot-usi/step20/3D-Bouncing-Ball-Processing/
//
//


int x = 0;
int y = 0;
//speed of ball
int speedx = 10;
int speedy = 6;

  void setup() {
  size(600,300);
  smooth();
  frameRate(40);
}


void draw() {
  noStroke();
  fill(255);
  rect(0,0,600,300);
  stroke(0);

  fill(mouseX, mouseY, 255);
  noStroke();
  ellipse( x, y, 10, 10);
  println("R = " + mouseX + " G = " + mouseY + " B = 255");
  
  x += speedx;
  y += speedy;
  if (x > 600 || x < 0) {
   speedx = speedx * -1;
  }
  if (y > 300 || y < 0) {
    speedy = speedy * -1;
  } 
 
}

