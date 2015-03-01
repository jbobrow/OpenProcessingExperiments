
PImage img, imgChrome;
boolean isRunning = false, isError = false;
 
void setup()
{
  size(600, 600, P3D);
  img = loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/XScreenSaver_simulating_Windows_XP_BSOD.svg/2000px-XScreenSaver_simulating_Windows_XP_BSOD.svg.png");
  imgChrome = loadImage("http://2.bp.blogspot.com/-llJ_3kO_Ino/TxZdG7mSzGI/AAAAAAAAAhs/rywPVdQPCRc/s640/2.bmp");
}
 
float RECT_SZ = 100;
void draw()
{
 
  background(0);
  stroke(255);
  noFill();
  if (isError) {
    image(img, 0, 0);
  } else if (isRunning) {
    image(imgChrome, 0, 0);
  } else {
    float a;
    if (mouseX < 100 ) a = 90;
    else if (mouseX <300) a = map(mouseX, 100, 300, 90, 0);
    else if (mouseX< 500) a = map(mouseX, 300, 500, 0, -90);
    else a = -90;
 
    ResetMatrix();
    Translate( mouseX, height/2, 0);
    RotateY(radians(a));
    DrawRect(-RECT_SZ/2, -RECT_SZ/2, RECT_SZ, RECT_SZ);
  }
}
 
void mousePressed() {
  if (random(1, 6)<2) {
    isError = true;
  } else
    isRunning =! isRunning;
}
 
void keyPressed() {
  isError = false;
  isRunning = false;
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

