

void setup() {
  size(600, 600, P3D);
}

float RECT_SZ = 16;
int ANGLE_STEP=15;

float theta=0, y;
float h=0;

float cx=width/2, cy=height/2;

void draw() {
  background(0);
  y=mouseY;
  

  if (mousePressed) {
    float offset=map(mouseX, 0, width, 0, 180);
    float R=width/2;

    for (float t=0; t<360; t+=ANGLE_STEP) {
      colorMode(HSB, 360 ,100, 100);
      fill(0, 0, 100);
      theta=radians(t+offset);
      float x=R*sin(theta);
      float z=R*cos(theta);
      ResetMatrix();
      Translate(width/2, 0, 0);
      Translate(x, y, z);
      RotateY(theta);
      DrawRect(-RECT_SZ/2, -RECT_SZ/2, RECT_SZ, RECT_SZ);
    }
    
    if (mouseX%50==0){
      h=map(mouseX,0,width,0,360);
    }
    
    /*for (float d=0; d<height-100; d+=70) {
      for (int i=0; i<5; i++) {
        float rM=map(mouseY, 0, height, (height/2)-d, (height/2)+d);
        fill(255, 50, 50);
        rect(width/2, rM, 50, 100);
      }
    }*/
  }
  
  // Draw Box
    pushMatrix();
    translate(width/2, height/2, 0);
    strokeWeight(2);
    fill(h, 100, 100);
    rotateY(-0.5);
    box(100);
    popMatrix();
}

  void DrawRect(float leftX, float upperY, float sizeX, float sizeY) {
    float[][] pos= {
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
        leftX, upperY+ sizeY, 0, 1
      }
    };
    float [] posFinal=new float[4];
    beginShape();
    for (int i=0; i<4; i++) {
      MatVec3d(Matrix, pos[i], posFinal);
      vertex(posFinal[0], posFinal[1], posFinal[2]);
    }
    endShape(CLOSE);
  }
void MatMult3d(float[][] a, float[][] b, float[][] out) {
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


