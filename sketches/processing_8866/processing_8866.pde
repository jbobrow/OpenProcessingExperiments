
import peasy.*;
PeasyCam cam;

int LENGTH = 50;
int DEG = 2;
int clock = 0;
int ith = 0;
int faceTurn = 0;
boolean switch1 = false;
String operation = new String();
String solution = new String();

Cube theCube;

void setup(){
  size(500, 500, P3D);
  cam = new PeasyCam(this, width/2, height/2, 0, 350);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(600);
  theCube = new Cube();

}

void draw(){
  background(0);//For dynamically updating the background to eliminate the shadow.
  translate(width/2, height/2);
  rotateX(-0.5);
  rotateY(0.5);
    theCube.display();

    theCube.singleTwist();
}

void keyPressed(){
  if(clock==0){
    if(key=='1') {faceTurn=1;}
    if(key=='2') {faceTurn=2;}
    if(key=='3') {faceTurn=3;}
    if(key=='4') {faceTurn=4;}
    if(key=='5') {faceTurn=5;}
    if(key=='6') {faceTurn=6;}
  }
}

class Cube{
  PVector[][][] squareMatrix;
  int[][] colorTable = {{255, 0, 0}, {255, 127, 0}, {0, 0, 255}, {0, 255, 0}, {255, 255, 0}, {255, 255, 255}};
  /*for scrambling from identity state rather than reading from camera. If change into camera reading mode,
   *this colorTable will be a list contains 54 triples of color for each square, and initialized by a method 
   *which controls camera
  */
    
  Cube(){//The points for each square on the face
   
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
      fill(colorTable[i][0],colorTable[i][1],colorTable[i][2]);//If the surface colors are read from camera, the fill() should be insert in the Shape module
      //opacity property doesn't seem to work on well with fill(), it'll be confusing when alpha applied.
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

  void rTransform(PVector p, int axis, int dir){//Simple rotation transform, dir can be positive or negative
    float temp;
    if(axis == 1){
      temp = p.y;
      p.y = p.y * cos(radians(dir * DEG))- p.z * sin(radians(dir * DEG));
      p.z = temp *sin(radians(dir * DEG))+ p.z * cos(radians(dir * DEG));
    }else if(axis == 2){
      temp = p.x;
      p.x = p.x * cos(radians(dir * DEG))- p.z * sin(radians(dir * DEG));
      p.z = temp *sin(radians(dir * DEG))+ p.z * cos(radians(dir * DEG));
    }else{
      temp = p.x;
      p.x = p.x * cos(radians(dir * DEG))- p.y * sin(radians(dir * DEG));
      p.y = temp *sin(radians(dir * DEG))+ p.y * cos(radians(dir * DEG));
    }
  }

  void rightTwist(){
      for(int i=0; i<6; i++)
        for(int j=0; j<9; j++)
          if((squareMatrix[i][j][0].x>=1.5*LENGTH-1)||(squareMatrix[i][j][1].x>=1.5*LENGTH-1)||(squareMatrix[i][j][2].x>=1.5*LENGTH-1)||(squareMatrix[i][j][3].x>=1.5*LENGTH-1)){
            rTransform(squareMatrix[i][j][0],1,1);
            rTransform(squareMatrix[i][j][1],1,1);
            rTransform(squareMatrix[i][j][2],1,1);
            rTransform(squareMatrix[i][j][3],1,1);
          }
  }

  void leftTwist(){
      for(int i=0; i<6; i++)
        for(int j=0; j<9; j++)
          if((squareMatrix[i][j][0].x<=-(1.5*LENGTH-1))||(squareMatrix[i][j][1].x<=-(1.5*LENGTH-1))||(squareMatrix[i][j][2].x<=-(1.5*LENGTH-1))||(squareMatrix[i][j][3].x<=-(1.5*LENGTH-1))){
            rTransform(squareMatrix[i][j][0],1,-1);
            rTransform(squareMatrix[i][j][1],1,-1);
            rTransform(squareMatrix[i][j][2],1,-1);
            rTransform(squareMatrix[i][j][3],1,-1);
          }
  }

  void bottomTwist(){
      for(int i=0; i<6; i++)
        for(int j=0; j<9; j++)
          if((squareMatrix[i][j][0].y>=1.5*LENGTH-1)||(squareMatrix[i][j][1].y>=1.5*LENGTH-1)||(squareMatrix[i][j][2].y>=1.5*LENGTH-1)||(squareMatrix[i][j][3].y>=1.5*LENGTH-1)){
            rTransform(squareMatrix[i][j][0],2,-1);
            rTransform(squareMatrix[i][j][1],2,-1);
            rTransform(squareMatrix[i][j][2],2,-1);
            rTransform(squareMatrix[i][j][3],2,-1);
          }
  }
  void upTwist(){
      for(int i=0; i<6; i++)
        for(int j=0; j<9; j++)
          if((squareMatrix[i][j][0].y<=-(1.5*LENGTH-1))||(squareMatrix[i][j][1].y<=-(1.5*LENGTH-1))||(squareMatrix[i][j][2].y<=-(1.5*LENGTH-1))||(squareMatrix[i][j][3].y<=-(1.5*LENGTH))){
            rTransform(squareMatrix[i][j][0],2,1);
            rTransform(squareMatrix[i][j][1],2,1);
            rTransform(squareMatrix[i][j][2],2,1);
            rTransform(squareMatrix[i][j][3],2,1);
          }
  }
  
  void frontTwist(){
      for(int i=0; i<6; i++)
        for(int j=0; j<9; j++)
          if((squareMatrix[i][j][0].z>=1.5*LENGTH-1)||(squareMatrix[i][j][1].z>=1.5*LENGTH-1)||(squareMatrix[i][j][2].z>=1.5*LENGTH-1)||(squareMatrix[i][j][3].z>=1.5*LENGTH-1)){
            rTransform(squareMatrix[i][j][0],3,1);
            rTransform(squareMatrix[i][j][1],3,1);
            rTransform(squareMatrix[i][j][2],3,1);
            rTransform(squareMatrix[i][j][3],3,1);
          }
  }
  void backTwist(){
      for(int i=0; i<6; i++)
        for(int j=0; j<9; j++)
          if((squareMatrix[i][j][0].z<=-(1.5*LENGTH-1))||(squareMatrix[i][j][1].z<=-(1.5*LENGTH-1))||(squareMatrix[i][j][2].z<=-(1.5*LENGTH-1))||(squareMatrix[i][j][3].z<=-(1.5*LENGTH-1))){
            rTransform(squareMatrix[i][j][0],3,-1);
            rTransform(squareMatrix[i][j][1],3,-1);
            rTransform(squareMatrix[i][j][2],3,-1);
            rTransform(squareMatrix[i][j][3],3,-1);
          }
  }


  
  void singleTwist(){
      if(clock<45){
        switch(faceTurn){
          case 1:upTwist();clock++;break;
          case 2:bottomTwist();clock++;break;
          case 3:frontTwist();clock++;break;
          case 4:backTwist();clock++;break;
          case 5:leftTwist();clock++;break;
          case 6:rightTwist();clock++;break;
        }
      }else{
        clock=0;
        faceTurn=0;
      }
  }
   
}  

