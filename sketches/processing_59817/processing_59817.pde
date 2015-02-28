
/*
One Word Visualization

Generates visualization of a single word based on word
characters and length.

See samples:
http://sami.salkosuo.net/visualizing-twitter-accounts-omxh25/
http://sami.salkosuo.net/visualizing-twitter-accounts-djia/

The code is also here:
http://sami.salkosuo.net/one-word-visualization/

Author: 
Sami Salkosuo

*/
String WORD="word";

int frameWidth = 800;
int frameHeight = 800;

int centerX = frameWidth / 2;
int centerY = frameHeight / 2;
float rotateOffset = 0.1;
int frame = 0;
int totalFrames = 500;

PVector lineVector;
PVector colorVector;
List lineVectors = new ArrayList();

PVector zeroV;
public void setup() {
  size(800, 800, P3D);
  background(0);
  colorMode(HSB, 255);

  //calculate seed
  long seed = 1;
  char[] bytes = WORD.toCharArray();
  int len = bytes.length;
  for (int i = 1; i <= len; i++) {
    seed += i * bytes[i - 1] * len;
  }
  randomSeed(seed);
  //create line and color vectors
  if (len < 3) {
    if (len == 2) {
      char b1 = bytes[0];
      char b2 = bytes[1];
      bytes = new char[3];
      bytes[0] = b1;
      bytes[1] = b2;
      bytes[2] = (char)(b1-b2);
    }
    if (len == 1) {
      char b1 = bytes[0];
      bytes = new char[3];
      bytes[0] = b1;
      bytes[1] = (char)(b1*2);
      bytes[2] = (char)(b1/2);
    }
    len = bytes.length;
  }
  float x = bytes[0] + (int) (random(-bytes[0], bytes[0]));
  float y = bytes[1] + (int) (random(-bytes[1], bytes[1]));
  float z = bytes[2] + (int) (random(-bytes[2], bytes[2]));
  float neg = random(-len, len);
  if (neg < 0) {
    x = -x;
  }
  neg = random(-len, len);
  if (neg < 0) {
    y = -y;
  }
  neg = random(-len, len);
  if (neg < 0) {
    z = -z;
  }
  int colorH = 0;
  for (char b : bytes) {
    colorH += b;
  }
  colorH = colorH / 2;
  while (colorH > 255) {
    colorH = colorH / 2;
  }
  if (colorH > 127) {
    if (bytes.length % 2 == 0) {
      colorH = colorH / 2;
    }
  }
  int colorMod1 = 255 - (2 * colorH);
  int colorMod2 = 255 - (2 * bytes[0]);
  int colorS = 255 - colorMod1;
  int colorB = 255 - colorMod2;
  lineVector=new PVector(x, y, z);
  colorVector=new PVector(colorH, colorS, colorB);

  frame=1;
}


public void draw() {
  if (frame >= totalFrames) {
    //draw lines after all individual lines have been drawn
    background(0);
    beginShape(LINES);
    for (int i=1;i<lineVectors.size();i++)
    {
      PVector v=(PVector)lineVectors.get(i);
      stroke(colorVector.x, colorVector.y, colorVector.z);
      vertex(zeroV.x, zeroV.y, zeroV.z);
      vertex(v.x, v.y, v.z);
    }
    endShape();
    noLoop();
    return;
  }

  //draw line
  translate(centerX, centerY);
  float r = rotateOffset * frame;
  rotateY(r);
  rotateX(r);
  rotateZ(r);
  beginShape(LINES);
  stroke(colorVector.x, colorVector.y, colorVector.z);
  vertex(0, 0, 0);
  vertex(lineVector.x, lineVector.y, lineVector.z);
  if (frame==1)
  {
    //do only once
    zeroV=new PVector(modelX(0, 0, 0), modelY(0, 0, 0), modelZ(0, 0, 0));
  }
  float nx = modelX(lineVector.x, lineVector.y, lineVector.z);
  float ny = modelY(lineVector.x, lineVector.y, lineVector.z);
  float nz = modelZ(lineVector.x, lineVector.y, lineVector.z);
  //add line to list
  lineVectors.add(new PVector(nx, ny, nz));

  endShape();

  frame++;
}


