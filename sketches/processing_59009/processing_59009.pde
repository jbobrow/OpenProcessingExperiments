
/**
 * keep 'x', 'y' or 'z' pressed in order to constrain to one of the axis
 * Features use of PShape and PVector cf original
 * @author Martin Prout
 */
import processing.opengl.PGraphics3D;


ArcBall arcball;
int[] colors;

void setup() {
  size(800, 800, P3D);
  colors = new int[] {
    0xffc0c0c0, 0xffffc000, 0xff66c033, 0xff669933, 0xffff9900, 0xff999999
  };
  arcball = new ArcBall(this);
}

void draw() {
  background(0xff66c0ff);
  noFill();
  stroke(2);
  ellipseMode(CENTER);
  lights();   
  translate(width / 2, height / 2, -width / 2);
  arcball.update();
  noStroke();
  cube(320.0f, colors);
}

void cube(float sz, int[] col) {
  sz *= 0.5f;
  PShape3D cube = (PShape3D)createShape(QUADS);
  cube.enableStyle();
  cube.ambient(50f);
  cube.specular(50f);
  // Front face
  cube.fill(col[0]);
  cube.normal(0, 0, 1);
  cube.vertex(-sz, -sz, -sz);
  cube.vertex(+sz, -sz, -sz);
  cube.vertex(+sz, +sz, -sz);
  cube.vertex(-sz, +sz, -sz);

  // Back face
  cube.fill(col[1]);
  cube.normal(0, 0, -1);
  cube.vertex(-sz, -sz, +sz);
  cube.vertex(+sz, -sz, +sz);
  cube.vertex(+sz, +sz, +sz);
  cube.vertex(-sz, +sz, +sz);

  // Left face
  cube.fill(col[2]);
  cube.normal(1, 0, 0);
  cube.vertex(-sz, -sz, -sz);
  cube.vertex(-sz, -sz, +sz);
  cube.vertex(-sz, +sz, +sz);
  cube.vertex(-sz, +sz, -sz);

  // Right face
  cube.fill(col[3]);
  cube.normal(-1, 0, 0);
  cube.vertex(+sz, -sz, -sz);
  cube.vertex(+sz, -sz, +sz);
  cube.vertex(+sz, +sz, +sz);
  cube.vertex(+sz, +sz, -sz);

  // Top face
  cube.fill(col[4]);
  cube.normal(0, 1, 0);
  cube.vertex(-sz, -sz, -sz);
  cube.vertex(+sz, -sz, -sz);
  cube.vertex(+sz, -sz, +sz);
  cube.vertex(-sz, -sz, +sz);

  // Bottom face
  cube.fill(col[5]);
  cube.normal(0, -1, 0);
  cube.vertex(-sz, +sz, -sz);
  cube.vertex(+sz, +sz, -sz);
  cube.vertex(+sz, +sz, +sz);
  cube.vertex(-sz, +sz, +sz);
  cube.end();
  shape(cube);
}



