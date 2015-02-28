
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/57633*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// sketch:  retainedMenger.pde
//          
// versions:  v1.0  2012-03-31  inital version by Martin Prout  
//            v2.0  2013-11-15  adapted to run with OpenProcessing v2.1
/**
 * Demonstrate the new OpenProcessing 2.0 feature to define shapes in retained mode!!!
 */

import peasy.*;   // PeasyCam

float angle = 0.0;
float angleStep = PI / 360.0;
final float MIN_SIZE = 20;
boolean whiteMode = false;
int cubeCount = 0;
PShape menger;   // NB: using processing 2.0 syntax to group vertices
PeasyCam cam;
   
void setup() 
{
  size(800, 800, P3D);
  println (">>> retainedMenger <<<");
  cam = new PeasyCam(this, 500);
  menger = createShape(PShape.GROUP);
  createMenger(0, 0, 0, width * 0.4);
  println (cubeCount + " cubes used to create menger cube");
}

void draw() 
{
  background(20, 20, 200);
  noStroke();
  if (whiteMode)
    lights();         // white cube
  else defineLights();
  render();
}

void keyPressed()
{
   if (key == 's') save ("retainedMenger.png");
   if (key == ' ') whiteMode = !whiteMode;
}

void render() 
{
  angle = (angle + angleStep) % TWO_PI;
  rotateZ(angle);
  rotateY(angle);
  shape(menger);
}
 
/**
 * A recursive function creates and stores custom cubes
 * to menger PShape.GROUP. Requires processing 2.1
 * @param x
 * @param y
 * @param z
 * @param sz
 */
 
void createMenger(float xx, float yy, float zz, float sz) 
{
  float u = sz / 3;
  if (sz < MIN_SIZE)    // recursion limited by minimum cube size
  { noStroke();
    menger.addChild(createCube(xx, yy, zz, sz)); // create and add a cube
  }
  else 
  { for (int i = -1; i <= 1; i++) 
      for (int j = -1; j <= 1; j++) 
        for (int k = -1; k <= 1; k++) 
          if ((abs(i) + abs(j) + abs(k)) > 1) 
            createMenger(xx + (i * u), yy + (j * u), zz + (k * u), u);
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
 
PShape createCube(float xx, float yy, float zz, float sz) 
{
  cubeCount++;
  float s1 = -sz * 0.5;
  float s2 = +sz * 0.5;
  
  PShape cube = createShape();
  cube.beginShape(QUADS);
  
  // Front face
  cube.fill(255);
  cube.normal(0, 0, 1);
  cube.vertex(s1 + xx, s1 + yy, s1 + zz);
  cube.vertex(s2 + xx, s1 + yy, s1 + zz);
  cube.vertex(s2 + xx, s2 + yy, s1 + zz);
  cube.vertex(s1 + xx, s2 + yy, s1 + zz);
 
  // Back face
  cube.normal(0, 0, -1);
  cube.vertex(s1 + xx, s1 + yy, s2 + zz);
  cube.vertex(s2 + xx, s1 + yy, s2 + zz);
  cube.vertex(s2 + xx, s2 + yy, s2 + zz);
  cube.vertex(s1 + xx, s2 + yy, s2 + zz);
 
  // Left face
  cube.normal(1, 0, 0);
  cube.vertex(s1 + xx, s1 + yy, s1 + zz);
  cube.vertex(s1 + xx, s1 + yy, s2 + zz);
  cube.vertex(s1 + xx, s2 + yy, s2 + zz);
  cube.vertex(s1 + xx, s2 + yy, s1 + zz);
 
  // Right face
  cube.normal(-1, 0, 0);
  cube.vertex(s2 + xx, s1 + yy, s1 + zz);
  cube.vertex(s2 + xx, s1 + yy, s2 + zz);
  cube.vertex(s2 + xx, s2 + yy, s2 + zz);
  cube.vertex(s2 + xx, s2 + yy, s1 + zz);
 
  // Top face
  cube.normal(0, 1, 0);
  cube.vertex(s1 + xx, s1 + yy, s1 + zz);
  cube.vertex(s2 + xx, s1 + yy, s1 + zz);
  cube.vertex(s2 + xx, s1 + yy, s2 + zz);
  cube.vertex(s1 + xx, s1 + yy, s2 + zz);
 
  // Bottom face
  cube.normal(0, -1, 0);
  cube.vertex(s1 + xx, s2 + yy, s1 + zz);
  cube.vertex(s2 + xx, s2 + yy, s1 + zz);
  cube.vertex(s2 + xx, s2 + yy, s2 + zz);
  cube.vertex(s1 + xx, s2 + yy, s2 + zz);
  cube.endShape();
  return cube;
}
 
void defineLights() 
{
  // Orange point light on the right
  pointLight (150, 100, 0,    // Color
              200, -150, 0);  // Position
 
  // Blue directional light from the left
  directionalLight (0, 102, 255,    // Color
                    1, 0, 0);       // The x-, y-, z-axis direction
 
  // Yellow spotlight from the front
  spotLight (255, 255, 109,  // Color
             0, 40, 200,     // Position
             0, -0.5, -0.5,  // Direction
             PI / 2, 2);     // Angle, concentration
  ambient(50);    // may be able to set finish by shape in future?
  specular(30);   // not sure is working here
}




