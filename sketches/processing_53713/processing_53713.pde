
/*****************************************
 * Assignment 04
 * Name:         Warren Schwartz
 * E-mail:       wschwart@haverford.edu
 * Course:       CS 110 - Section 02
 * Submitted:    2/27/12
 * 
 This sketch depicts a bomber leveling a few houses.
 Click the mouse to drop a bomb. There can only be
 so many bombs on the screen at once. Remember to
 keep your airspeed up or your plane will stall and
 crash (fly plane by moving mouse). I made use of
 the template on the assignment web page, so some of
 the comments are basically the same.
 ***********************************************/

class Bomb {

  // the object's x-coordinate
  int x;

  // the object's y-coordinate
  int y;
  int yprev;

  // vertical speed
  float vspeed;

  // gravity
  float gravity = 0.2;

  //time
  int t = int(200/(vertexSpacing*0.1));

  //stop
  boolean stop = false;

  //hit detection
  boolean hitBuilding = false;

  /** Constructor
   * xTemp is the initial x coordinate of the object
   * yTemp is the initial y coordinate of the object
   */
  Bomb (int xTemp, int yTemp) {
    x = xTemp;
    y = yTemp;
    vspeed = 2;
  }

  //call the function that decides whether or not to draw the object
  void display() {

    // drawing code for your object, with an animation
    for (int i = 0; i < groundXs.length; i ++) {
      if (int(groundYs[i]) - y > 0 && hitBuilding == false) {
        drawBombObject();
      }
      else {
        stop = true;
        if (t > 0) {
          drawExplosion(x, y, random(2));
          t --;
        }
      }
    }
  }

  // the actual object drawing function
  void drawBombObject() {
    smooth();
    strokeWeight(1);
    stroke(0);
    rectMode(CENTER);
    fill(50);
    triangle(x-15, y-41, x+15, y-41, x, y-10);
    fill(70);
    rect(x, y-35, 6, 30);
    fill(50);
    rect(x, y-45, 30, 10);
    fill(90);
    quad(x-10, y-15, x+10, y-15, x+3, y-35, x-3, y-35);
    fill(155, 0, 0);
    arc(x, y+15, 20, 25, 0, PI);
    fill(50);
    rect(x, y, 20, 30);
  }

  //update animation
  void step() {
    if (stop == false) {
      vspeed += gravity;
      y += vspeed;
    }
  }

  void checkHit() {
    if ((dist(x, y, hx1, hy1) < 50 && h1NotHit == true) || (dist(x, y, hx2, hy2) < 50 && h2NotHit == true) || (dist(x, y, hx3, hy3) < 50 && h3NotHit == true)) {
      stop = true;
      hitBuilding = true;
      if (t > 0) {
        drawExplosion(x, y, random(2));
        t --;
      }
    }
  }

  void checkHitGroundVert() {
    for (int i = 0; i <groundXs.length; i ++) {
      if (int(dist(groundXs[i], groundYs[i], x, y)) < 40) {
        groundYs[i] += 25;
        stop = true;
        hitBuilding = true;
        if (t > 0) {
          drawExplosion(x, y, random(2));
          t --;
        }
      }
    }
  }

  //The bombs kept getting stuck to the ground and wouldn't disappear, so I made this function as an admittedly less-than-elegant solution.
  void checkStuck() {
    if (y == yprev) {
      hitBuilding = true;
    }
    yprev = y;
  }
}



// The maximum number of objects that can be displayed at once
int MAX_NUM_OBJECTS = 20;

// An array of all the created objects
Bomb[] bombs = new Bomb[MAX_NUM_OBJECTS];

// An index into the bombs[] array to show where to save the next new bomb  

int idxBombs = 0;

//bomber variables
int lastDirec = 1;
float stallDrop = 0.1;
boolean bomberCrashed = false;

//house 1 vars
int hx1 = 200;
int hy1 = 500;
boolean h1NotHit = true;

//house 2 vars
int hx2 = 400;
int hy2 = 500;
boolean h2NotHit = true;

//house 3 vars
int hx3 = 600;
int hy3 = 500;
boolean h3NotHit = true;

//distance between vertices of ground shape. The spacing must be kept wide, because more vertices seems to have a significant (negative) impact on performance.
int vertexSpacing = 60;

//width and height need to be specified before setup in order for groundXs and groundYs arrays to work
int windowWidth= 800;
int windowHeight = 600;

//Arrays for the x and y coords for the ground shape vertices.
int[] groundXs = new int[int(windowWidth/vertexSpacing)];
int[] groundYs = new int[int(windowWidth/vertexSpacing)];

void setup() {
  noCursor();
  size(windowWidth, windowHeight);
  background(127);

  for (int i = 0; i < groundXs.length; i ++) {
    groundYs[i] = int(height - (height/8));
    groundXs[i] = int(i*vertexSpacing);
  }

  //draw ground
  fill(20);
  beginShape();
  vertex(0, height-(height/8));
  curveVertex(0, height-(height/8));
  for (int i = 0; i <groundXs.length; i ++) {
    curveVertex(groundXs[i], groundYs[i]);
  }
  curveVertex(vertexSpacing+groundXs[groundXs.length-1], height-(height/8));
  vertex(vertexSpacing+groundXs[groundXs.length-1], height);
  vertex(0, height);
  endShape(CLOSE);
}



