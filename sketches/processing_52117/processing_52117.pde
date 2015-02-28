
//import processing.opengl.*;
import controlP5.*;
import peasy.*;

// This sketch is part of a research for the Mediascapes program at SCI-Arc.
//
// HURRICANE DATA: Hurricanes 2005
// Hurricane wind speed over time, data translated to circle shape
// Every circle represents a Hurricane in 2005 (in order of appearance)
// In search of data patterns...

// Use sliders to control the minimum and maximum mapping values

// MOUSE
// click + drag    : move object around (Peasycam)
//
// KEYS
// d               : show/hide data circles
// m               : show/hide mesh
// h               : show/hide when storm is Hurricane > 95 knots
// j               : show/hide Hurricane lines
// s               : save image


String[] col;
float[][] windSpeed;

int maxPoints = 90;
float[][] xPositions = new float[maxPoints][28];
float[][] zPositions = new float[maxPoints][28];

float minSpeed = 10;
float maxSpeed = 150;

float deg;
int colNumber = 0;

int value1, value2, value3, value4, value5, value6;
boolean mesh = false;
boolean hurricane = false;
boolean hurricaneLines = false;
boolean data = true;

// easycam & controllable sliders & support trick
PeasyCam cam;
ControlP5 controlP5;
PMatrix3D currCameraMatrix;
PGraphics3D g3;

float var1 = 100;
float var2 = 400;
    
void setup() {
  
  size(900, 600, P3D);
  //size(900, 600, OPENGL);
  //background(50);
  
  // set up cam scene & sliders & support trick
  cam = new PeasyCam(this, 450, 300, 500, 100);
  g3 = (PGraphics3D)g;
  controlP5 = new ControlP5(this);
  // draw controllable sliders
  controlP5.addSlider("Minimum radius", 50, 200, 100, 20, 50, 100, 10);
  controlP5.addSlider("Maximum radius", 200, 800, 400, 20, 70, 100, 10);
  controlP5.setAutoDraw(false);
  
  // Load lines in an array
  String[] file = loadStrings("hurricanes_2005.txt");
  
  col = split(file[0], '\t');
  windSpeed = new float[file.length][col.length];
  
  println ("There are " + file.length + " lines");
  println ("There are " + col.length + " columns");



  // Load columns in an array
  for (int i = 0; i < file.length; i++) {
    col = split(file[i],'\t');
    
    windSpeed[i][0] = int(col[1]);
    windSpeed[i][1] = int(col[2]);
    windSpeed[i][2] = int(col[3]);
    windSpeed[i][3] = int(col[4]);
    windSpeed[i][4] = int(col[5]);
    windSpeed[i][5] = int(col[6]);
    windSpeed[i][6] = int(col[7]);
    windSpeed[i][7] = int(col[8]);
    windSpeed[i][8] = int(col[9]);
    windSpeed[i][9] = int(col[10]);
    windSpeed[i][10] = int(col[11]);
    windSpeed[i][11] = int(col[12]);
    windSpeed[i][12] = int(col[13]);
    windSpeed[i][13] = int(col[14]);
    windSpeed[i][14] = int(col[15]);
    windSpeed[i][15] = int(col[16]);
    windSpeed[i][16] = int(col[17]);
    windSpeed[i][17] = int(col[18]);
    windSpeed[i][18] = int(col[19]);
    windSpeed[i][19] = int(col[20]);
    windSpeed[i][20] = int(col[21]);
    windSpeed[i][21] = int(col[22]);
    windSpeed[i][22] = int(col[23]);
    windSpeed[i][23] = int(col[24]);
    windSpeed[i][24] = int(col[25]);
    windSpeed[i][25] = int(col[26]);
    windSpeed[i][26] = int(col[27]);
   
  }
  
  // get min and max values
  //minSpeed = getMinValue(speed);
  //maxSpeed = getMaxValue(speed);
  


}

