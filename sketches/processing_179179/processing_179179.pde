
int WIDTH = 500;
int HEIGHT = 500;
int cellSize=5;

int[][] state;
int MaxLifeW = WIDTH/cellSize;
int MaxLifeH= HEIGHT/cellSize;
int posX;
int posY;
int direction;

void setup(){
  size(500, 500);
  frameRate(100);
  smooth();
  background(255);
  posX = int(random(15))+int(MaxLifeW/2)-10;
  posY = int(random(15))+int(MaxLifeH/2)-10;
  direction=int (random(4));
  state=new int[MaxLifeH][MaxLifeW];
  for (int i=0; i<MaxLifeH; i++){
    for (int j=0;j<MaxLifeW;j++){
      state[i][j]=0;
    }
  }
}

void draw(){
  for (int i=0; i<MaxLifeH; i++){
    for (int j=0; j<MaxLifeW; j++){
      if (state[i][j]==1){
        fill(255,110,125 );
      }
      else{
        fill(255);
      }
      stroke(255);
      rect(j*cellSize, i*cellSize, cellSize, cellSize);
      if (j==posX && i==posY){
          fill(125,125,100);
          noStroke();
          rect(j*cellSize,i*cellSize, cellSize,cellSize);
      }       
    }
  } 
  state=nextGen(state, direction, posX, posY);
}

int[][] nextGen(int[][] s, int dir, int X, int Y){
  int[][] temp=s; 
  int tempDir=direction;
  int [] tempPos={posX, posY};
  for (int i=0;i<MaxLifeH;i++){
    for (int j=0;j<MaxLifeW;j++){
      if (i==posY && j==posX){
        if (s[i][j]==1){
          temp[i][j]=0; //flip color
          tempDir=atBlack(dir, X, Y); 
        }
        else{
          temp[i][j]=1; //flip color
          tempDir=atWhite(dir, X,Y);
        }
        tempPos=forward(tempDir,X,Y);
      }
    }
  }
  s=temp;
  direction=tempDir;
  posX=tempPos[0];
  posY=tempPos[1];
  return s;
}

//turn right and move forward, flip color
//direction 0,1,2,3 as North, West, South, East
//when reaching the wall, randomly generate new direction

int atWhite(int dir, int X, int Y){
  if ((X>=MaxLifeH-1 && (dir+3)%4==3)||(X==0 && (dir+3)%4==1)||
     (Y>=MaxLifeW-1 && (dir+3)%4==2) || (Y==0 && (dir+3)%4==0)){
    dir=int(random(4));
  }
  else{ 
    dir=(dir+3)%4;
  }
  return dir;
}
// turn left and move forward
int atBlack(int dir, int X, int Y){
  if ((X>=MaxLifeH-1 && (dir+1)%4==3)||(X==0 && (dir+1)%4==1)||
     (Y>=MaxLifeW-1 && (dir+1)%4==2) || (Y==0 && (dir+1)%4==0)){
    dir=int(random(4));
  }
  else{
    dir=(dir+1)%4;
  }
  return dir;
}

int[] forward(int dir, int X, int Y){
  int[] pos =new int[2];
  if (dir==0){
    if (Y>0){
      Y--;
    }
  }
  else if (dir==1){
    if(X>0){
      X--;
    }
  }
  else if (dir==2){
    if (Y<MaxLifeH-1){
      Y++;
    }
  }
  else if (dir==3){
    if (X<MaxLifeW-1){
      X++;
    }
  }
  pos[0]=X;
  pos[1]=Y;
  return pos; 
}




