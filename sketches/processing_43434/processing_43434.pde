
Cube[][] cubes;
int sideLen = 40;
int cubesW, cubesH;
float pushBackFactor = .2;
float rt2 = sqrt(2);
float angleX = 0, angleY = 0;
               // roty 0  1  2  3
int[][] faceLookup = {{2, 1, 5, 3},  // rotx = 0
                      {4, 4, 4, 4},  // rotx = 1
                      {5, 3, 2, 1},  // rotx = 2
                      {0, 0, 0, 0}}; // rotx = 3
int[][] faceRotLookup = {{0, 4, 4, 0},
                         {6, 5, 4, 7},
                         {6, 2, 2, 6},
                         {0, 1, 2, 3}};

int[] colComponents = {128, 128, 128};
color myColor;
color[] compColors = {128, 128, 128};
int diameter = 4;
boolean showEdges = false;

void setup()
{
  // sideLen should divide both of these
  size(400, 409, P3D);
  myColor = color(128, 128, 128);
  compColors[0] = color(255, 0, 0);
  compColors[1] = color(0, 255, 0);
  compColors[2] = color(0, 0, 255);
  cubesW = width / sideLen;
  cubesH = height / sideLen;
  cubes = new Cube[cubesW][cubesH];
  for(int i = 0; i < cubesW; ++i)
    for(int j = 0; j < cubesH; ++j)
      cubes[i][j] = new Cube(i * sideLen + sideLen/2, j * sideLen + sideLen/2);
  noStroke();   
  imageMode(CENTER);
  rectMode(CENTER);
}

void keyPressed()
{
  if (key == ' ')
  {
    for(int i = 0; i < cubesW; ++i)
      for(int j = 0; j < cubesH; ++j)
        cubes[i][j].clear();
  }
  if (key == 'e')
  {
    showEdges = !showEdges;
  }
}

void mousePressed()
{
  mouseDragged();
}

void mouseDragged()
{
  // color selection mode
  if (mouseY > height - 9)
  {
    if (mouseX < width - 9)
    {
      colComponents[(int)((height - min(mouseY, height - 1) - 1) / 3.)] = (int)(255. * (mouseX / (width - 9.)));
      myColor = color(colComponents[0], colComponents[1], colComponents[2]);
    }
    else
      diameter = constrain(2 * (int)sqrt(sq(min(mouseX, width) - (width - 3.5)) + sq(min(mouseY, height) - (height - 3.5))), 1, 9);
    return;
  }
  float x = pmouseX, y = pmouseY;
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  float dist = sqrt(sq(dx) + sq(dy));
  if (dist == 0)
    return;
  float invDist = 1. / dist;
  float dirX = dx * invDist;
  float dirY = dy * invDist;
  int d2 = max(1, diameter / 2);
  for(int i = 0; i <= dist - 1; ++i)
  {
    x += dirX;
    y += dirY;
    int iX = (int)x;
    int iY = (int)y;
    for(int j = -d2; j < d2; ++j)
    {
      int myX = iX + j;
      myX = (int)constrain(myX, 0, width - 1);
      for(int k = -d2; k < d2; ++k)
      {
        int myY = iY + k;
        myY = (int)constrain(myY, 0, height - 1 - 10);
        cubes[myX / sideLen][myY / sideLen].recordPoint(myX % sideLen, myY % sideLen);
      }
    }
  }
}

void draw()
{
  background(250);
  for(int i = 0; i < cubesW; ++i)
    for(int j = 0; j < cubesH; ++j)
      cubes[i][j].drawSelf();
  drawColors();
}

void drawColors()
{
  beginShape(QUADS);
  for(int i = 0; i < 3; ++i)
  {
    fill(0);
    vertex(0, height - 3*(i+1));
    vertex(0, height - 3*i);
    fill(compColors[i]);
    vertex(width - 9, height - 3*i);
    vertex(width - 9, height - 3*(i+1));
  }
  endShape();
  float d2 = diameter * .5;
  fill(myColor);
  rect(width - 4, height - 4, diameter, diameter);
}

class Cube
{
  PImage[] faces = {null, null, null, null, null, null};
  int posX, posY;
  boolean rotating = false;
  int rotateDir = 0;  // 0 left, 1 up, 2 right, 3 down
  float rotateTimer = 0;
  float internalRot = 0;
  float rotateTime;
  float idleTime;
  float[] orientation = {0, 0};
  int facing = faceLookup[(int)(orientation[0])][(int)(orientation[1])];
  int faceRot = faceRotLookup[(int)(orientation[0])][(int)(orientation[1])];
  