void draw() {
  
  background(50);
  
  // avoid peasycam slider problem; when mouse is over slider, disable cam
  if (controlP5.window(this).isMouseOver()) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
  
  for (int i = 0; i < windSpeed.length; i++) {
     
    for (int j = 0; j < col.length-1; j++) {
      
      // map to set the height
      float barHeight = map(windSpeed[i][j], minSpeed, maxSpeed, var1, var2);
      //float barHeight = windSpeed[i][j];
    
      stroke(255);
      strokeWeight(1);
      //fill(255-barColor, 0, 80, 150);
      noFill();

      float deg = i*360/windSpeed.length;

      // x and y position in circle
      xPositions[i][j] = width/2+cos(radians(180+deg))*barHeight;
      zPositions[i][j] = sin(radians(180+deg))*barHeight;

    }
  }
  
  
 ////////////////////////// draw the data circles
  
  if (data == true) {
   
  stroke(255);  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][0], -50, zPositions[i][0]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][1], 0, zPositions[i][1]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][2], 50, zPositions[i][2]); 

  }
  endShape(CLOSE);
  
    beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][3], 100, zPositions[i][3]); 

  }
  endShape(CLOSE);
  
    beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][4], 150, zPositions[i][4]); 

  }
  endShape(CLOSE);
  
    beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][5], 200, zPositions[i][5]); 

  }
  endShape(CLOSE);
  
    beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][6], 250, zPositions[i][6]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][7], 300, zPositions[i][7]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][8], 350, zPositions[i][8]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][9], 400, zPositions[i][9]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][10], 450, zPositions[i][10]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][11], 500, zPositions[i][11]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][12], 550, zPositions[i][12]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][13], 600, zPositions[i][13]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][14], 650, zPositions[i][14]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][15], 700, zPositions[i][15]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][16], 750, zPositions[i][16]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][17], 800, zPositions[i][17]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][18], 850, zPositions[i][18]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][19], 900, zPositions[i][19]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][20], 950, zPositions[i][20]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][21], 1000, zPositions[i][21]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][22], 1050, zPositions[i][22]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][23], 1100, zPositions[i][23]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][24], 1150, zPositions[i][24]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][25], 1200, zPositions[i][25]); 

  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {
      vertex(xPositions[i][26], 1250, zPositions[i][26]); 

  }
  endShape(CLOSE);
 
  }
 
 ////////////////////// now connecting with lines
 
  if (mesh == true) { 
  stroke(150);
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][0], -50, zPositions[i][0]);
      vertex(xPositions[i][1], 0, zPositions[i][1]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][1], 0, zPositions[i][1]);
      vertex(xPositions[i][2], 50, zPositions[i][2]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][2], 50, zPositions[i][2]);
      vertex(xPositions[i][3], 100, zPositions[i][3]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][3], 100, zPositions[i][3]);
      vertex(xPositions[i][4], 150, zPositions[i][4]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][4], 150, zPositions[i][4]);
      vertex(xPositions[i][5], 200, zPositions[i][5]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][5], 200, zPositions[i][5]);
      vertex(xPositions[i][6], 250, zPositions[i][6]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][6], 250, zPositions[i][6]);
      vertex(xPositions[i][7], 300, zPositions[i][7]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][7], 300, zPositions[i][7]);
      vertex(xPositions[i][8], 350, zPositions[i][8]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][8], 350, zPositions[i][8]);
      vertex(xPositions[i][9], 400, zPositions[i][9]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][9], 400, zPositions[i][9]);
      vertex(xPositions[i][10], 450, zPositions[i][10]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][10], 450, zPositions[i][10]);
      vertex(xPositions[i][11], 500, zPositions[i][11]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][11], 500, zPositions[i][11]);
      vertex(xPositions[i][12], 550, zPositions[i][12]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][12], 550, zPositions[i][12]);
      vertex(xPositions[i][13], 600, zPositions[i][13]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][13], 600, zPositions[i][13]);
      vertex(xPositions[i][14], 650, zPositions[i][14]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][14], 650, zPositions[i][14]);
      vertex(xPositions[i][15], 700, zPositions[i][15]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][15], 700, zPositions[i][15]);
      vertex(xPositions[i][16], 750, zPositions[i][16]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][16], 750, zPositions[i][16]);
      vertex(xPositions[i][17], 800, zPositions[i][17]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][17], 800, zPositions[i][17]);
      vertex(xPositions[i][18], 850, zPositions[i][18]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][18], 850, zPositions[i][18]);
      vertex(xPositions[i][19], 900, zPositions[i][19]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][19], 900, zPositions[i][19]);
      vertex(xPositions[i][20], 950, zPositions[i][20]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][20], 950, zPositions[i][20]);
      vertex(xPositions[i][21], 1000, zPositions[i][21]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][21], 1000, zPositions[i][21]);
      vertex(xPositions[i][22], 1050, zPositions[i][22]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][22], 1050, zPositions[i][22]);
      vertex(xPositions[i][23], 1100, zPositions[i][23]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][23], 1100, zPositions[i][23]);
      vertex(xPositions[i][24], 1150, zPositions[i][24]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][24], 1150, zPositions[i][24]);
      vertex(xPositions[i][25], 1200, zPositions[i][25]);
  }
  endShape(CLOSE);
  
  beginShape();
  for (int i = 0; i < windSpeed.length; i++) {

      vertex(xPositions[i][25], 1200, zPositions[i][25]);
      vertex(xPositions[i][26], 1250, zPositions[i][26]);
  }
  endShape(CLOSE);
  
  } 
  
  if (hurricane == true) {
    
  for (int i = 0; i < windSpeed.length; i++) {
    for (int j = 0; j < col.length; j++) {
      if (windSpeed[i][j] > 95) {
        stroke(255);
        strokeWeight(5);
        point(xPositions[i][j], -50+j*50, zPositions[i][j]);
      }
    }
  }
  
  }
  
  if (hurricaneLines == true) {
    
  for (int i = 0; i < windSpeed.length; i++) {
    for (int j = 0; j < col.length; j++) {
      if (windSpeed[i][j] > 95) {
        stroke(255);
        strokeWeight(1);
        line(xPositions[i][j], -50+j*50, zPositions[i][j], 450, -50+j*50, 0);
      }
    }
  }
  
  }
  
  
 gui();
 
}


