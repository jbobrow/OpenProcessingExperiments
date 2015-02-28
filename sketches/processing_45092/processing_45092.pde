
int halfW, halfH, depth; //for positioning the camera
float ang, spd; //for slowly spinning
float sz, szPhi; //size
vert v[]; //vertex matrix
boolean bShowIcosa;

//================================================================

void setup() {
  size(600,400, P3D);
  smooth();
  textSize(9);
  textMode(SCREEN);
  
  //some positional variables for translation
  halfW = width/2;
  halfH = height/2;
  depth = halfH/2;
  
  //angle and speed for gentle rotation
  ang = 0.0;
  spd = 0.01;
  
  //rectangle size
  sz = 100; //long edge
  szPhi = sz*(1 + sqrt(5))/2; //short edge (see http://en.wikipedia.org/wiki/Golden_ratio)
  
  //keep track of whether or not the icosahedron is visible
  bShowIcosa = false;
  
  //setup vertex matrix
  v = new vert[12];
  
  //rectangle on x-plane (red)
  v[0] = new vert(0.0, szPhi, sz);
  v[1] = new vert(0.0, szPhi, -sz);
  v[2] = new vert(0.0, -szPhi, sz);
  v[3] = new vert(0.0, -szPhi, -sz);
  
  //rectangle on y-plane (green)
  v[4] = new vert(sz, 0.0, szPhi);
  v[5] = new vert(sz, 0.0, -szPhi);
  v[6] = new vert(-sz, 0.0, szPhi);
  v[7] = new vert(-sz, 0.0, -szPhi);
  
  //rectangle on z-plane (blue)
  v[8] = new vert(szPhi, sz, 0.0);
  v[9] = new vert(szPhi, -sz, 0.0);
  v[10] = new vert(-szPhi, sz, 0.0);
  v[11] = new vert(-szPhi, -sz, 0.0);
}

//================================================================

void draw() {
  //setup the view
  background(200);
  translate(halfW, halfH, -depth);
  rotateX(-.5);
  rotateY(ang);
  
  //some helpful advice
  fill(0);
  text("Click display to toggle icosahedron edges", 15, height-15);
  noFill();
  
  //draw origin
  strokeWeight(.5);
  line(-10, 0, 0, 10, 0, 0);
  line(0, -10, 0, 0, 10, 0);
  line(0, 0, -10, 0, 0, 10);
  
  //draw the rectangles
  stroke(128,0,0);
  box(v[0].x*2, v[0].y*2, v[0].z*2); //uses a vertex (any would work) from the x-plane rectangle (red)
  stroke(0,128,0);
  box(v[4].x*2, v[4].y*2, v[4].z*2); //...from the y-plane rectangle (green)
  stroke(0,0,128);
  box(v[8].x*2, v[8].y*2, v[8].z*2); //...from the z-plane rectangle (blue)
  
  //draw the icosahedron
  strokeWeight(.25);
  stroke(0, 0, 0);
  if (bShowIcosa) 
    for (int i=0; i<12; i++)
      for (int j=0; j<12; j++)
        if (int(vDist(v[i], v[j])) == sz*2)
          vLine(v[i], v[j]);
  
  //bump up the angle for the slow spin
  ang += spd;
}

//================================================================

void mouseReleased() {
  //just toggles the value
  bShowIcosa = !bShowIcosa;
}

//================================================================

void vLine(vert v1, vert v2) {
  //just cuz' I'm lazy...
  line(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z);
}

//================================================================

float vDist(vert v1, vert v2) {
  //...and my line lengths get too long
  return sqrt(sq(v1.x - v2.x) + sq(v1.y - v2.y) + sq(v1.z - v2.z));
}

//================================================================

class vert {
  //simple vertex class to hold the numbers
  float x, y, z;
  vert(float xx, float yy, float zz) {
    x = xx;
    y = yy;
    z = zz;
  }
}

