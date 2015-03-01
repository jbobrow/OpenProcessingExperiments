
void setup() {
  size(600, 600, P3D);
}


float RECT_SZ = 100;
 int SP=10;


void draw() {
  colorMode(HSB,360,100,100);
  background(0,100,0); 
  
  float a;
 
   
  for (int i=0; i<8; i++){
    float p=SP+i*100;
    if (p< 100 ) a = 90;
    else if (p<500) a = map(p, 100, 500, 90, -90); 
    else a = -90;
    ResetMatrix();
    Translate( p, height/2, 0); 
    RotateY(radians(a));
    fill(i*45,100,100);
    DrawRect(-RECT_SZ/2, -RECT_SZ/2, RECT_SZ, RECT_SZ);
 }  
  }


void keyPressed( ){
   if(keyCode == RIGHT) SP+=100;
   else if (keyCode == LEFT) SP-=100;
  
}


void DrawRect(float leftX, float upperY, float sizeX, float sizeY)
{
  float[][] pos = { 
    {
      leftX, upperY, 0, 1
    }
    , {
      leftX+sizeX, upperY, 0, 1
    } 
    , {
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

//////////////////////////////////////////

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
void MatVec3d(float[][] m, float[] vec, float[] out) {
  // out = m x vec
  for (int i=0; i<4; i++) {
    float sum=0;
    for (int k=0; k<4; k++) {
      sum += m[i][k] * vec[k];
    }
    out[i] = sum;
  }
}
void MatCopy3d(float[][] src, float[][] dst) {
  for (int i=0; i<4; ++i) for (int j=0; j<4; ++j) dst[i][j] = src[i][j];
}
void ResetMatrix() {
  // Reset Matrix to Identity matrix 
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      if (i==j) Matrix[i][j] = 1; 
      else Matrix[i][j] = 0;
    }
  }
}
void Translate(float xTerm, float yTerm, float zTerm)
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
void RotateX(float theta) {
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
void RotateY(float theta) {
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
void RotateZ(float theta) {
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
float[][] Matrix = { 
  {
    1, 0, 0, 0
  }
  , 
  {
    0, 1, 0, 0
  }
  , 
  {
    0, 0, 1, 0
  }
  , 
  {
    0, 0, 0, 1
  }
};
