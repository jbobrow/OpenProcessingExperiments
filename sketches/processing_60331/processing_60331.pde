
int cellSize = 40;
int[][] nextCell;
int[][] temp;
color cellColor;
int d = 5;

void setup(){
  colorMode(HSB,360, 255, 255);
  size(d*cellSize,d*cellSize);
  background(0,0,255);
  smooth();
  noStroke();
  
  //cell = new int[cellSize][cellSize];
  temp = new int[cellSize][cellSize];
  
  for(int i=0; i<cellSize ; i++){
    for(int j=0; j<cellSize ; j++){
      //cell[i][j]=0;
      temp[i][j]=0;
    }
  }
  
  frameRate(10);
}

void draw(){
  int  thete;
  thete = int(mouseX * 360 / width);
  cellColor = color(thete,255,255);

  fill(0,0,255,150);
  rect(0,0,width,height);
  
  nextCell = new int[cellSize][cellSize];
 
  for(int i=1; i<cellSize-1; i++){
    for(int j=1; j<cellSize-1; j++){
      int sum = temp[i-1][j-1]+temp[i][j-1]+temp[i+1][j-1]+temp[i-1][j]+temp[i+1][j]+temp[i-1][j+1]+temp[i][j+1]+temp[i+1][j+1];
      
      if(temp[i][j]==1){
        if((sum == 3)||(sum == 2)){
          nextCell[i][j]=1;
        }
        if(sum > 3){
          nextCell[i][j]=0;
        }
        if(sum < 2){
          nextCell[i][j]=0;
        }
      }
      if(temp[i][j]==0){
        if(sum==3){
          nextCell[i][j]=1;
        }
        if(sum>3){
          nextCell[i][j]=0;
        }
        if(sum<2){
          nextCell[i][j]=0;
        }
      }
      
    }
  }
  if(mousePressed == true){
    for(int i=1; i<cellSize-1 ; i++){
      for(int j=1; j<cellSize-1 ; j++){
        nextCell[i][j]=int(random(0,2));
      }
    }
  }

  for(int i=1; i<cellSize-1; i++){
    for(int j=1; j<cellSize-1; j++){ 
      if(nextCell[i][j] == 1){
        fill(cellColor);
        ellipse(d*i,d*j,d,d-2);
      }
    }
  }
 
  temp = nextCell; 
}
