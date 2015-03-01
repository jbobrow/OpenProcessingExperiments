
void setup()
{
  size(600, 600, P3D);
}
void RenderTri(float[][] pos)
{
  float[] posFinal = new float[4];
  strokeWeight(5);
  stroke(0);
  fill(255, 255, 0);
  beginShape();
  for (int i=0; i<3; i++) {
    MatVec3d(Matrix, pos[i], posFinal);
    vertex(posFinal[0], posFinal[1], posFinal[2]);
  }
  endShape(CLOSE);
}

void RenderAxes()
{
  strokeWeight(10);
  stroke(255, 0, 0);
  line(0, 0, 0, 300, 0, 0); // x:red
  stroke(0, 255, 0);
  line(0, 0, 0, 0, 300, 0); // y:green
  stroke(0, 0, 255);
  line(0, 0, 0, 0, 0, 300); // z:blue
}

float roll =0;
float ROLL_STEP = radians(6);
void draw()
{
  background(255);
  translate(width/2, height/2, 0);
  // Define spaceship
  float[][] posOrig = {
    {
      100, 0, 0, 1
    }
    , {
      -100, 0, 0, 1
    }
    , {
      0, 0, -200, 1
    }
  };
  float yaw = map(mouseX, 0, width, -HALF_PI, HALF_PI);
  float pitch = map(mouseY, 0, height, HALF_PI, -HALF_PI);
  if (keyPressed) {
      if (key == 'r') roll += ROLL_STEP;
  }
  ResetMatrix(); 
  RenderAxes();
  RotateY(yaw);
  RotateX(pitch);
  RotateZ(roll);
  // Render spaceship in 3D space
  RenderTri(posOrig);
  // print info
  println("roll: " + degrees(roll) + " pitch: " + degrees(pitch) + " yaw: " + degrees(yaw));
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
 for (int i=0;i<4; ++i)
 for (int j=0;j<4; ++j)
 dst[i][j] = src[i][j];
}
void ResetMatrix()
{
 // Reset Matrix to Identity matrix
 for (int i=0;i<4;i++) {
 for (int j=0;j<4;j++) {
 if (i==j) Matrix[i][j] = 1;
 else Matrix[i][j] = 0;
 }
 }
}
void Translate(float xTerm, float yTerm, float  zTerm) 
{ 
 float[][] matTrans = { 
 {  1, 0, 0, xTerm  } 
 , {  0, 1, 0, yTerm } 
 , { 0, 0, 1, zTerm } 
 , {  0, 0, 0, 1} 
 }; 
 float[][] matIn = new float[4][4]; 
 MatCopy3d(Matrix, matIn); 
 MatMult3d(matIn, matTrans, Matrix); 
} 
void Scale(float xTerm, float yTerm, float zTerm) 
{ 
 float[][] matScale = { 
 { xTerm, 0, 0, 0 } 
 , {  0, yTerm, 0, 0 } 
 , { 0, 0, zTerm, 0  } 
 , { 0, 0, 0, 1  } 
 }; 
 float[][] matIn = new float[4][4]; 
 MatCopy3d(Matrix, matIn); 
 MatMult3d(matIn, matScale, Matrix); 
} 

void RotateX(float theta) 
{ 
 float[][] matRot = { 
 { 1, 0, 0, 0 } 
 , { 0, cos(theta), -sin(theta), 0 } 
 , { 0, sin(theta), cos(theta), 0 } 
 , { 0, 0, 0, 1 } 
 }; 
 float[][] matIn = new float[4][4]; 
 MatCopy3d(Matrix, matIn); 
 MatMult3d(matIn, matRot, Matrix); 
} 
void RotateY(float theta) 
{ 
 float[][] matRot = { 
 {  cos(theta), 0, sin(theta), 0 } 
 , { 0, 1, 0, 0 } 
 , {  -sin(theta), 0, cos(theta), 0 } 
 , { 0, 0, 0, 1 }  }; 
 float[][] matIn = new float[4][4]; 
 MatCopy3d(Matrix, matIn); 
 MatMult3d(matIn, matRot, Matrix); 
} 
void RotateZ(float theta)
{ 
 float[][] matRot = { 
 { cos(theta), -sin(theta), 0, 0 } 
 , { sin(theta), cos(theta), 0, 0 } 
 , {  0, 0, 1, 0 } 
 , { 0, 0, 0, 1 } }; 
 float[][] matIn = new float[4][4]; 
 MatCopy3d(Matrix, matIn); 
 MatMult3d(matIn, matRot, Matrix); 
}
