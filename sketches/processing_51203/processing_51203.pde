
// Crytallography by R.A. Robertson, March 09. Major problem solving by Bill Morgan
// Update 2011.12

// import processing.opengl.*;

float theta = PI/3;
float thetaV = .005;
int cap = 200; // Array length. Minimum must = 2 to stay in bounds.
Crystal [] crystarray = new Crystal [cap];
int boxCount = 1;
boolean toggleLoop, toggleRotate, toggleBox, toggleSphere, trans;
float scaleY = 1;
int longRez = 4;
int latRez = 2;
float anchorX, anchorY, distX, distY, transX, transY, scaleCrystals = 1, scaleVal = 1;
int swatchIndex = 0, swatchNum = 12;
color crystalColor;
float value, m, loc;

void setup() {
//  size(600, 600, OPENGL);
  size(600, 600, P3D);
  smooth();
  toggleLoop = toggleRotate = toggleBox = toggleSphere = trans = true;  
  crystarray [0] = new Crystal(0, 0, 0);
  colArray[0] = black;
  colArray[1] = white;
  colArray[2] = grey;
  colArray[3] = ruby;
  colArray[4] = orange;
  colArray[5] = citrine;
  colArray[6] = pyrite;
  colArray[7] = emerald;
  colArray[8] = aquamarine;
  colArray[9] = saphire;
  colArray[10] = fluorite;
  colArray[11] = amethyst;
  crystalColor = pyrite;  // Default color.
}

void draw() {
  background(30, 40, 50);
  directionalLight(255, 255, 255, 0.1, 1, -1.5);

  if (mouseY <= 30  && anchorY < 30 && mouseY > 0) {  // Color Picker block.
    stroke(0);
    for (swatchIndex = 0; swatchIndex < swatchNum; swatchIndex++) {
      fill(colArray[swatchIndex]);
      rect(swatchIndex * width/swatchNum, 0, width/swatchNum, 30);
    }
  }

  noStroke();  
  fill(crystalColor);

  pushMatrix();
  translate(width/2, height/2, -150);  // start at center x, y
  rotateX(-PI/8); // View offset from slightly above
  rotateY(theta);  // Steady rotation Y
  theta += thetaV;  
  thetaV = (mousePressed) ? 0 : .005;  // Freeze rotation when clicked.

  rotateY(distX);  // Mouse inputs.
  rotateX(distY);
  if (!keyPressed) {
    trans = true;
  }
  translate(transX, transY);
  scale(scaleVal);

  for ( int i = 0; i < boxCount; i++) {   // Draw all crystals
    crystarray [i].drawIt();
  }

  if (( frameCount % 100 ) == 0) {  // Add a new crystal every 100 frames
    crystarray [boxCount] = new Crystal (random(-40, 40), random(-30, 30), random(-40, 40));
    boxCount++;  // Increment box count
    if (boxCount == cap ) { // Keep array in bounds
      boxCount = cap - 1;
    }
  }
  popMatrix();
}

/* Crystal Class */

class Crystal {

  float x;
  float y;
  float z;
  float s = 1; // Start size.
  float maximum = random (10, 100); // Max size, different each time.
  float tilt = PI/random(4, 8);

  Crystal(float xoff, float yoff, float zoff) {
    x = xoff;
    y = yoff;
    z = zoff;
  }

  void drawIt() {

    translate (x, y, z);

    if (toggleRotate != true) {
      rotateX(tilt); // Optional random tilt
      rotateY(tilt);
    }

    pushMatrix();

    scale(1, scaleY, 1); // Optional elongated axis for crystal spears

    if (toggleBox == true) {
      box(s);
    }

    if (toggleSphere != true) {
      sphereDetail(longRez, latRez);
      sphere(s);
    }

    popMatrix();

    s = s + .05; // Grow crystal.
    if (s > maximum) {
      s = maximum;
    }
  }
}

/* UI */

void keyPressed() {
  if (key == RETURN || key == ENTER || key == ' ') {
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
  if (key == 'r' || key == 'R') {
    if (toggleRotate) {      
      toggleRotate = false;
    }
    else { 
      toggleRotate = true;
    }
  }
  if (key == 'b' || key == 'B') {
    if (toggleBox) {
      toggleBox = false;
    }
    else { 
      toggleBox = true;
    }
  }
  if (key == 's' || key == 'S') {
    if (toggleSphere) {
      toggleSphere = false;
    }
    else { 
      toggleSphere = true;
    }
  }
  if (key == '=' || key == '+') {
    scaleY+= .1;
  }  
  if (key == '-' || key == '_') {
    scaleY-- ;
    scaleY = (scaleY < 1) ? 1 : scaleY;        // Constrain lower value to 1.
  }
  if (key == CODED) {             // Sphere detail and translation.
  if (!toggleSphere) {  // Only execute if sphere is active.
    if (keyCode == UP) {  // Longitude.
      longRez++ ;
    }  
    if (keyCode == DOWN) {
      longRez-- ;
      longRez = (longRez < 3) ? 3 : longRez;        // Constrain lower value to 3.
    }
    if (keyCode == RIGHT) {      //  Latitude.
      latRez++;
    }
    if (keyCode == LEFT) {
      latRez-- ;
      latRez = (latRez < 2) ? 2 : latRez;        // Constrain lower value to 2.
    }
  }
    if (keyCode == SHIFT) {  // Translation toggle.
      trans = false;
    }
    else if (keyCode != SHIFT) {
      trans = true;
    }
  }
}

void mousePressed() {  //  Set reference point for mouse controls.
  anchorX = mouseX;
  anchorY = mouseY;
}
void mouseReleased() {
  anchorY = 0;
}

void mouseDragged() {
  if (mouseButton == LEFT && trans == true) {  // Rotation control.
    distX = (mouseX - anchorX) * .01;
    distY = (mouseY - anchorY) * .01;
  }
  if (mouseButton == LEFT && trans == false) {  // Translate control.
    transX = (mouseX - anchorX) * 1;
    transY = (mouseY - anchorY) * 1;
  }  
  if (mouseButton == RIGHT) {  // Scale control.
    scaleCrystals = (mouseX - anchorX) * .001;
    scaleVal += scaleCrystals;
    scaleVal = constrain(scaleVal, .1, 10);
  }
}
void mouseClicked() {  // Color Picker mouse control.
  if (mouseY <= 30) {
    value = width/swatchNum;
    m = map(value, 0, width, 0, width);
    loc = mouseX/m;
    crystalColor = (colArray[int(loc)]);
  }
}

// Colors:
color[] colArray = new color[12];

color black = color(10, 10, 10, 220);  //  Obsidian, Smokey Quartz, etc.
color white = color(255, 255, 255, 100); // Quartz, Diamond, Halite, etc.
color grey = color(200, 200, 200);  // Galena, etc.
color ruby = color(150, 0, 0, 200);  // Ruby, etc.
color orange = color(250, 100, 0, 200);
color citrine = color(250, 250, 0, 150);  // Citrine, etc.
color pyrite = color(255, 255, 110); // Pyrite, etc.
color emerald = color(0, 130, 50, 150);  // Emerald, etc.
color aquamarine = color(0, 250, 250, 100);
color saphire = color(50, 150, 250, 100);  // Saphire, etc.
color fluorite = color(200, 0, 200, 200);
color amethyst = color(255, 50, 250, 100);