/*

// loop through array to get the min value

float getMinValue(float[] getData) {
 
  float minValue = getData[0];

  for (int i = 0; i < getData.length; i++) {
    if(getData[i] < minValue) minValue = getData[i];
  } 
  
  return minValue;
  
}


// loop through array to get the max value

float getMaxValue(float[] getData) {
 
  float maxValue = getData[0];
 
  for (int i = 0; i < getData.length; i++) {
    if(getData[i] > maxValue) maxValue = getData[i];
  } 
  
  return maxValue;
}

*/

void gui() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
  g3.camera = currCameraMatrix; 
}

// set controllable sliders
void controlEvent(ControlEvent theEvent) {
  if (theEvent.controller().name()=="Minimum radius") {
    var1 = theEvent.controller().value(); 
  }
  if (theEvent.controller().name()=="Maximum radius") {
    var2 = theEvent.controller().value(); 
  }
}



void keyPressed() {
  if (key == 'm' || key == 'M') {
    if (value1 == 0) {
      value1 = 1;
      mesh = true; 
    } else if (value1 == 1) {
      value1 = 0;
      mesh = false; 
    }
  }
  if (key == 'h' || key == 'H') {
    if (value3 == 0) {
      value3 = 1;
      hurricane = true; 
    } else if (value3 == 1) {
      value3 = 0;
      hurricane = false; 
    }
  }
  if (key == 'd' || key == 'D') {
    if (value4 == 0) {
      value4 = 1;
      data = false; 
    } else if (value4 == 1) {
      value4 = 0;
      data = true; 
    }
  }
  if (key == 'j' || key == 'J') {
    if (value5 == 0) {
      value5 = 1;
      hurricaneLines = true; 
    } else if (value5 == 1) {
      value5 = 0;
      hurricaneLines = false; 
    }
  }
  if (key == 's' || key == 'S') {
    save("3Ddata.tiff"); 
  }
}


