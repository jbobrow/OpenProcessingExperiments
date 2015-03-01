
int WIDTH = 400;
int HEIGHT = 400;
int cellSize=10;

int[][] state;
int MaxLifeW = WIDTH/cellSize;
int MaxLifeH= HEIGHT/cellSize;
int countNeighbor;

//PFont font;

void setup(){
  size( 400, 400);
  smooth();
  background(255);
  int live;
  state=new int[MaxLifeH][MaxLifeW];
  for (int i=0; i<MaxLifeH; i++){
    for (int j=0;j<MaxLifeW;j++){
      live = int(random(100));
      if (live>50){
        state[i][j]=1;
      }
      else{
        state[i][j]=0;
      }
    }
  }
  
}

void draw(){
  frameRate(10);
  color blue=int(random(125))+100;
  color red=int(random(125))+70;
  //color green=int(random(170))+50;
  for (int i=0; i<MaxLifeH; i++){
    for (int j=0; j<MaxLifeW; j++){
      if (state[i][j]==1){
        fill(red,255,blue);
      }
      else{
        fill(255);
      }
      stroke(255);
      rect(j*cellSize, i*cellSize, cellSize, cellSize);
    }
  }
  state=nextGen(state);
}

int[][] nextGen(int[][] s){
  int[][] temp;
  temp=new int[MaxLifeH][MaxLifeW];
  for (int i=0;i<MaxLifeH;i++){
    for (int j=0;j<MaxLifeW;j++){
      if (s[i][j]==1){
        if (neighborNum(s,i,j)<2 || neighborNum(s,i,j)>3){
          temp[i][j]=0;
        }
        else{
          temp[i][j]=1;
        }
      }
      else{
        if (neighborNum(s,i,j)==3){
          temp[i][j]=1;
        }
        else{
          temp[i][j]=0; 
        }
      }
    }
  }
  s=temp;
  return s;
}

int neighborNum(int[][] s, int row, int col){
  countNeighbor=0;
  for (int r=row-1; r<row+2;r++){
    for (int c=col-1;c<col+2;c++){
    //println("row:"+r);
    //println("col:"+c);
      if (r>=0 && c>=0 && r<MaxLifeH && c<MaxLifeW){
        //println("ct:"+s[r][c]); 
        if(s[r][c]==1){
          if (!(r ==row && c ==col)){
            countNeighbor++;
          }
        }
      }
    }
  }
  return countNeighbor;  
}



