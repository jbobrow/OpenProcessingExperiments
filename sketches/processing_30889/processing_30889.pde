
//import processing.opengl.*;

final int circlePoints = 60;
int radius;
int depth = 30;

//angles for angle exploration
float xa, ya, za;
int xl = 0;
int yl = 0;
int timeRunning = 0;
// define points in a matrix instead of a shit-ton of arrays
// define initial array with one extra slice to close the loop
PVector[][] cone = new PVector[depth][circlePoints+1]; 
PFont font;

void setup() {
  frameRate(100);
  font = loadFont("Helvetica-28.vlw"); 
  textFont(font, 28); 
  size(500, 500, P3D);
  radius = 100;
  smooth();
  lights();
  translate(0,0,height);
  xa = 6.5;
  ya = 0;
  za = 0.5;
  
  // define vortex cone points here
  float theta = TWO_PI/circlePoints;
  for(int level = 0; level < depth; level++) {
    for (int i = 0; i < circlePoints+1; i++) { // set up cone points to finish the slice
      float angle = theta * i;
      int radius = (int)pow(level, 1.6);      
      cone[level][i] = new PVector(cos(angle) * radius, level * 10, sin(angle) * radius);
    }
  }
 }

void draw() {
  background(0);
  lights();
  //noStroke();
  // set up the view angle
  ambientLight(0, 255, 255); 
  if (timeRunning < 600) { 
    displayInstructions();
  }
  translate(width/2, yl-30, 0);

  pushMatrix();
  rotateX(xa);
  rotateY(ya);
  rotateZ(za);
  
  for(int m = 0; m < depth-1; m++) {
  beginShape(QUAD_STRIP);
    for (int n = 0; n < circlePoints; n++) {  
      if (n % 2 == 0) {
        fill(0);
      } else {
        fill(255);
      }
      vertex((int)cone[m][n].x, (int)cone[m][n].y, (int)cone[m][n].z);
      vertex((int)cone[m+1][n].x, (int)cone[m+1][n].y, (int)cone[m+1][n].z);
      vertex((int)cone[m][n+1].x, (int)cone[m][n+1].y, (int)cone[m][n+1].z);        
      vertex((int)cone[m+1][n+1].x, (int)cone[m+1][n+1].y, (int)cone[m+1][n+1].z);
    }
  endShape();
  }
  
  ya += 0.005;
  popMatrix();
  timeRunning++;
}

void keyPressed() {
  if (key == 'x') {
    xa += 0.1;
  }
 
  if (key == 'y') {
    ya -= 0.1;
    background(0,0,255);
  }
  
  if (key == 'z') {
    za += 0.1;
  }
  
  if (keyCode == DOWN) {
    yl++;
  } else if (keyCode == UP) {
    yl--;
  } 
}

void displayInstructions() {
  if (timeRunning < 300) { 
    fill(150, 150, 150, 255);
  } else if (timeRunning < 555) {
    fill(150, 150, 150, 255-(timeRunning-300));
  } else {
    fill(0);
  }
      text("press x, y, or z", 20, 480, 0);

}

