
int[][] cell;
int num = 40;
int cs = 10;

void setup(){
  background(0);
  size(num*cs, num*cs);
  cell = new int[num][num];
  for(int i=0; i<num; i++){
    for(int j=0; j<num; j++){
      cell[i][j] = 0;
    }
  }

//最初のランダム
  for(int i=1; i<num-1; i++){
    for(int j=1; j<num-1; j++){
      cell[i][j] = int(random(0,2));
    }
  }
  noStroke();
  frameRate(20);
}

void draw(){
  fill(0,0,0,20);
  rect(0,0,width,height); 
  int[][] temp = new int[num][num];
  
  for(int i=1; i<num-1; i++){
    for(int j=1; j<num-1; j++){
      int total = cell[i-1][j-1] + cell[i][j-1] + cell[i+1][j-1] + cell[i-1][j] + cell[i+1][j] + cell[i-1][j+1] + cell[i][j+1] + cell[i+1][j+1];
      if(total < 2){
        temp[i][j] = 0;
      }else if(total == 2){
        temp[i][j] = cell[i][j];
      }else if(total == 3){
        temp[i][j] = 1;
      }else{
        temp[i][j] = 0;
      }
    }
  }
  
  cell = temp;//cellにtempをコピー
  
  for(int i=1; i<num-1; i++){
    for(int j=1; j<num-1; j++){
      if(cell[i][j] == 1){
        fill(255,0,200,100);
        rect(i*cs,j*cs,cs,cs);
      }
    }
  }
}

void mousePressed(){
  for(int i=1; i<num-1; i++){
    for(int j=1; j<num-1; j++){
      cell[i][j] = int(random(0,2));
    }
  }  
}

