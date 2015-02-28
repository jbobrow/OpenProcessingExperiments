
int WIDTH = 800;
int HEIGHT = 400;
int cellSize=5;
int[][] state;
int MaxLifeW = WIDTH/cellSize;
int MaxLifeH= HEIGHT/cellSize;
boolean successor;
color c0=color(255,50,70);
color c1=color(255,125,20);
color c2=color(255,245,30);
color c3=color(50, 255, 80);
color c4=color(20,255,180);
color c5=color(70, 80, 255);
color c6=color (205, 50, 255);
int numColor=7;
int threshold=1;
int countSuccessor;



void setup(){
  size( 800, 400);
  //frameRate(int(random(7)+7));
  smooth();
  background(255);
  noStroke();
  int live;
  state=new int[MaxLifeH][MaxLifeW];
  for (int i=0; i<MaxLifeH; i++){
    for (int j=0;j<MaxLifeW;j++){
      live = int(random(700));
      if (live<100){
        state[i][j]=0;
      }
      else if (live >=100 && live <200){
        state[i][j]=1;
      }
      else if (live >=200 && live < 300){
        state[i][j]=2;
      }
      else if (live >=300 && live < 400){
        state[i][j]=3;
      }
      else if (live >=400 && live < 500){
        state[i][j]=4;
      }
      else if (live >=500 && live < 600){
        state[i][j]=5;
      }      
      else{
        state[i][j]=6;
      }
    }
  }
  
}

void draw(){
  frameRate(int(random(5)+25));
  for (int i=0; i<MaxLifeH; i++){
    for (int j=0; j<MaxLifeW; j++){
      if (state[i][j]==0){
        fill(c0);
      }
      else if (state[i][j]==1){
        fill(c1);
      }
      else if (state[i][j]==2){
        fill(c2);
      }
      else if (state[i][j]==3){
        fill(c3);
      }
      else if (state[i][j]==4){
        fill(c4);
      }
      else if (state[i][j]==5){
        fill(c5);
      }   
      else{
        fill(c6);
      }
      //stroke(255);
      rect((j)*cellSize, (i)*cellSize, cellSize, cellSize);
    }
  }
  state=nextGen(state);
}

int[][] nextGen(int[][] s){
  int[][] temp;
  temp=new int[MaxLifeH][MaxLifeW];
  for (int i=0;i<MaxLifeH;i++){
    for (int j=0;j<MaxLifeW;j++){
      if (hasSuccessor(s,i,j)){
        temp[i][j]=(s[i][j]+1)%numColor;
      }
      else{
        temp[i][j]=s[i][j];
      }
    }
  }
  s=temp;
  return s;
}

boolean hasSuccessor(int[][] s, int row, int col){
  successor=false;
  countSuccessor=0;
  for (int r=row-1; r<row+2;r++){
    for (int c=col-1;c<col+2;c++){
      if (r>=0 && c>=0 && r<MaxLifeH && c<MaxLifeW){
        if((s[r][c]==(s[row][col]+1)%4)){
          countSuccessor++;
        }
      }
    }
  }
  if (countSuccessor>=threshold){
    successor=true;
  }
  return successor;  
}