void draw() {
  background(127);



  //redraw ground
  fill(20);
  beginShape();
  vertex(0, height-(height/8));
  curveVertex(0, height-(height/8));
  for (int i = 0; i <groundXs.length; i ++) {
    curveVertex(groundXs[i], groundYs[i]);
  }
  vertex(width, height-(height/8));
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

  //house1

  if (h1NotHit == true) {
    drawHouse(hx1, hy1);
  }

  //house 1 hit detection  
  for (int i = 0; i < bombs.length; i ++) {
    if (bombs[i] != null) {
      if (dist(hx1, hy1, bombs[i].x, bombs[i].y) < 50) {
        h1NotHit = false;
      }
    }
  }

  //house2

  if (h2NotHit == true) {
    drawHouse(hx2, hy2);
  }

  //house 2 hit detection  
  for (int i = 0; i < bombs.length; i ++) {
    if (bombs[i] != null) {
      if (dist(hx2, hy2, bombs[i].x, bombs[i].y) < 50) {
        h2NotHit = false;
      }
    }
  }

  //house3

  if (h3NotHit == true) {
    drawHouse(hx3, hy3);
  }

  //house 3 hit detection  
  for (int i = 0; i < bombs.length; i ++) {
    if (bombs[i] != null) {
      if (dist(hx3, hy3, bombs[i].x, bombs[i].y) < 50) {
        h3NotHit = false;
      }
    }
  }

  //update bombs
  for (int i = 0; i < bombs.length; i ++) {
    if (bombs[i] != null) {
      bombs[i].step();
      bombs[i].checkHit();
      bombs[i].checkHitGroundVert();
      bombs[i].checkStuck();
      bombs[i].display();
    }
  }


  //draw bomber according to direction mouse is being moved, unless it is stalling or has crashed
  if (bomberCrashed == false) {
    if (pmouseX != mouseX) {
      if (pmouseX < mouseX) {
        drawBomber(mouseX, mouseY, 1);
        lastDirec = 1;
        stallDrop = 0.1;
      }
      else if (pmouseX > mouseX) {
        drawBomber(mouseX, mouseY, -1);
        lastDirec = -1;
        stallDrop = 0.1;
      }
    }
    else {
      drawBomber(mouseX, mouseY+stallDrop, lastDirec);
      stallDrop += 0.1*stallDrop;
      fill(255, 0, 0);
      textSize(22);
      if (bomberCrashed == false) {
        text("STALL", 30, 30);
      }
      if (mouseY+stallDrop > height-10) {
        bomberCrashed = true;
      }
    }
  }
  if (bomberCrashed == true) {
    fill(255, 0, 0);
    text("CRASHED", 30, 30);
  }
}



void mousePressed() {
  // drop a new bomb based on the location clicked, unless the bomber has crashed
  // and store it into bombs[idxBombs]
  // increment the index into bombs[], keeping it in the range 0...MAX_NUM_OBJECTS
  if (bomberCrashed == false) {
    bombs[idxBombs] = new Bomb(mouseX, mouseY+30);
    idxBombs = (idxBombs+1) % MAX_NUM_OBJECTS;
  }
}

//define house drawing function
void drawHouse(int x, int y) {
  smooth();
  rectMode(CENTER);
  fill(200, 200, 100);
  rect(x, y, 50, 50);
  strokeWeight(3);
  fill(255, 255, 0);
  rect(x-10, y-10, 16, 16);
  strokeWeight(1);
  line(x-10, y-17, x-10, y-2);
  line(x-16, y-10, x-3, y-10);
  rectMode(CORNER);
  fill(120, 70, 30);
  rect(x+5, y, 10, 24);
  fill(200, 200, 100);
  rect(x-23, y-56, 7, 20);
  fill(120, 70, 30);
  rect(x-24, y-56, 9, 3);
  fill(120, 70, 30);
  triangle(x-40, y-25, x+40, y-25, x, y-55);
}

//This explosion drawing function is a modified version of something I did in the last assignment
void drawExplosion(float x, float y, float scalefac) {
  float angle = 0;
  color c;
  c = color(random(200, 255), random(200, 235), random(80));
  fill(c);
  stroke(c);
  beginShape();
  curveVertex(x+scalefac*15*cos(angle-(PI/2)), y+scalefac*15*sin(angle-(PI/2)));
  for (angle = 0; angle < (2*PI); angle += (PI/6)) {
    curveVertex(x+scalefac*random(10, 50)*cos(angle), y+scalefac*random(10, 50)*sin(angle));
  }
  curveVertex(x+scalefac*15*cos(angle+(PI/2)), y+scalefac*15*sin(angle+(PI/2)));
  endShape(CLOSE);
  strokeWeight(1);
  stroke(0);
}

//define strategic bomber drawing function
void drawBomber(float x, float y, int direction) {
  strokeWeight(1);
  stroke(0);
  fill(0);
  //fuselage
  beginShape();
  vertex(x, y+13);
  vertex(x-100*direction, y+11);
  vertex(x-143*direction, y+29);
  vertex(x-160*direction, y+30);
  vertex(x-143*direction, y+6);
  vertex(x-161*direction, y+3);
  vertex(x-169*direction, y-2);
  vertex(x-163*direction, y-9);
  vertex(x-148*direction, y-15);
  vertex(x-153*direction, y-61);
  vertex(x-134*direction, y-61);
  vertex(x-95*direction, y-19);
  vertex(x+39*direction, y-24);
  vertex(x+59*direction, y-24);
  vertex(x+78*direction, y-21);
  vertex(x+93*direction, y-11);
  vertex(x+104*direction, y+3);
  vertex(x+98*direction, y+10);
  vertex(x+83*direction, y+14);
  endShape(CLOSE);
  //wings
  beginShape();
  vertex(x+13*direction, y-4);
  vertex(x-56*direction, y-50);
  vertex(x-75*direction, y-50);
  vertex(x-51*direction, y-3);
  vertex(x-80*direction, y+82);
  vertex(x-56*direction, y+83);
  endShape(CLOSE);
  //engines
  rectMode(CENTER);
  rect(x-43*direction, y+38, 60, 15);
  rect(x-41*direction, y-18, 60, 15);
}


