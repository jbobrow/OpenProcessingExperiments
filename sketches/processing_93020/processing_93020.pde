
/*
Pearlyn Lii
 03/14/13
 ID 3
 Proj C
 
 */

Globe[] globeParticles = new Globe[10]; //declare
float[] goodXs = new float[0];
float[] goodYs = new float[0]; 

int depth = 1000;


void setup() {
  size(1200, 1000, P3D);
  smooth();
  colorMode(HSB, 360, 100, 100);


  //intiate
  for (int i = 0; i<globeParticles.length; i++) { 
    float x = random(width);
    float y = random(height);
    globeParticles[i] = new Globe(int(random(0, width)), int (random(0, height)));
  }
}

void draw() {
  background(0);
  camera(30.0, mouseX, 220.0, // eyeX, eyeY, eyeZ
  0.0, 0.0, 0.0, // centerX, centerY, centerZ
  0.0, 1.0, 0.0); // upX, upY, upZ
  rotateX(frameCount / 200.0);
  rotateZ(frameCount / 200.0);
  for (int i=0; i<globeParticles.length; i++) {
    globeParticles[i].run();
  }
}

class Globe {

  //global variables
  int xpos;
  int ypos;
  int zpos;

  float targetX; 
  float targetY;
  float targetZ;
  float expos;
  float eypos;
  float ezpos;
  float easing;



  //constructor
  Globe(int _xpos, int _ypos) {
    xpos = _xpos;
    ypos = _ypos;
    expos = xpos;
    eypos = ypos;
    ezpos = zpos;

    easing = random(0.008, 0.03);
  }

  //functionalities

  void run() {
    display();
    update();
  }


  void display() {

    translate(width/2000, height/2000, 0);
    stroke(360);
    strokeWeight(.5);
    noFill();
    sphere(expos);
  }


  void update() {

    float nx = noise(millis()/6000.0 + xpos) * width;
    float ny = noise(millis()/4000.0 + ypos) * height;
    float nz = noise(millis()/5000.0 + zpos) * depth;

    if (dist(width/2, height/2, mouseX, mouseY) <= 200) {
      targetX = 200;
      targetY = 200;
      targetZ = 0;
    }
    else {
      targetX = nx;
      targetY = ny;
      targetZ = nz;
    }

    expos += (targetX-expos) * easing; 
    eypos += (targetY-eypos) * easing;
    ezpos += (targetZ-ezpos) *easing;
  }
}



