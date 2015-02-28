
//import fullscreen.*;
//import japplemenubar.*;

int BSIZE = 10;
boolean[][] mat;

//FullScreen fs;

void setup(){
  background(0);
  size(900,450);

//  fs = new FullScreen(this);
//  fs.setFullScreen(true);
  
  mat = new boolean[width/BSIZE][height/BSIZE];
  for(int i=0; i<width/BSIZE; i++){
    for(int j=0; j<height/BSIZE; j++){
      mat[i][j] = false;
    }
  }
  

  
  frameRate(5);
}

void update(){
  boolean[][] tmpMat = new boolean[width/BSIZE][height/BSIZE];
  for(int i=1; i<width/BSIZE-1; i++){
    for(int j=1; j<height/BSIZE-1; j++){
      int num = 0;
      if(mat[i][j]){
        num++;
      }
      if(mat[i+1][j]){
        num++;
      }
      if(mat[i][j+1]){
        num++;
      }
      if(mat[i-1][j]){
        num++;
      }
      if(mat[i][j-1]){
        num++;
      }
      tmpMat[i][j] = (num%2 == 0);
    }
  }
  
/*  if(mousePressed){
    tmpMat[mouseX/BSIZE][mouseY/BSIZE] = !tmpMat[mouseX/BSIZE][mouseY/BSIZE];
  }*/
  mat = tmpMat;
}

void draw(){
  update();
  background(0);
  for(int i = 0; i<width/BSIZE; i++){
    for(int j = 0; j<height/BSIZE; j++){
      if(mat[i][j])  drawRect(i,j);
    }
  }
  //ellipse(255,0,10,10);
}

void  drawRect(int x, int y){
  fill(255);
  noStroke();
  rect(x*BSIZE, y*BSIZE, BSIZE, BSIZE);
}
