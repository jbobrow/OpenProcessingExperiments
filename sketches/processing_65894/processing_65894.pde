
import processing.opengl.*;
import peasy.*;

PeasyCam cam;
PFont font;

int NUMBER = 1000;
SurfaceCurve surfaceCurve[] = new SurfaceCurve[NUMBER];

float tx, ty, tz;
float tx2, ty2, tz2;

void setup() {
  size(600, 600, P3D);
  //size(600, 600, OPENGL);
  frameRate(30);
  smooth();
  font = createFont("CourierNewPSMT-48", 12, true);
  cam = new PeasyCam(this, defaultCam[3]);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(2000);
  cam.setRotations(defaultCam[0], defaultCam[1], defaultCam[2]);

  for (int i = 0; i < NUMBER; i++) {
    float lat = random(0,360);
    float lon = random(0,360);
    float lat2 = random(0,360);
    float lon2 = random(0,360);
    // 
    tx = 80 * cos(radians(lat)) * cos(radians(lon));
    ty = 80 * -sin(radians(lat));
    tz = 80 * cos(radians(lat)) * sin(radians(lon));
    // 
    tx2 = 80 * cos(radians(lat2)) * cos(radians(lon2));
    ty2 = 80 * -sin(radians(lat2));
    tz2 = 80 * cos(radians(lat2)) * sin(radians(lon2));
    surfaceCurve[i] = new SurfaceCurve(tx, ty, tz, tx2, ty2, tz2);
  }
}
void draw() {
  background(60, 80, 120);
  strokeWeight(1);
  ////HUD
  cam.beginHUD();
  textMode(SCREEN);
  textFont(font, 12);
  text("FPS: " + (round( frameRate * 10.0f ) / 10.0f), 2, 12);
  cam.endHUD();
  //// world axis
  if (enableAxis == true) {
    noFill();
    stroke(0, 255, 0, 128);
    line(0, 0, 0, 0, -80, 0); // y
    stroke(255, 0, 0, 128);
    line(0, 0, 0, 80, 0, 0);  // x
    stroke(0, 0, 255, 128);
    line(0, 0, 0, 0, 0, 80);  // z
    stroke(255, 50);
    box(10);
  }
  //// world GRID
  if ( enableGrid == true ) {
    stroke(255, 80);
    for (int i = 0; i < 10; i++) {
      int spc = i*50;
      pushMatrix();
      translate(-450/2, 0, -450/2);
      line(spc, 0, 0, spc, 0, 450);  // z
      line(0, 0, spc, 450, 0, spc);  // x
      popMatrix();
    }
  }

  //////// Curve

  noFill();
  for (int i = 0; i < NUMBER; i++) {
    stroke(225, 70, 30);
    strokeWeight(1);
    surfaceCurve[i].renderCurve();
    surfaceCurve[i].renderParticle();
  }
  
  strokeWeight(1);
  stroke(40, 120);
  //fill(40); noStroke();
  sphere(80);

  /*
   stroke(255);
   int rads = 80;
   int degree;
   for( int j = 0; j < 36; j ++) {
   rotateY(radians(10));
   pushMatrix();
   for( int i = 0; i < 45 + 1; i ++) {
   degree = i*4;
   float z = sin(radians(degree)) * rads;
   float y = cos(radians(degree)) * rads;
   point(0, y, z);
   
   }
   popMatrix();
   }
   */
   
} // end of draw()



















