



import peasy.*;
import processing.opengl.*;

PeasyCam cam;
PMatrix3D currCameraMatrix;
PGraphics3D g3; 

int colorMin = 10;
int colorMax = 250;
int growth = 5; //number of shapes at start

float[][] offArray = new float[1000][3];
float[][] posArray = new float[1000][3];
float speed = 30;

int zaehler = 0;
int frameRateValue = 30;

int myColor = color(0,0,0);



void setup() {
  hint(ENABLE_DEPTH_SORT);
  size(400,300,P3D);
  frameRate(frameRateValue);
  //  background(0);
  g3 = (PGraphics3D)g;
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(5000);
  for (int i=0; i<growth; i++) {
    posArray[i][0] = random(-growth*10,growth*10);
    posArray[i][1] = random(-growth*10,growth*10);
    posArray[i][2] = random(-growth*10,growth*10);
    offArray[i][0] = random(-250,250);
    offArray[i][1] = random(-250,250);
    offArray[i][2] = random(-250,250);
  }
}



void draw() {
  background(255);
  for(int e = 0; e < growth; e++){
    noStroke();
    beginShape(TRIANGLE_FAN);
    fill(colorMin-255,colorMax+200,(128./(float)growth*e+20),colorMin+50);
    for(int i = 0; i < growth; i++){
      vertex(posArray[i][0],posArray[i][1],posArray[i][2]);
    }
  }

  endShape();
  lights();

  for(int i = 0; i < growth; i++){
    pushMatrix();
    offArray[i][0] += 0.03;
    offArray[i][1] += 0.03;
    offArray[i][2] += 0.03;
    posArray[i][0] += (noise(offArray[i][0])) * speed-speed/2.;
    posArray[i][1] += (noise(offArray[i][1])) * speed-speed/2.;
    posArray[i][2] += (noise(offArray[i][2])) * speed-speed/2.;
    translate(posArray[i][0],posArray[i][1],posArray[i][2]);
    smooth();
    scale(2,2,2);
    rotateY(0.5);
    noStroke();
    popMatrix();
  }

  gui();

  // Growth
  if (zaehler > frameRateValue*5) {
    float xAverage=0;
    float yAverage=0;
    float zAverage=0;
    zaehler = 0;
    for(int i=0;i<growth;i++) {
      xAverage += posArray[i][0];
      yAverage += posArray[i][1];
      zAverage += posArray[i][2];
    }
    xAverage /= growth;
    yAverage /= growth;
    zAverage /= growth;
    if (growth < 99) {
      growth++;
      posArray[growth][0] = xAverage;
      posArray[growth][1] = yAverage;
      posArray[growth][2] = zAverage;
      offArray[growth][0] = random(-250,250);
      offArray[growth][1] = random(-250,250);
      offArray[growth][2] = random(-250,250);
    }
  }

  zaehler++;
}


void gui() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  g3.camera = currCameraMatrix;
}















