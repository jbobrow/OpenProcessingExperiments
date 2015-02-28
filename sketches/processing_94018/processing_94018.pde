
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/10470*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * sketch:  SpaceBoxes2.pde
 *
 * Like the Windows starfield screen saver, but boxier.
 * Looks pretty cool in fullscreen: 
 *   Set FULLSCREEN=true and start sketch with Ctrl-Shift-R
 *
 * original sketch by Joerg Reuter, Creative Commons Attribution 3.0 license
 * see http://stachelig.de/processing/SpaceBoxes/index.html
 */

int SIZE = 80;
int BLOCK_NUM = 800;
float FAR_Z = -4000.0;
float NEAR_Z = 1000;

Block[] blocks = new Block[BLOCK_NUM];

boolean FULLSCREEN = false;

void setup() 
{
  if (!FULLSCREEN) 
    size(800, 600, P3D);
  else
//    size (displayWidth, displayHeight, P3D);  // v2.0
    size(screen.width, screen.height, P3D);
    
  //frameRate = 120;
  camera(0, 0, -90, 0, 0, -100, 0, 1, 0);
  float cameraZ = ((width/2.0) / tan(PI*60.0/360.0));
  // adjusted from perspective() reference to narrow fov
  perspective(PI/4.0, float(width)/height, cameraZ/10.0, cameraZ*10.0);

  smooth();
  noStroke();
  shininess(0.01);

  // create boxes
  for (int ni=0; ni<BLOCK_NUM; ni++)
    blocks[ni] = new Block();
  background(0);
}

void draw()
{
  int ccc = 150+int(55*sin(frameCount*0.01));
  directionalLight(220, 220, 180, 1, 1, -1);
  directionalLight(50, 80, 120, -1, -1, -1);
  directionalLight(150, ccc, 120, 1, -1, -1);

  // draw boxes
  for (int ni=0; ni<BLOCK_NUM; ni++)
    blocks[ni].draw();
}

void keyPressed()
{ save ("screenshot.png");}

// class to represent a flying box
class Block 
{
  float x, y, z, rotX, rotY, rotZ;
  float speed, boxSize, sizeX, sizeY, sizeZ;
  int t; // time, used for movement & rotation

  Block() 
  { rebirth(); }

  void draw() 
  {
    z+=speed;
    if (z>NEAR_Z) 
    {
      rebirth();
    } 
    else 
    {
      pushMatrix();
      translate(x, y, z);
      rotateX(t*rotX);
      rotateY(t*rotY);
      rotateZ(t*rotZ);

      // far away boxes fade out
      fill(constrain(abs(FAR_Z-z)/20.0, 0, 255), 44);
      box(sizeX, sizeY, sizeZ);
      popMatrix();
      t++;
    }
  }

  void rebirth() 
  {
    float dist = random(SIZE, abs(FAR_Z)/3);
    float deg = random(PI*2);
    x = sin(deg)*dist;
    y = cos(deg)*dist;
    z = FAR_Z;
    t = 0;
    rotX=random(0.01);
    rotY=random(0.05);
    rotZ=random(0.01);
    speed=random(0.8, 8.0);
    boxSize=random(SIZE/4, SIZE);
    sizeX=random(SIZE/4, SIZE);
    sizeY=random(SIZE/4, SIZE);
    sizeZ=random(SIZE/4, SIZE);
  }
}


