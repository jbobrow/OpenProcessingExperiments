
void setup()
{
  size(600, 600, P3D);
  colorMode(HSB, 360, 100, 100);
}
float RECT_SZ = 64;
int ANGLE_STEP = 30, Y_STEP = 80;
float deltaSz = 1, targetSz = 1;
float delta = 10, targetDelta = 10;
int selectTheta = 165;
int START_Y = height/2, END_Y = START_Y+Y_STEP*3;
int selectY = START_Y;
float START_T = 15;
void draw()
{

  background(0);
  randomSeed(0);

  if (delta<targetDelta) {
    delta++;
  } else if (delta>targetDelta) delta--;
  float offset =delta;
  println("t:"+mouseY);

  float R = width/2;
  for (float y=0; y<height/2; y += Y_STEP) {

    for (float t=START_T; t< 360+START_T; t += ANGLE_STEP) {
      float theta = radians(t+offset);
      float x = R * sin(theta);
      float z = R * cos(theta);
      ResetMatrix();
      Translate(width/2, 80, width/2);
      Translate(x, y, z);
      RotateY( theta);
      if (t==selectTheta%360 && y == selectY) setStyle(true);
      else setStyle(false);
      fill(random(0, 360), 80, 80);
      DrawRect(-RECT_SZ*deltaSz, -RECT_SZ/2*deltaSz, 
      RECT_SZ*deltaSz*2, RECT_SZ*deltaSz);
    }
  }
}
void setStyle(boolean selected) {
  if (selected) {
    strokeWeight(5);
    stroke(0, 0, 100);
    deltaSz = 1.3;
  } else {
    noStroke();
    deltaSz =1.0;
  }
}
void keyPressed() {
  targetSz = 1;
  if (keyCode == LEFT) {
    selectTheta+=ANGLE_STEP;
    targetDelta-=ANGLE_STEP;
  } else if ( keyCode == RIGHT) {
    selectTheta-=ANGLE_STEP;
    targetDelta+=ANGLE_STEP;
  } else if ( keyCode == UP) {
    if (selectY==START_Y)
      return;
    selectY-=Y_STEP;
  } else if ( keyCode == DOWN){
        if (selectY==END_Y)
      return;
    selectY+=Y_STEP;
  }
}
void DrawRect(float leftX, float upperY, float
sizeX, float sizeY)
{
  float[][] pos = {
    {
      leftX, upperY, 0, 1
    }
    , {
      leftX+sizeX, upperY, 0, 1
    }
    , 
    {
      leftX+sizeX, upperY+sizeY, 0, 1
    }
    , {
      leftX, upperY+sizeY, 0, 1
    }
  };
  float[] posFinal = new float[4];
  beginShape();
  for (int i=0; i<4; i++) {
    MatVec3d(Matrix, pos[i], posFinal);
    vertex(posFinal[0], posFinal[1], posFinal[2]);
  }
  endShape(CLOSE);
}
float[][] Matrix = {
  {
    1, 0, 0, 0
  }
  , {
    0, 1, 0, 0
  }
  , {
    0, 0, 1, 0
  }
  , {
    0, 0, 0, 1
  }
};
void MatMult3d(float[][] a, float[][] b, float[][] out)
{
  // out = a x b
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      float sum=0;
      for (int k=0; k<4; k++) {
        sum += a[i][k] * b[k][j];
      }
      out[i][j] = sum;
    }
  }
}
void MatVec3d(float[][] m, float[] vec, float[] out)
{
  // out = m x vec
  for (int i=0; i<4; i++) {
    float sum=0;
    for (int k=0; k<4; k++) {
      sum += m[i][k] * vec[k];
    }
    out[i] = sum;
  }
}
void MatCopy3d(float[][] src, float[][] dst)
{
  for (int i=0; i<4; ++i)
    for (int j=0; j<4; ++j)
      dst[i][j] = src[i][j];
}
void ResetMatrix()
{
  // Reset Matrix to Identity matrix
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      if (i==j) Matrix[i][j] = 1;
      else Matrix[i][j] = 0;
    }
  }
}
void Translate(float xTerm, float yTerm, float  zTerm)
{
  float[][] matTrans = {
    { 
      1, 0, 0, xTerm
    }
    , { 
      0, 1, 0, yTerm
    }
    , {
      0, 0, 1, zTerm
    }
    , { 
      0, 0, 0, 1
    }
  };
  float[][] matIn = new float[4][4];
  MatCopy3d(Matrix, matIn);
  MatMult3d(matIn, matTrans, Matrix);
}
void Scale(float xTerm, float yTerm, float zTerm)
{
  float[][] matScale = {
    {
      xTerm, 0, 0, 0
    }
    , { 
      0, yTerm, 0, 0
    }
    , {
      0, 0, zTerm, 0
    }
    , {
      0, 0, 0, 1
    }
  };
  float[][] matIn = new float[4][4];
  MatCopy3d(Matrix, matIn);
  MatMult3d(matIn, matScale, Matrix);
}

void RotateX(float theta)
{
  float[][] matRot = {
    {
      1, 0, 0, 0
    }
    , {
      0, cos(theta), -sin(theta), 0
    }
    , {
      0, sin(theta), cos(theta), 0
    }
    , {
      0, 0, 0, 1
    }
  };
  float[][] matIn = new float[4][4];
  MatCopy3d(Matrix, matIn);
  MatMult3d(matIn, matRot, Matrix);
}
void RotateY(float theta)
{
  float[][] matRot = {
    { 
      cos(theta), 0, sin(theta), 0
    }
    , {
      0, 1, 0, 0
    }
    , { 
      -sin(theta), 0, cos(theta), 0
    }
    , {
      0, 0, 0, 1
    }
  };
  float[][] matIn = new float[4][4];
  MatCopy3d(Matrix, matIn);
  MatMult3d(matIn, matRot, Matrix);
}
void RotateZ(float theta)
{
  float[][] matRot = {
    {
      cos(theta), -sin(theta), 0, 0
    }
    , {
      sin(theta), cos(theta), 0, 0
    }
    , { 
      0, 0, 1, 0
    }
    , {
      0, 0, 0, 1
    }
  };
  float[][] matIn = new float[4][4];
  MatCopy3d(Matrix, matIn);
  MatMult3d(matIn, matRot, Matrix);
}

