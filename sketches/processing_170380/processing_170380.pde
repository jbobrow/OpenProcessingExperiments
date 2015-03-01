
int num =11;
float delta=0, targetX =0;
float xinc = 5;
void setup() 
{
  size(600, 600, P3D);
  colorMode(HSB, 360);
}
float RECT_SZ = 100;
void draw()
{
  randomSeed(15);
  background(0);
  stroke(255);

  if (targetX<delta) delta-=xinc;
  else if (targetX>delta) delta+=xinc;

  for (int i=0; i<num; i++) {
    float x = map(i, 0, num-1, 0, width)+delta;
    float a, c=255;
    if (x < 100 ) {
      a = 90;
      c=0;
    } else if (x < 300) {
      a = map(x, 100, 300, 90, 0);
      c = map(x, 100, 300, 0, 255);
    } else if (x < 500) {
      a = map(x, 300, 500, 0, -90);      
      c = map(x, 300, 500, 255, 0);
    } else {
      a = -90;
      c =0;
    }


    ResetMatrix();
    Translate( x, height/2, 0);
    RotateY(radians(a));
    fill(random(0, 360), c, c);
    DrawRect(-RECT_SZ/2, -RECT_SZ/2, RECT_SZ, RECT_SZ);
  }
}

void mouseWheel(MouseEvent event){
  float e = event.getCount();
  
  if (e>0) { // Right
    if (targetX<=-width/2)return;
    targetX-=60;
  } else { //Left
    if (targetX>=width/2)return;
    targetX+=60;
  }
  
}
void mousePressed() {

  if (mouseX>width/2) { // Right
    if (targetX<=-width/2 )return;
    targetX-=60;
  } else { //Left
    if (targetX>=width/2)return;
    targetX+=60;
  }
  println(targetX);
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

