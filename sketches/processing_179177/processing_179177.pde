
int cellSize=4;
int MaxLifeW=201;//odd number
int WIDTH = cellSize*MaxLifeW;
int HEIGHT = 400;
int MaxLifeH= HEIGHT/cellSize;
int[][] state;
int currentRow=0;
color r=0;
color g=0;
color b=0;
 
void setup(){
  size(804, 400);
  smooth();
  frameRate(10);
  background(255);
  noStroke();
  state=new int[MaxLifeH][MaxLifeW];
  state[0][(MaxLifeW+1)/2-1]=1;
    for (int j=0;j<MaxLifeW;j++){
      if (state[0][j]!=1){
        state[0][j]=0;
      }
    }
}
 
void draw(){
    for (int j=0; j<MaxLifeW; j++){
      if (state[currentRow][j]==0){
        fill(255);
      }
      else if (state[currentRow][j]==1){ 
        fill(r,g,b);
      }
      noStroke();
      rect((j)*cellSize, (currentRow)*cellSize, cellSize, cellSize);
    }
    state=nextGen(state);
}
 
int[][] nextGen(int[][] s){ 
  if(currentRow<MaxLifeH-1){
      currentRow++;
  }
  int[][] temp;
  int preGen=0;
  temp=s;
  for (int j=1;j<MaxLifeW-1;j++){
    preGen=s[currentRow-1][j-1]*4+s[currentRow-1][j]*2+s[currentRow-1][j+1]*1; 
    boolean a=(preGen==4 || preGen==3 || preGen==2||preGen==1);
    if (a){
      temp[currentRow][j]=1;
      if (currentRow<MaxLifeH-1){
        r=preGen*int(random(30)+20);
        g=preGen*int(random(30)+20);
        b=preGen*int(random(30)+20);
      }
    }
    else{
      temp[currentRow][j]=0;
    }
  }
  s=temp;
  return s;
}



