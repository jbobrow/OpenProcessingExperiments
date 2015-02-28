
/*
 * A sketch designed to exploit some of the latest PShape syntax
 * of processing 2.0 alpha, demonstrates grouping with shape primitives
 * of BOX and SPHERE use mousewheel to zoom, drag mouse to rotate.
 * This was sketch run using processing-2.0a6.
 */


ArcBall arcball;
final float MIN_SIZE = 100;
PShape menger; // NB: using processing 2.0 syntax to group shapes


void setup() {
  size(1000, 800, P3D);
  smooth(16);
  menger = createShape(PShape.GROUP);
  menger.enableStyle();                // allows direct setting of shape color/texture
  createMenger(0, 0, 0, width * 0.8);
  arcball = new ArcBall(this);
} 

void draw() {
  background(20, 20, 200);
  noStroke();
  lights();
  defineLights();
  translate(width / 2, height / 2, -width / 2);
  arcball.update();
  shape(menger);
}


void createMenger(float xx, float yy, float zz, float sz) {
  float u = sz / 3;
  if (sz < MIN_SIZE) { // recursion limited by minimum cube size
    noStroke();
    menger.addChild(createCube(xx, yy, zz, sz)); // create and add a cube
  } 
  else {
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        for (int k = -1; k <= 1; k++) {
          if ((abs(i) + abs(j) + abs(k)) > 1) {
            createMenger(xx + (i * u), yy + (j * u), zz + (k * u), u);
          }
        }
      }
    }
  }
}

/**
 * My stochastic shape creator, attempting to create shiny metallic balls and
 * regular cubes matt finish (like the "cube" I created with StructureSynth)
 * I found I needed explicitly use PShape3D to access material finish....  
 */

PShape createCube(float xx, float yy, float zz, float sz) {
  PShape cube;
  if (random(1.0f) < 0.8f) {
    cube = (PShape3D)createShape(BOX, sz);           // New
    cube.fill(100, 100, 200);
    cube.ambient(30);  // to use material need to be PShape3D
  } 
  else {
    cube = (PShape3D)createShape(SPHERE, sz * 0.5);  // New
    cube.fill(200, 100, 100);
    cube.shininess(20);  // to use material need to be PShape3D
    cube.ambient(10);
    cube.specular(20);
  }
  cube.translate(xx, yy, zz);
  return cube;
}

void defineLights() {
  lightSpecular(80, 80, 80);
  directionalLight(80, 80, 80, 0, 0, -1);
  ambientLight(50, 50, 50);
}


