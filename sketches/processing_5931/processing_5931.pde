
// acd 20091110
// Moebius. a moebius strip in 3d

public static final float RAD = 250;      // major radius
public static final int SEGMENTS = 72;  // number of segments
public static final float SIZE = 100.0;   // breadth of the strip

float angle = (TWO_PI / SEGMENTS);
float ax = .01;
float ay = .01;
float az = .01;
float dx = .01;
float dy = .01;
float dz = .01;
AVector[][] v = new AVector[SEGMENTS][2];

void setup() {
  size(400, 400, P3D);
  fill(color(#444488));
  noStroke();
  
  dx = random(-.02, .02);
  dy = random(-.02, .02);
  dz = random(-.02, .02);
  
  // calculate all points
  AVector v1, v2;
  for (int i = 0 ; i < SEGMENTS ; i++) {
    v1 = new AVector(SIZE, 0.0, 0.0);
    v2 = new AVector(-SIZE, 0.0, 0.0);
    v1.moeb(i);
    v2.moeb(i);
    v[i][0] = v1;
    v[i][1] = v2;
  }
}

void draw() {
  int i;
  
  background(0);

  camera(0, 500, 500, 0, 0, 0, 0, 1, 0);
  rotateX(ax);
  rotateY(ay);
  rotateZ(az);
  ax += dx;
  ay += dy;
  az += dz;
  
  noSmooth();
  beginShape(QUAD_STRIP);
  for (i = 0 ; i < SEGMENTS ; i++) {
    vertex(v[i][0].x, v[i][0].y, v[i][0].z);
    vertex(v[i][1].x, v[i][1].y, v[i][1].z);
  }
  // do last (same as first, only twisted 180 degrees)
  vertex(v[0][1].x, v[0][1].y, v[0][1].z);
  vertex(v[0][0].x, v[0][0].y, v[0][0].z);
  endShape();

  // do the whole thing again with lines
  smooth();
  strokeWeight(2);
  for (i = 0 ; i < SEGMENTS ; i++) {
    if (i != 0) {
      stroke(0);
      line(v[i][0].x, v[i][0].y, v[i][0].z, v[i - 1][0].x, v[i - 1][0].y, v[i - 1][0].z);
      line(v[i][1].x, v[i][1].y, v[i][1].z, v[i - 1][1].x, v[i - 1][1].y, v[i - 1][1].z);
      noStroke();
    }
  }
  // do last (same as first, only twisted 180 degrees)
  stroke(0);
  line(v[0][1].x, v[0][1].y, v[0][1].z, v[i - 1][0].x, v[i - 1][0].y, v[i - 1][0].z);
  line(v[0][0].x, v[0][0].y, v[0][0].z, v[i - 1][1].x, v[i - 1][1].y, v[i - 1][1].z);
  noStroke();
}

class AVector extends PVector {
  
  float alph = (PI / SEGMENTS);
  
  public AVector(float x, float y, float z) {
    super(x, y, z);
  }
  
  public void moeb(int i) {
    rotateZ(i * PI / SEGMENTS);      // rotate around x - twist
//println("a1[" + i + "] v[" + this.x + "," + this.y + "," + this.z + "]");
    this.x += RAD;        // translate in X
//println("a2[" + i + "] v[" + this.x + "," + this.y + "," + this.z + "]");
    rotateY(i * TWO_PI / SEGMENTS);  // rotate around Y - longitude
//println("a3[" + i + "] v[" + this.x + "," + this.y + "," + this.z + "]");
  }
  
  private void rotateZ(float angle) {
    float c = cos(angle);
    float s = sin(angle);
//println("RZ: A[" + angle + "] C[" + c + "] S[" + s + "]");
    float x1 = this.x;
    float y1 = this.y;
    float z1 = this.z;
//println("RZ0[" + angle + "] v[" + x1 + "," + y1 + "," + z1 + "]");
    float tx = (c * x1) - (s * y1);
    float ty = (s * x1) + (c * y1);
    float tz = z1;
//println("RZ0[" + angle + "] v[" + tx + "," + ty + "," + tz + "]");
    this.set(tx, ty, tz);
  }
  
  private void rotateY(float angle) {
    float c = cos(angle);
    float s = sin(angle);
    float x1 = this.x;
    float y1 = this.y;
    float z1 = this.z;
//println("RY: A[" + angle + "] C[" + c + "] S[" + s + "]");
    float tx = (c * x1) - (s * z1);
    float ty = y1;
    float tz = (s * x1) + (c * z1);
    this.set(tx, ty, tz);
  }
}

void keyPressed() {
  saveFrame("moebius_####.png");
  delay(1000);
}


