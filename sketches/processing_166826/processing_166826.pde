
void setup(){
 size(600,600); 
 noStroke();
}

void draw(){
  translate(300,300);
background(180,30,1);
fill(40,200,10);
float p1[] = {-100,-20,1};
float p2[] = {0,100*sqrt(2)-20,1};
float p3[] = {100,-20,1};

float tMatrix[][]= new float [3][3];
initMatrix(tMatrix);

//Translate(tMatrix,mouseX,mouseY);

float r= map(mouseX,0,width,0,2*PI);


Rotate(tMatrix,r/2);


float s= map(mouseY,0,height,0.1,1);


Scale(tMatrix,2*s,2*s);



float new_p1[] = {0,0,0};
float new_p2[] = {0,0,0};
float new_p3[] = {0,0,0};
MatVec(tMatrix,p1,new_p1);
MatVec(tMatrix,p2,new_p2);
MatVec(tMatrix,p3,new_p3);



beginShape();
vertex(new_p1[0],new_p1[1]);
vertex(20,-20);
vertex(new_p2[0],new_p2[1]);
vertex(0,0);
vertex(new_p3[0],new_p3[1]);
vertex(-20,20);
endShape(CLOSE);

}

// Update tMatrix (transform matrix) with
// tMatrix x transMatrix
void Translate(float[][] tMatrix, float x, float y){
    float[][] transMatrix = {{1, 0, x}, {0, 1, y}, {0, 0, 1}};
    float[][] matIn = new float[3][3];
    MatCopy(tMatrix, matIn);
    MatMult(matIn, transMatrix, tMatrix); 
}


// Update tMatrix (transform matrix) with
// tMatrix x scaleMatrix

void Scale(float[][] tMatrix, float x, float y) {
  float[][] scaleMatrix = {{x,0,0},{0,y,0},{0,0,1}};
  float[][] matIn = new float[3][3];
  MatCopy(tMatrix, matIn);
  MatMult(matIn, scaleMatrix, tMatrix);
}


// Update tMatrix (transform matrix) with
// tMatrix x rotMatrix

void Rotate(float[][] tMatrix, float r){ 
  float[][] rotMatrix = {
  {cos(r), -sin(r), 0},{sin(r), cos(r), 0},{0, 0, 1}
  };
  
  float[][] matIn = new float[3][3];
  MatCopy(tMatrix, matIn);
  MatMult(matIn, rotMatrix, tMatrix); 
}



void initMatrix(float[][] m)
{ 
  // make matrix m an identity matrix!
  for (int i=0; i<3; i++)
  {
    for (int j=0; j<3; j++)
    {
      if (i==j) m[i][j] = 1;
      else m[i][j] = 0;
    }
  }
}


void MatMult(float[][] a, float[][] b, float[][] out)
{ // matrix out = matrix a x matrix b!
  for (int i=0; i<3; i++)
  {
    for (int j=0; j<3; j++)
    {
      float sum=0;
      for (int k=0; k<3; k++) 
      {
        sum += a[i][k] * b[k][j];
      }
        out[i][j] = sum;
     }   
  }
}



void MatVec(float[][] m, float[] v, float[] out)
{ // matrix out = matrix m x vector v!
  for (int i=0; i<3; i++) 
  {
     float sum=0;
     for (int k=0; k<3; k++) 
     {
       sum += m[i][k] * v[k];
     }
  out[i] = sum;
   }
}




void MatCopy(float[][] src, float[][] dst)
{ //copy matrix src to matrix dst!
  for (int i=0;i<3; ++i){
    for (int j=0;j<3; ++j){
      dst[i][j] = src[i][j];
    }
  }
 }
 

