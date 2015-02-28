
// Example 09-01 from "Getting Started with Processing" 
// by Reas & Fry. O'Reilly / Make 2010
// Updated 1/4/12

import peasy.*;
PeasyCam camera;

JitterBug[] bugs; // define array for jtrbug objects
int xNum = 20; // # of objects across width
int yNum = 2; // # over height
int count = xNum * yNum; // # of total jtrbg objects
float r=255, g=100, b=255; // values for fill/color of boxes

void setup() {
  background(0);
  size(800, 450, P3D);
  smooth();
  camera = new PeasyCam(this, width/2, height/2, random(200, 900), 850); // create cam
  // set cam to specific location
/*  camera(150, -517, 511, // cam xyz
         580, 83, 90, // target xyz
         0.0, 1.0, 0.0); // upX, upY, upZ
*/       
  strokeWeight(3); // heavier stroke looks better to my eye... personal preference
  
  int index = 0; // used to step thru array
  bugs = new JitterBug[count]; // create array of jtrbug objects
  for (int x = 0; x < xNum; x++) {
    for (int y = 0; y < yNum; y++) {
      // populate variables for jtrbug objects for constructor
      bugs[index++] = new JitterBug(int(random(width)), int(random(height)), 50, 20);
    }
  }
  stroke(0, 20); // stroke of boxes
  println(bugs.length); // used to monitor my 
  rectMode(CENTER);// personal pref
}// END SETUP

void draw() {

  // create ui at top of screen to edit colors; mouse pos gives rgb amounts
  if(mouseX > width*.2 && mouseX < width*.2 + 100 && mouseY >= 0 && mouseY < 10) { // chk mouse pos
    r = map(mouseX, width*.2, width*.2+100, 60, 255); // map mouse pos to red amt
    color boxcolor = color(255, 0, 0, 150); // color for red ui
    drawUI(width*.2, boxcolor); // call method to draw ui for red
}else{
  strokeWeight(3); // reset stroke
  cursor(ARROW); // reset cursor
}
  if(mouseX > width*.2 + 100 && mouseX < width*.2 + 200 && mouseY > 0 && mouseY < 10) {
    g = map(mouseX, width*.2+101, (width*.2+200), 60, 255);    
    color boxcolor = color(0, 255, 0, 150);
    drawUI(width*.2 + 100, boxcolor);
}
  if(mouseX > width*.2+200 && mouseX < width*.2 + 300 && mouseY > 0 && mouseY < 10) {
    b = map(mouseX, width*.2+201, width*.2+300, 60, 255);    
    color boxcolor = color(0, 0, 255, 150);
    drawUI(width*.2 + 200, boxcolor);
}
  // radomize the cam z pos; gives a radial effect
  camera (float(width/2), float(height/2), random(200,900), width/2, height/2, 0, 0.0, 1.0, 0.0);
  // lighting needs to refresh every frame
  spotLight(255, 255, 255, 0, height * 0.2, 1000, 0, 0, -1, PI/3.5, 2);
  spotLight(255, 255, 255, width, 0, 1000, 0, 0, -1, PI/4, 2);
  spotLight(150, 150, 50, width*.7, height, 1000, 0, 0, -1, PI/4, 2);

for (int i = 0; i < count; i++) { // call movement update and display methods to draw boxes
  bugs[i].move();
  bugs[i].display();
}
  println(int(r) + " " + int(g) + " " + int(b)); // print rgb values and mouse pos; needed while coding
  println(mouseX + " " + mouseY);
  keyPressed();
}

class JitterBug {
  float x; // x, y & z positions
  float y;
  float z;
  int diameter; // size of circle
  float speed = 6; // distance unit used for random movement
  
  JitterBug(float tempX, float tempY, float tempZ, int tempDiameter) { // constructor
    x = tempX;
    y = tempY;
    z = tempZ;
    diameter = int(random(tempDiameter)); // random diameter; uneeded for this rectangle vers
  }
  
  void move() {
    x += random(-speed, speed); // for x, y & z is off screen, bring it back on at random location
    if (x < 0 || x > width - 20) {
      x = random(width * 0.2, width * .8);
    }// END IF
    y += random(-speed, speed);
    if (y < 0 || y > height - 20) {
      y = random(height * 0.2, height * .8);
    }// END IF
    z += random(-speed, speed);
    if (z < 10 || z > 100) {
      z = 50;
    }// END IF
  }// END VOID MOVE
  
  void display() { // draw the form (circle or rect or both)
    fill (random(r), random(g), random(b), 20); // this fill overrides draw() fill
//    fill (random(r*.9, r), random(g*.9, g), random(b*.9,b), 20); // lighter vers
    int xx = int(random(30)); // random units for size of rect and/or circle
    int yy = int(random(50));
    stroke(0, 20);
    pushMatrix();
    translate(0, 0, z);
//    ellipse(x, y, xx, xx);
    rect(x,y, xx, yy);
    popMatrix();
  }// END VOID DISPLAY
}// END JITTERBUG

// method to create color editing interface; pass in x for box and color of fill
void drawUI(float rpos, color boxcolor) {
    noStroke();
    rectMode(CORNER);// easier to work w/ here
    cursor(HAND);// change cursor when over editing area
    camera.beginHUD(); // makes interface stay put
    fill(0); // without this, the box/slider won't update correctly
    rect(rpos, 0, 100, 10);// without this, the box/slider won't update correctly
    fill (boxcolor); // actual box
    rect(rpos, 0, mouseX - rpos, 10); // acutal box
    fill(255);
    camera.endHUD();
}
void keyReleased() { // clear screen by hitting r key
  if(key == 'r') { 
  background(0);
  }
}


