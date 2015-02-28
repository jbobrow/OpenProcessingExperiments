
int[][] cell;
int[][] skch;
int[][] stus;
int num = 100;
int cs = 5;
 
void setup(){
  background(0);
  colorMode(HSB,100);
  smooth();
  size(num*cs, num*cs);
  cell = new int[num][num];
  for(int i=0; i<num; i++){
    for(int j=0; j<num; j++){
      cell[i][j] = 0;
    }
  }
  skch = new int[num][num];
  stus = new int[num][num];
 
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
  int[][] temp = new int[num][num];//temp生成
 
  for(int i=1; i<num-1; i++){
    for(int j=1; j<num-1; j++){
      int total = cell[i-1][j-1] + cell[i][j-1] + cell[i+1][j-1] + cell[i-1][j] + cell[i+1][j] + cell[i-1][j+1] + cell[i][j+1] + cell[i+1][j+1];
      if(total < 2){//過疎＞死亡
        temp[i][j] = 0;
        stus[i][j]=0;
      }else if(total == 2){//維持
        temp[i][j] = cell[i][j];
        stus[i][j]=1;
      }else if(total == 3){//繁栄＞増える
        temp[i][j] = 1;
        stus[i][j]=2;
      }else{//過密＞死亡
        temp[i][j] = 0;
        stus[i][j]=3;
      }
    }
  }

  cell = temp;//cellにtempをコピー

//stusの内容に合わせてskchを変化させる
  for(int i=1; i<num-1; i++){
    for(int j=1; j<num-1; j++){
      if(stus[i][j] == 0&&skch[i][j]<=13){//過疎＞死亡
        skch[i][j]++;
      }else if(stus[i][j] == 1){//維持

      }else if(stus[i][j] == 2){//繁栄＞増える
        skch[i][j] = 0;
      }else if(stus[i][j] == 3&&skch[i][j]>=0){//過密＞死亡
        skch[i][j]--;
      }
    }
  }

//skchの内容を画面に描き出し
  for(int i=1; i<num-1; i++){
    for(int j=1; j<num-1; j++){
      fill(skch[i][j]*5,100,100);
      rect(i*cs,j*cs,cs,cs);
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


