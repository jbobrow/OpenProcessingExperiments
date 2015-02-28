
import peasy.*;

float angle = 0.0;
float angleStep = PI / 360.0;
final float MIN_SIZE = 20;
PShape menger; // NB: using processing 2.0 syntax to group vertices
PeasyCam cam;
   
void setup() {
  size(1000, 1000, P3D);
  cam = new PeasyCam(this, 500);
  menger = createShape(PShape.GROUP);
  createMenger(0, 0, 0, width * 0.4);
}
 
void draw() {
  background(20, 20, 200);
  noStroke();
  lights();
  defineLights();
  render();
}
 
void render() {
  angle = (angle + angleStep) % TWO_PI;
  rotateZ(angle);
  rotateY(angle);
  shape(menger);
}
 
/**
 * A recursive function creates and stores custom cubes
 * to menger PShape.GROUP. Requires processing 2.0a5+
 * @param x
 * @param y
 * @param z
 * @param sz
 */
 
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
 * A function to create a custom cube PShape
 * Requires processing 2.0a5+
 * @param x float centre
 * @param y float centre
 * @param z float centre
 * @param sz size
 */
 
PShape createCube(float xx, float yy, float zz, float sz) {
  PShape cube = createShape(QUADS);
  // Front face
  cube.fill(255);
  cube.normal(0, 0, 1);
  cube.vertex(-sz / 2 + xx, -sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, -sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, +sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(-sz / 2 + xx, +sz / 2 + yy, -sz / 2 + zz);
 
  // Back face
 
  cube.normal(0, 0, -1);
  cube.vertex(-sz / 2 + xx, -sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, -sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, +sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(-sz / 2 + xx, +sz / 2 + yy, +sz / 2 + zz);
 
  // Left face
 
  cube.normal(1, 0, 0);
  cube.vertex(-sz / 2 + xx, -sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(-sz / 2 + xx, -sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(-sz / 2 + xx, +sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(-sz / 2 + xx, +sz / 2 + yy, -sz / 2 + zz);
 
  // Right face
 
  cube.normal(-1, 0, 0);
  cube.vertex(+sz / 2 + xx, -sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, -sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, +sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, +sz / 2 + yy, -sz / 2 + zz);
 
  // Top face
 
  cube.normal(0, 1, 0);
  cube.vertex(-sz / 2 + xx, -sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, -sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, -sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(-sz / 2 + xx, -sz / 2 + yy, +sz / 2 + zz);
 
  // Bottom face
 
  cube.normal(0, -1, 0);
  cube.vertex(-sz / 2 + xx, +sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, +sz / 2 + yy, -sz / 2 + zz);
  cube.vertex(+sz / 2 + xx, +sz / 2 + yy, +sz / 2 + zz);
  cube.vertex(-sz / 2 + xx, +sz / 2 + yy, +sz / 2 + zz);
  cube.end();
  return cube;
}
 
void defineLights() {
  // Orange point light on the right
  pointLight(150, 100, 0, // Color
  200, -150, 0); // Position
 
  // Blue directional light from the left
  directionalLight(0, 102, 255, // Color
  1, 0, 0);    // The x-, y-, z-axis direction
 
  // Yellow spotlight from the front
  spotLight(255, 255, 109, // Color
  0, 40, 200, // Position
  0, -0.5, -0.5, // Direction
  PI / 2, 2);     // Angle, concentration
  ambient(50);    // may be able to set finish by shape in future?
  specular(30);   // not sure is working here
}



