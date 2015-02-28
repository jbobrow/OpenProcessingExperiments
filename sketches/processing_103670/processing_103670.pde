

float halfW, halfH;
float radius;
float spinX, spin;
Coord c[];

//================================================================
 
void setup() {
  size(480, 480, P3D);
  background(0);
  stroke(255);
  fill(32, 255, 64);
  
  halfW = width*0.5;
  halfH = height*0.5;
  radius = height*0.4;
  spinX = 0.0;
  spin = 0.0;
  c = new Coord[2000];
  
  float angle = ((1.0 + sqrt(5))/2.0 - 1)*TWO_PI; // Fibonacci distribution
  for (int i=0; i<c.length; i++) {
    float in = asin(2.0*i/c.length - 1.0); //inclination
    float az = angle*i; //azimuth
    // Too lazy to do this the right way... precalculating both the angles and the coordinates 
    pushMatrix();
      rotateY(az);
      rotateZ(in);
      translate(radius, 0, 0);
      float mx = modelX(0, 0, 0)*.007;
      float my = modelY(0, 0, 0)*.007;
      float mz = modelZ(0, 0, 0)*.007;
      c[i] = new Coord(mx, my, mz, az, in);
    popMatrix();
  }
  
}

//================================================================
 
void draw() {
  background(0);           
  smooth();
  
  if(mousePressed)
    spin -= (mouseX - pmouseX)*0.0001;
  spinX += spin;
  spin *= 0.98;
  
  
  pushMatrix();
    translate(halfW, halfH, -0);
    rotateY(-spinX);
    for (int i = 0; i < c.length; i++) {
      pushMatrix();
        rotateY(c[i].azimuth);
        rotateZ(c[i].altitude);
        translate(radius, 0, 0);
        float dst = (modelZ(0, 0, 0)+halfH)/2 + 32;
        stroke(dst, dst*0.5, dst*0.25);
        float ang = noise4D(c[i].x, c[i].y, c[i].z, frameCount*.007)*TWO_PI; //  <<---  4D Perlin! (x, y, z, time)
        rotateX(ang);
        line(0, 0, 0, 0, 15, 0);
        translate(0, 15, 0);
        rotateX(-10);
        line(0, 0, 0, 0, 4, 0);
        rotateX(20);
        line(0, 0, 0, 0, 4, 0);
      popMatrix();
    }
  popMatrix();
}

//================================================================

class Coord {
  float x, y, z;
  float azimuth, altitude;
  //----------------------------------
  Coord(float mx, float my, float mz, float az, float al) {
    x = mx;
    y = my;
    z = mz;
    azimuth = az;
    altitude = al;
  }
}

