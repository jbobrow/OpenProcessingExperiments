
// sketch:  PG_retainedRGBCube.pde    2012-04-22, 2013-12-27
//          http://openprocessing.org/sketch/59610
// descr.:  A PShape example only for Processing >= v2.0
// see http://codeanticode.wordpress.com/2012/03/26/opengl-in-processing-2-0-alpha-5/

PShape cube;

void setup()
{
  size(400, 400, P3D);
  cube = createColoredCube (0,0,0, 180,
    color (0), color(255,0,0), color (255,255,0), color (0,255,0),
    color (0,0,255), color(255,0,255), color (255), color (0,255,255));
}

void draw() 
{
  background(100);
  translate(width/2, height/2);
  rotateX (mouseY*0.015);
  rotateY (mouseX*0.015);
  shape(cube);
}

// create a colored cube as PShape object 
// at position x,y,z with given edge colors
PShape createColoredCube(float x, float y, float z, float cubeSize,
  color c000, color c100, color c110, color c010,
  color c001, color c101, color c111, color c011)
{
  PShape cube = createShape();   // >= v2.0 only!!!
  cube.beginShape(QUADS);   // >= v2.0 only!!!
  float s1 = -cubeSize * 0.5;
  float s2 = +cubeSize * 0.5;
  cube.noStroke();
  
  // Front face
  cube.fill(255);
  cube.normal(0, 0, 1);
  cube.fill(c000);  cube.vertex(s1 + x, s1 + y, s1 + z);
  cube.fill(c100);  cube.vertex(s2 + x, s1 + y, s1 + z);
  cube.fill(c110);  cube.vertex(s2 + x, s2 + y, s1 + z);
  cube.fill(c010);  cube.vertex(s1 + x, s2 + y, s1 + z);
 
  // Back face
  cube.normal(0, 0, -1);
  cube.fill(c001);  cube.vertex(s1 + x, s1 + y, s2 + z);
  cube.fill(c101);  cube.vertex(s2 + x, s1 + y, s2 + z);
  cube.fill(c111);  cube.vertex(s2 + x, s2 + y, s2 + z);
  cube.fill(c011);  cube.vertex(s1 + x, s2 + y, s2 + z);
 
  // Left face
  cube.normal(1, 0, 0);
  cube.fill(c000);  cube.vertex(s1 + x, s1 + y, s1 + z);
  cube.fill(c001);  cube.vertex(s1 + x, s1 + y, s2 + z);
  cube.fill(c011);  cube.vertex(s1 + x, s2 + y, s2 + z);
  cube.fill(c010);  cube.vertex(s1 + x, s2 + y, s1 + z);
 
  // Right face
  cube.normal(-1, 0, 0);
  cube.fill(c100);  cube.vertex(s2 + x, s1 + y, s1 + z);
  cube.fill(c101);  cube.vertex(s2 + x, s1 + y, s2 + z);
  cube.fill(c111);  cube.vertex(s2 + x, s2 + y, s2 + z);
  cube.fill(c110);  cube.vertex(s2 + x, s2 + y, s1 + z);
 
  // Top face
  cube.normal(0, 1, 0);
  cube.fill(c000);  cube.vertex(s1 + x, s1 + y, s1 + z);
  cube.fill(c100);  cube.vertex(s2 + x, s1 + y, s1 + z);
  cube.fill(c101);  cube.vertex(s2 + x, s1 + y, s2 + z);
  cube.fill(c001);  cube.vertex(s1 + x, s1 + y, s2 + z);
 
  // Bottom face
  cube.normal(0, -1, 0);
  cube.fill(c010);  cube.vertex(s1 + x, s2 + y, s1 + z);
  cube.fill(c110);  cube.vertex(s2 + x, s2 + y, s1 + z);
  cube.fill(c111);  cube.vertex(s2 + x, s2 + y, s2 + z);
  cube.fill(c011);  cube.vertex(s1 + x, s2 + y, s2 + z);

  //cube.end();
  cube.endShape();
  return cube;
}

void keyPressed()
{
  if (key == 's') save ("retainedRGBCube.png");
}



