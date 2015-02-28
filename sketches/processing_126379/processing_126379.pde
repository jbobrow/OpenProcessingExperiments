
/**
 * Author: Zhu Yuhua
 * MineSweeper_v1.2
 * Clone the Mine Sweeper running in(?) Windows
 * Left Click chooses
 * Right Click marks a mine
 * Double Right Click marks a confusion
 */

int[][] MineValue=new int[12][12];
boolean[][] isShow=new boolean[12][12];
int[][] isLock=new int[12][12];
int lock=0;
boolean isOk;
float gameTimer = 0;
int clockMax = 999;

//size & background color
void setup(){
  size(500,600);
  fill(255);
  noStroke();
  rect(0,0,500,500);
  while(checkMine()!=true){
    setMine();
  }
   gameTimer = 0;

}

//Check Mine number
boolean checkMine(){
  int mineCount=0;
  for(int i=1;i<11;i++){
    for(int j=1;j<11;j++){
      if(MineValue[i][j]>99){mineCount+=1;}
    }
  }
  if(mineCount==10){
    return true;
  }
  else
  {
    return false;
  }
}

//set mine
void setMine(){
  for(int x=0;x<=11;x++){
    for(int y=0;y<=11;y++){
      MineValue[x][y]=0;
      isShow[x][y]=false;
      isLock[x][y]=0;
    }
  }
  for(int i=1;i<11;i++){
    int ranX=int(random(1,10));
    int ranY=int(random(1,10));
    if(MineValue[ranX][ranY]==100){
      i-=1;
    }
    else{
      MineValue[ranX][ranY]=100;
      MineValue[ranX-1][ranY-1]+=1;
      MineValue[ranX-1][ranY]+=1;
      MineValue[ranX-1][ranY+1]+=1;
      MineValue[ranX][ranY-1]+=1;
      MineValue[ranX][ranY+1]+=1;
      MineValue[ranX+1][ranY-1]+=1;
      MineValue[ranX+1][ranY]+=1;
      MineValue[ranX+1][ranY+1]+=1;
    }
  }
}

void draw(){
  for(int x=1;x<11;x++){
    for(int y=1;y<11;y++){
      if(isShow[x][y]==false){
        fill(127);
        noStroke();
        rect((x-1)*50+2,(y-1)*50+2,46,46);
        if(isLock[x][y]==1){
          fill(0);
          textSize(40);
          text("L",(x-1)*50+10,(y-1)*50+40);
        }
        if(isLock[x][y]==2){
          fill(230);
          textSize(40);
          text("?",(x-1)*50+10,(y-1)*50+40);
        }
      }
      else{
        fill(240);
        noStroke();
        rect((x-1)*50+2,(y-1)*50+2,46,46);
        if(MineValue[x][y]!=0&&MineValue[x][y]<9)
        {
          textSize(40);
          fill(0);
          text(MineValue[x][y],(x-1)*50+10,(y-1)*50+40);

        }
        else if(MineValue[x][y]>99)
        {
          textSize(40);
          fill(255,0,0);
          text("*",(x-1)*50+10,(y-1)*50+40);
        }
      }
      if(isOk==true){
        lock=5;
        if(MineValue[x][y]>99){
          fill(240);
          strokeWeight(2); 
          stroke(26,134,58);
          rect((x-1)*50+4,(y-1)*50+4,42,42);
          textSize(40);
          fill(26,134,58);
          text("*",(x-1)*50+10,(y-1)*50+40);
        }
      }
    }
  } 
  
  button();
  if(gameTimer < clockMax) gameTimer++;
  text("Time: " + (int)gameTimer/50, 10, 560);
}

void button(){
  fill(239,228,176);
  noStroke();
  rect(360,520,120,60);
  fill(0);
  textSize(25);
  text("Restart",380,560);
}


void show(int x,int y){
  if(isShow[x][y]==false){
    isShow[x][y]=true;
    if(MineValue[x][y]==0&&x!=0&&y!=0&&x!=11&&y!=11){
      show(x-1,y-1);
      show(x-1,y);
      show(x-1,y+1);
      show(x,y-1);
      show(x,y+1);
      show(x+1,y-1);
      show(x+1,y);
      show(x+1,y+1);
    }
    if(MineValue[x][y]>99){
      lock=4;//fail
      for(int i=1;i<11;i++){
        for(int j=1;j<11;j++){
          if(MineValue[i][j]>99){isShow[i][j]=true;}
        }
      }
    }
    if(lock!=4){
      isOk=true;
      for(int i=1;i<11;i++){
        for(int j=1;j<11;j++){
          if(isShow[i][j]==false&&MineValue[i][j]<100){isOk=false;}
        }
      }
    }
  }
}

void restart(){
  setMine();
  lock=0;
  isOk=false;
}




void mousePressed(){
  int x=0;
  int y=0;
  for(int i=0;i<11;i++){
    for(int j=0;j<11;j++){
      if(i*50<mouseX){
        x=i+1;
      }
      if(j*50<mouseY){
        y=j+1;
      }
    }
  }
  if(mouseButton==LEFT){
    if(isLock[x][y]==0&&lock==0){show(x,y);}
  }/*
  if(isShow[x][y]==false){
    if(lock==1){
      isLock[x][y]=1;
      lock=0;}
    if(lock==2){
      isLock[x][y]=2;
      lock=0;
    }
    if(lock==3){
      isLock[x][y]=0;
      lock=0;
    }
  }*/
  if(mouseButton==RIGHT){
    if(isLock[x][y]==0){isLock[x][y]=1;}
    else if(isLock[x][y]==1){isLock[x][y]=2;}
    else if(isLock[x][y]==2){isLock[x][y]=0;}
  }
  if(mouseX>360&&mouseX<480&&mouseY>520&&mouseY<580){
    restart();
  }
}
void keyPressed(){
  if(key == 'R' || key=='r' ){
    restart();
  }
  if(key == 'N' || key=='n' ){
    setup();
  }
}