  Cube(int x, int y)
  {
    rotateTime = random(500, 1000);
    idleTime = random(3000, 20000);
    posX = x;
    posY = y;
    clear();
  }
  
  void clear()
  {
    color c = color(255, 255, 255, 200);
    for(int i = 0; i < 6; ++i)
    {
      faces[i] = createImage(sideLen, sideLen, RGB);
      for(int j = 0; j < sideLen; ++j)
        for(int k = 0; k < sideLen; ++k)
          faces[i].set(j, k, c);
    }
  }
  
  void recordPoint(int x, int y)
  {
    if (rotating)
      return;
    int myX = x, myY = y;
    switch (faceRot)
    {
      case 0:
        myX = x; myY = y; break;
      case 1:
        myX = sideLen - y - 1; myY = x; break;
      case 2:
        myX = sideLen - x - 1; myY = sideLen - y - 1; break;
      case 3:
        myX = y; myY = sideLen - x - 1; break;
      case 4:
        myX = sideLen - x - 1; myY = y; break;
      case 5:
        myX = y; myY = x; break;
      case 6:
        myX = x; myY = sideLen - y - 1; break;
      case 7:
        myX = sideLen - y - 1; myY = sideLen - x - 1; break;
    }
    faces[facing].loadPixels();
    faces[facing].pixels[myY*sideLen + myX] = myColor; 
    faces[facing].updatePixels();
  }
  
  void drawSelf()
  {
    float m = millis();
    pushMatrix();
    translate(posX, posY, -sideLen / 2);
    if (rotateTimer == 0)
      rotateTimer = m;
    if (rotating)
    {
      int orientationIndex = rotateDir % 2 == 0 ? 1 : 0;
      if (rotateTimer == 0)
        rotateTimer = m;
      float rot = ((m - rotateTimer) / rotateTime);
      internalRot = rot == 0 ? 0 : rot - internalRot;
      translate(0, 0, -sin(PI * rot) * rt2 * pushBackFactor * sideLen);
      orientation[orientationIndex] += (orientationIndex + 3 < 5) ? internalRot : -internalRot;
      internalRot = rot;
      if (rot >= 1)
      {
        rotating = false;
        rotateTimer = 0;
        orientation[orientationIndex] = round(orientation[orientationIndex]);
        int[] o = {((int)orientation[0]) % 4, ((int)orientation[1]) % 4};
        facing = faceLookup[o[0]][o[1]];
        faceRot = faceRotLookup[o[0]][o[1]];
      }
    }
    if (!rotating)
    {
      if (rotateTimer == 0)
        rotateTimer = m;
      // time to rotate
      if (idleTime < m - rotateTimer)
      {
        rotateTimer = 0;
        idleTime = random(3000, 20000);
        rotateTime = random(500, 1000);
        rotating = true;
        rotateDir = (int)random(0, 4);
      }
    }
    
    if (showEdges)
    {
      stroke(200);
      fill(255, 255, 255, 0);
    }
    rotateX(orientation[0]*HALF_PI);
    rotateY(orientation[1]*HALF_PI);
    pushMatrix();
    translate(0, 0, sideLen / 2);
    image(faces[2], 0, 0);
    if (showEdges)
      rect(0, 0, sideLen, sideLen);
    translate(0, 0, -sideLen);
    image(faces[5], 0, 0);
    if (showEdges)
      rect(0, 0, sideLen, sideLen);
    popMatrix();
    pushMatrix();
    rotateX(HALF_PI);
    translate(0, 0, sideLen / 2);
    image(faces[0], 0, 0);
    if (showEdges)
      rect(0, 0, sideLen, sideLen);
    translate(0, 0, -sideLen);
    image(faces[4], 0, 0);
    if (showEdges)
      rect(0, 0, sideLen, sideLen);
    popMatrix();
    pushMatrix();
    rotateY(HALF_PI);
    translate(0, 0, sideLen / 2);
    image(faces[3], 0, 0);
    if (showEdges)
      rect(0, 0, sideLen, sideLen);
    translate(0, 0, -sideLen);
    image(faces[1], 0, 0);
    if (showEdges)
      rect(0, 0, sideLen, sideLen);
    popMatrix();
    if (showEdges)
      noStroke();
    popMatrix();
  }
}

