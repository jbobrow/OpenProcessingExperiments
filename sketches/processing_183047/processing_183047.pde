
int LENGTH = 50;
int DEG = 2;

Cube theCube;
 
void setup(){
  size(500, 500, P3D);
  theCube = new Cube();
 
}
 
void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(-0.5);
  rotateY(0.5);
    theCube.display();

}
 
class Cube{
  PVector[][][] squareMatrix;
  int[][] colorTable = {{255, 0, 0}, {255, 127, 0}, {0, 0, 255}, {0, 255, 0}, {255, 255, 0}, {255, 255, 255}};

     
  Cube(){
    
   squareMatrix = new PVector[6][9][4];
       for(int i = 0; i<3; i++)
         for(int j = 0; j<3; j++){
           squareMatrix[0][i*3+j][0] = new PVector((i-1.5)*LENGTH, (j-1.5)*LENGTH, 1.5*LENGTH);
           squareMatrix[0][i*3+j][1] = new PVector((i-1.5)*LENGTH, (j-1.5+1)*LENGTH, 1.5*LENGTH);
           squareMatrix[0][i*3+j][2] = new PVector((i-1.5+1)*LENGTH, (j-1.5+1)*LENGTH, 1.5*LENGTH);
           squareMatrix[0][i*3+j][3] = new PVector((i-1.5+1)*LENGTH, (j-1.5)*LENGTH, 1.5*LENGTH);
         }
       for(int i = 0; i<3; i++)
         for(int j = 0; j<3; j++){
           squareMatrix[1][i*3+j][0] = new PVector((i-1.5)*LENGTH, (j-1.5)*LENGTH, -1.5*LENGTH);
           squareMatrix[1][i*3+j][1] = new PVector((i-1.5)*LENGTH, (j-1.5+1)*LENGTH, -1.5*LENGTH);
           squareMatrix[1][i*3+j][2] = new PVector((i-1.5+1)*LENGTH, (j-1.5+1)*LENGTH, -1.5*LENGTH);
           squareMatrix[1][i*3+j][3] = new PVector((i-1.5+1)*LENGTH, (j-1.5)*LENGTH, -1.5*LENGTH);
         }
       for(int i = 0; i<3; i++)
         for(int j = 0; j<3; j++){
           squareMatrix[2][i*3+j][0] = new PVector((i-1.5)*LENGTH, 1.5*LENGTH, (j-1.5)*LENGTH);
           squareMatrix[2][i*3+j][1] = new PVector((i-1.5)*LENGTH, 1.5*LENGTH, (j-1.5+1)*LENGTH);
           squareMatrix[2][i*3+j][2] = new PVector((i-1.5+1)*LENGTH, 1.5*LENGTH, (j-1.5+1)*LENGTH);
           squareMatrix[2][i*3+j][3] = new PVector((i-1.5+1)*LENGTH, 1.5*LENGTH, (j-1.5)*LENGTH);
         }
       for(int i = 0; i<3; i++)
         for(int j = 0; j<3; j++){
           squareMatrix[3][i*3+j][0] = new PVector((i-1.5)*LENGTH, -1.5*LENGTH, (j-1.5)*LENGTH);
           squareMatrix[3][i*3+j][1] = new PVector((i-1.5)*LENGTH, -1.5*LENGTH, (j-1.5+1)*LENGTH);
           squareMatrix[3][i*3+j][2] = new PVector((i-1.5+1)*LENGTH, -1.5*LENGTH, (j-1.5+1)*LENGTH);
           squareMatrix[3][i*3+j][3] = new PVector((i-1.5+1)*LENGTH, -1.5*LENGTH, (j-1.5)*LENGTH);
         }
       for(int i = 0; i<3; i++)
         for(int j = 0; j<3; j++){
           squareMatrix[4][i*3+j][0] = new PVector(1.5*LENGTH, (i-1.5)*LENGTH, (j-1.5)*LENGTH);
           squareMatrix[4][i*3+j][1] = new PVector(1.5*LENGTH, (i-1.5)*LENGTH, (j-1.5+1)*LENGTH);
           squareMatrix[4][i*3+j][2] = new PVector(1.5*LENGTH, (i-1.5+1)*LENGTH, (j-1.5+1)*LENGTH);
           squareMatrix[4][i*3+j][3] = new PVector(1.5*LENGTH, (i-1.5+1)*LENGTH, (j-1.5)*LENGTH);
         }
       for(int i = 0; i<3; i++)
         for(int j = 0; j<3; j++){
           squareMatrix[5][i*3+j][0] = new PVector(-1.5*LENGTH, (i-1.5)*LENGTH, (j-1.5)*LENGTH);
           squareMatrix[5][i*3+j][1] = new PVector(-1.5*LENGTH, (i-1.5)*LENGTH, (j-1.5+1)*LENGTH);
           squareMatrix[5][i*3+j][2] = new PVector(-1.5*LENGTH, (i-1.5+1)*LENGTH, (j-1.5+1)*LENGTH);
           squareMatrix[5][i*3+j][3] = new PVector(-1.5*LENGTH, (i-1.5+1)*LENGTH, (j-1.5)*LENGTH);
         }
  }
   
  void display(){
    for(int i = 0; i<6; i++){
      fill(colorTable[i][0],colorTable[i][1],colorTable[i][2]);
      for(int j = 0; j<9; j++){
          beginShape(QUAD);
            vertex(squareMatrix[i][j][0].x,squareMatrix[i][j][0].y,squareMatrix[i][j][0].z);
            vertex(squareMatrix[i][j][1].x,squareMatrix[i][j][1].y,squareMatrix[i][j][1].z);
            vertex(squareMatrix[i][j][2].x,squareMatrix[i][j][2].y,squareMatrix[i][j][2].z);
            vertex(squareMatrix[i][j][3].x,squareMatrix[i][j][3].y,squareMatrix[i][j][3].z);
          endShape();
        }
    }
  }
} 

