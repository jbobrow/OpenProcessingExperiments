
/**
 * SpaceBoxes
 * Like the Windows starfield screen saver, but boxier
 * Looks pretty cool in fullscreen: Set FULLSCREEN=true and start with "Present" (Ctrl-Shift-R)
 *
 * Joerg Reuter, jore[at]stachelig[dot]de
 * Creative Commons Attribution 3.0 license
 * http://stachelig.de
 */

//import processing.opengl.*;

boolean FULLSCREEN = false;

int MAX_X = FULLSCREEN ? screen.width : 640;
int MAX_Y = FULLSCREEN ? screen.height : 360;

float FAR_Z = -4000.0;
float NEAR_Z = 1000;

int SIZE = 100;
int BLOCK_NUM = 500;

Block[] blocks = new Block[BLOCK_NUM];

void setup() {
//  size(MAX_X, MAX_Y, OPENGL);
  size(MAX_X, MAX_Y, P3D);
  
  camera(0, 0, -90, 0, 0, -100, 0, 1, 0);
  float cameraZ = ((width/2.0) / tan(PI*60.0/360.0));
  // adjusted from perspective() reference to narrow fov
  perspective(PI/4.0, float(width)/height, cameraZ/10.0, cameraZ*10.0);
  
  noStroke();
  shininess(.0010);

  // create boxes
  for(int i=0; i<BLOCK_NUM; i++)
    blocks[i] = new Block();
}

void draw() {
  background(0);
  directionalLight(220, 220, 180, 1, 1, -1);
  directionalLight(50, 80, 120, -1, -1, -1);
  
  // draw boxes
  for(int i=0; i<BLOCK_NUM; i++)
    blocks[i].draw();
}

// class to represent a flying box
class Block {
  float x, y, z;
  float rotX, rotY, rotZ;
  float speed, size;
  int t; // time, used for movement & rotation
  
  Block() {
    rebirth();
    z = random(FAR_Z, NEAR_Z);
  }
  
  void draw() {
      z+=speed;
      if(z>NEAR_Z) {
        rebirth();
      } else {
        pushMatrix();
        translate(x, y, z);
        rotateX(t*rotX);
        rotateY(t*rotY);
        rotateZ(t*rotZ);
        
        // far away boxes fade out
        fill(constrain(abs(FAR_Z-z)/10.0, 0, 255), 255);
        
        box(size, size, size);
        popMatrix();
        t++;
      }
  }
  
  void rebirth() {
    float dist = random(SIZE+SIZE/2, abs(FAR_Z)/3);
    float deg = random(PI*2);
    x = sin(deg)*dist;
    y = cos(deg)*dist;
    z = FAR_Z;
    t = 0;
    rotX=random(.025);
    rotY=random(.025);
    rotZ=random(.025);
    speed=random(8.0, 30.0);
    size=random(SIZE/4, SIZE);
  }
}


