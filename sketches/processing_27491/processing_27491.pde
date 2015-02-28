
//Biham-Middleton-Levine Traffic Model in Processing
//Adapted from the C version I posted on Wikipedia: http://en.wikipedia.org/wiki/User:Purpy_Pupple/BML

boolean one=true;
boolean two=false;
int PERCENT=35;
int H_SIZE=89;//height
int W_SIZE=144;//width
int cellSize=4;
int [] statesone={0,0,0,0,1,1,2,2,2,1,1,1,0,1,1,2,2,2,0,0,0,0,1,1,2,2,2,};//secret sauce
int [] statestwo={0,0,0,1,1,1,0,2,2,0,0,0,1,1,1,0,2,2,2,2,2,1,1,1,0,2,2,};//more secret sauce
int [][] X = new int[H_SIZE][W_SIZE];//to store the current state before it is one's turn to move
int [][] Y = new int[H_SIZE][W_SIZE];//to store the current state before it is two's turn to move
boolean twoorone = one;

int rand(){
  return (int)random(99999999);
}

void trafficroll(boolean oneortwo){
  //"rolls" traffic depending on whose turn it is.
  int a,b,c;//the value of the spot before, at, and after the position you're currently at.
  int mobility=0;//mobility
  if(oneortwo==one){
    for(int i=0;i<H_SIZE;i++){
      for(int j=0;j<W_SIZE;j++){
        a=X[(i-1+H_SIZE)%H_SIZE][j]; b=X[i][j]; c=X[(i+1)%H_SIZE][j];
        Y[i][j]=statesone[c+3*b+9*a];//awesome base three arithmetic!
        if(Y[i][j]>X[i][j]) mobility++;
      }
    }
  }else{
    for(int i=0;i<H_SIZE;i++){
      for(int j=0;j<W_SIZE;j++){
        a=Y[i][(j-1+W_SIZE)%W_SIZE]; b=Y[i][j]; c=Y[i][(j+1)%W_SIZE];
        X[i][j]=statestwo[c+3*b+9*a];//awesome base three arithmetic!
        if(X[i][j]>Y[i][j]) mobility++;
      }
    }
  }
  return;
}

void trafficset(){
  //for initializing the X. Always start with X, not Y!
  int n, xn, yn;
  for(int j=0;j<H_SIZE;j++){
    for(int k=0;k<W_SIZE;k++){
      X[j][k]=0;//initialize everything to zero!
    }
  }
  for(int i=0;i<PERCENT*H_SIZE*W_SIZE/200;i++){
    do{
      n=rand()%(H_SIZE*W_SIZE);
    }while(X[n/W_SIZE][n%W_SIZE]!=0);//find a random place that's empty
    X[n/W_SIZE][n%W_SIZE]=1;         //set that as a one
    do{
      n=rand()%(H_SIZE*W_SIZE);
    }while(X[n/W_SIZE][n%W_SIZE]!=0);//find a random place that's empty
    X[n/W_SIZE][n%W_SIZE]=2;         //set that as a two
  }
  return;
}

void setup(){
  size(W_SIZE*cellSize,(H_SIZE+20)*cellSize);
  trafficset();
  textFont(createFont("Arial",30,true));
  noStroke();
  frameRate(60);
}

void draw(){
  background(0);
  trafficroll(twoorone?one:two);
  for(int j=0;j<H_SIZE;j++){
    for(int k=0;k<W_SIZE;k++){
      if(twoorone){
        fill(Y[j][k]==0?#ffffff:(Y[j][k]==1?#ff0000:#0000ff));//two
      }else{
        fill(X[j][k]==0?#ffffff:(Y[j][k]==1?#ff0000:#0000ff));//one
      }
      rect(k*cellSize,j*cellSize,cellSize,cellSize);
    }
  }
  twoorone=!twoorone;
  fill(#ff0000);
  triangle(cellSize*PERCENT*W_SIZE/100,cellSize*(H_SIZE+10),
    cellSize*(PERCENT*W_SIZE/100-5),cellSize*(H_SIZE+18),
    cellSize*(PERCENT*W_SIZE/100+5),cellSize*(H_SIZE+18));
  text(PERCENT,cellSize*(W_SIZE-40),cellSize*(H_SIZE+18));
}

void mouseDragged(){
  if(mouseY>H_SIZE*cellSize){
    PERCENT=mouseX*100/(W_SIZE*cellSize);
    trafficset();
  }
}

