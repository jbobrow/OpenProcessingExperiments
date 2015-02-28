
import processing.opengl.*;
import peasy.*;

PeasyCam cam;
Grid grid;
Planet planet[] = new Planet[3];
PFont font;

int gridSize = 80;

float[][] distance;
int forceMP;


void setup() {
  size(600, 600, P3D);
  //size(600, 600, OPENGL);
  smooth();
  frameRate(30);
  font = createFont("ArialMT-24",48,true);
  cam = new PeasyCam(this, defaultCam[3]);
    cam.setMinimumDistance(50);
    cam.setMaximumDistance(3000);
    cam.setRotations(defaultCam[0], defaultCam[1], defaultCam[2]);
    cam.lookAt(800, 500, 0);
    
  sphereDetail(20); 
  grid = new Grid(gridSize, gridSize, 20);
  distance = new float[gridSize][gridSize];
  /// initialise planet
  for (int i = 0; i < planet.length; i++) {
    float x = random(100,400);
    float y = random(-10,5);
    float z = random(500);
    float r = random(255);
    float g = random(255);
    float b = random(255);
    float mass = random(5,30);
    float orbit_radius = random(100,500);
    float velocity = random(4,10);
    if (i != planet.length - 1) {
      planet[i] = new Planet(x, y, z, r, g, b, mass, orbit_radius, velocity); 
    } else {
      planet[i] = new Planet(0, 0, 0, 200, 50, 30, 50, 0, 0);
    }
  }
  
}
void draw() {
  background(28, 28, 30);
  lights();
  ////HUD
  cam.beginHUD();
    textMode(SCREEN);
    text("FPS",2,12);
    text(round(frameRate),30,12);
  cam.endHUD();
  //// world axis
  if (enableAxis == true) {
    noFill();
    strokeWeight(1);
    stroke(0, 255, 0, 128);
    line(0,0,0, 0, -80, 0); // y
    stroke(255, 0, 0, 128);
    line(0,0,0, 80, 0, 0);  // x
    stroke(0, 0, 255, 128);
    line(0,0,0, 0, 0, 80);  // z
    stroke(255,50);
    box(10);
  }
  //// world GRID
  if ( enableGrid == true ) {
    stroke(255,80);
    for (int i = 0; i < 10; i++) {
      int spc = i*50;
      pushMatrix();
      translate(-450/2, 0, -450/2);
      line(spc,0,0, spc, 0, 450);  // z
      line(0,0,spc, 450, 0, spc);  // x
      popMatrix();
    }
  }
  
  //// render planet
  for (int i = 0; i < planet.length; i++) {
    planet[i].renderPlanet();
  }

  //// update Gravity distortion
  for (int i = 0; i < planet.length; i++) {
    for (int w = 0; w < gridSize; w++) {  // store distance in distance[][] array
      for (int d = 0; d < gridSize; d++) {
        distance[w][d] = dist(planet[i].x,       planet[i].y,       planet[i].z, 
                              grid.ref_px[w][d], grid.ref_py[w][d], grid.ref_pz[w][d]);
        float gForce = (planet[i].gForce + forceMP) - distance[w][d]; // radius subtract distance = force
        if (gForce < -270) gForce = -270;   
                      //                                                grid offset
        grid.setGravity(w, d, ( (pow(abs(gForce), 1.5)/24) + gForce ) + 85 );
      }
    }
  }
  
  //// render grid
  stroke(230, 80, 30, 80);
  noFill();
  grid.renderGrid();

} // end of draw()



















