
int cord[][]=new int[20][30];
int blockForm[][][]=new int[7][4][4];
int blockFormNo,blockColor;
int x,y;
int time1,time2;
int retry=0;
int score,highScore;
PFont font;
GameDrawing gd;
BlockCtrl bc;
GameCtrl gc;
void setup(){
  size(630,630);
  colorMode(RGB);
  background(0);
  frameRate(30);
  
  blockForm[0][0][0]=1;
  blockForm[0][1][0]=1;
  blockForm[0][1][1]=1;
  blockForm[0][2][1]=1;
  
  blockForm[1][0][0]=1;
  blockForm[1][0][1]=1;
  blockForm[1][1][1]=1;
  blockForm[1][1][2]=1;
  
  blockForm[2][0][0]=1;
  blockForm[2][0][1]=1;
  blockForm[2][1][1]=1;
  blockForm[2][2][1]=1;
  
  blockForm[3][2][0]=1;
  blockForm[3][2][1]=1;
  blockForm[3][1][1]=1;
  blockForm[3][0][1]=1;
  
  blockForm[4][1][0]=1;
  blockForm[4][1][1]=1;
  blockForm[4][0][1]=1;
  blockForm[4][2][1]=1;
  
  blockForm[5][0][0]=1;
  blockForm[5][1][0]=1;
  blockForm[5][0][1]=1;
  blockForm[5][1][1]=1;
  
  blockForm[6][1][0]=1;
  blockForm[6][1][1]=1;
  blockForm[6][1][2]=1;
  blockForm[6][1][3]=1;
   
  gd=new GameDrawing();
  bc=new BlockCtrl();
  gc=new GameCtrl();
  gd.setField();
  
  font=loadFont("Serif-48.vlw");
  textFont(font, 32);
}
void draw(){
  gd.drawField();
  bc.blockApr();
  bc.blockFall();
  bc.blockDisApr();
  gc.gameOver();
  gc.drawScore();
}

void keyPressed(){
  if(keyCode==DOWN){
    bc.moveDown();
  }else if(keyCode==LEFT){
    if(bc.isGameOver()){
    bc.moveLeft();
    }else if(!bc.isGameOver()){
      retry=0;
    }
  }else if(keyCode==RIGHT){
    if(bc.isGameOver()){
    bc.moveRight();
    }else if(!bc.isGameOver()){
      retry=120;
    }
  }else if(keyCode==UP){
    bc.turn();
  }else if(keyCode==ENTER){
    if(!bc.isGameOver()){
        gc.retry();
    }
  }   
}
class BlockCtrl{
  void blockApr(){
    if(isOkNext() && isGameOver()){
      x=5;
      y=1;
      blockFormNo = int(random(7));
      blockColor =int(random(6));
      if(blockFormNo==6){
       for(int i=0; i<4; i++){
         for(int j=0; j<4; j++){
             cord[i+5][j+1]=blockForm[blockFormNo][i][j];
           }
         }
       }else{
          for(int i=0; i<3; i++){
           for(int j=0; j<3; j++){   
               cord[i+5][j+1]=blockForm[blockFormNo][i][j];
             }
           }
         }
      }
    }
    
    boolean isOkNext(){
      for(int i=0; i<11; i++){
        for(int j =0; j<20; j++){
          if(cord[i][j]==1){
            return false;
          }
        }
      }
      return true;
    }
    
    boolean isGameOver(){
      for(int i=0; i<11; i++){
        for(int j =0; j<20; j++){
          if(j<=2 && cord[i][j]==2){
            return false;
          }
        }
      }
      return true;
    }
    
    void blockFall(){
      boolean isOkFall =false;
      time2 = millis();
      if(time2>time1){
       isOkFall =true;
       time1+=1000;
      }
      if(isOkBottom() && isOkFall){
      y++;
      }
      if(isOkBottom() && isOkFall){
        for(int i=0; i<11; i++){
          for(int j=21; j>0; j--){
            if(cord[i][j]==1){
               cord[i][j+1]=1;
               cord[i][j]=0;
           }
         }
       }
     }else if(!isOkBottom() && isOkFall){
       blockFixed();
     }
   }
   
   void blockFixed(){
    if(!isOkBottom()){
      for(int i=0; i<11; i++){
        for(int j=0; j<21; j++){
          if(cord[i][j]==1){
            cord[i][j]=2;
          }
        }
      }
    }
  }
  
  boolean isOkBottom(){
    for(int i=0; i<11; i++){
     for(int j=0; j<21; j++){
       if(cord[i][j]==1){
         if(cord[i][j+1]==5 || cord[i][j+1]==2){
           return false;
         }
       }
     }
   }
    return true;
  }
  
  boolean isOkLeft(){
    for(int i=11; i>0; i--){
     for(int j=0; j<21; j++){
       if(cord[i][j]==1){
         if(cord[i-1][j]==5 || cord[i-1][j]==2){
           return false;
         }
       }
     }
   }
    return true;
  }
  
  boolean isOkRight(){
    for(int i=0; i<11; i++){
     for(int j=0; j<21; j++){
       if(cord[i][j]==1){
         if(cord[i+1][j]==5 || cord[i+1][j]==2){
           return false;
         }
       }
     }
   }
    return true;
  }
  
  boolean isOkTurn(){
    if(blockFormNo==6){
      for(int i=0; i<4; i++){
       for(int j=0; j<4; j++){
         if(blockForm[blockFormNo][3-i][j]==0){
           if(cord[i+x+1][j+y+1]==5 || cord[i+x][j+y]==2){
             return false;
           }else if(cord[i+x][j+y+1]==5 || cord[i+x][j+y]==2){
             return false;
           }
         }
       }
      }
    }else{
      for(int i=0; i<3; i++){
       for(int j=0; j<3; j++){
         if(blockForm[blockFormNo][2-i][j]==0){
           if(cord[i+x][j+y]==5 || cord[i+x][j+y]==2){
             return false;
           }else if(blockFormNo==5){
             return false;
           }
         }
       }
     }
    }
    return true;
  }
  
  void moveDown(){
    if(isOkBottom()){
    y++;
    }
    if(isOkBottom()){
      for(int i=0; i<11; i++){
       for(int j=21; j>0; j--){
         if(cord[i][j]==1){
           cord[i][j+1]=1;
           cord[i][j]=0;
         }
       }
     }
   }
  }
  
  void moveLeft(){
    if(isOkLeft()){
    x--;
    }
    if(isOkLeft()){
      for(int i=0; i<11; i++){
       for(int j=0; j<21; j++){
         if(cord[i][j]==1){
           cord[i-1][j]=1;
           cord[i][j]=0;
         
         }
       }
     }
    }
  }
  
  void moveRight(){
    if(isOkRight()){
    x++;
    }
    if(isOkRight()){
      for(int i=11; i>0; i--){
       for(int j=0; j<21; j++){
         if(cord[i][j]==1){
           cord[i+1][j]=1;
           cord[i][j]=0;
         }
       }
     }
    }
  }
  
  void turn(){
    int array[][]=new int[4][4];
      if(isOkTurn()){
        if(blockFormNo==6){
          for(int i=0; i<4; i++){
            for(int j=0; j<4; j++){
              array[i][j]=blockForm[blockFormNo][j][3-i];
            }
          }
          for(int i=0; i<4; i++){
            for(int j=0; j<4; j++){
              blockForm[blockFormNo][i][j]=array[i][j];
            }
          }
          for(int i=0; i<4; i++){
           for(int j=0; j<4; j++){
             cord[i+x][j+y]=blockForm[blockFormNo][i][j];
           }
         }
        }else{
           for(int i=0; i<3; i++){
            for(int j=0; j<3; j++){
              array[i][j]=blockForm[blockFormNo][j][2-i];
            }
          }
          for(int i=0; i<3; i++){
            for(int j=0; j<3; j++){
              blockForm[blockFormNo][i][j]=array[i][j];
            }
          }
          for(int i=0; i<3; i++){
           for(int j=0; j<3; j++){
             cord[i+x][j+y]=blockForm[blockFormNo][i][j];
           }
         }
       }
     }
  }
    
  void blockDisApr(){
   int isOkClr =0;
   for(int j=0; j<20; j++){
   isOkClr=0;
      for(int i=1; i<11; i++){
        if(cord[i][j]==2){
         isOkClr++;
        }
      }
      if(isOkClr==10){
        for(int k=1; k<11; k++){
          if(cord[k][j]==2){
          cord[k][j]=0;
          score +=10;
          for(int l=j; l>0; l--)
            if(cord[k][l-1]==2){
              cord[k][l]=2;
              cord[k][l-1]=0;
            }
          }
        }
      }
    }
  }
}
class GameCtrl{
  void gameOver(){
    if(!bc.isGameOver()){
      for(int i=0; i<11; i++){
        for(int j=0; j<20; j++){
          if(cord[i][j]==2){
            fill(100);
            rect(i*30,j*30,30,30); 
          }
        }
      }
      fill(255);
      text("Game Over !!" ,80,330);
      text("Press Enter and Retry" ,5,380);
    }
  }
  void retry(){
    for(int i=0; i<11; i++){
       for(int j=0; j<21; j++){
         if(cord[i][j]==2 || cord[i][j]==1){
           cord[i][j]=0;
         }
       }
    }
    if(score>highScore){
      highScore=score;
      score=0;
      }else{
      score=0;
      }
    bc.blockApr();
  }
  
  void drawScore(){
    fill(0);
    rect(360,400,300,300);
    fill(255,255,255);
    text("Score " ,380,450);
    text(score,380,500);
    text("High Score " ,380,550);
    text(highScore,380,600);
  }
}
class GameDrawing{
  
  void setField(){
    for(int i=0; i<12; i++){
      for(int j=0; j<21; j++){
        if(i==0 || i==11 ||j==20){
          cord[i][j]=5;
        }else{
          cord[i][j]=0;
        }
      }
    }  
  }

  void drawField(){
    for(int i=0; i<12; i++){
      for(int j=0; j<21; j++){
        if(cord[i][j]==0){ 
          fill(0);
          rect(i*30,j*30,30,30); 
        }else if(cord[i][j]==1){
          if(blockColor==0){
            fill(255,0,0);
            rect(i*30,j*30,30,30); 
          }else if(blockColor==1){
            fill(0,255,0);
            rect(i*30,j*30,30,30); 
          }else if(blockColor==2){
            fill(0,0,255);
            rect(i*30,j*30,30,30); 
          }else if(blockColor==3){
            fill(255,255,0);
            rect(i*30,j*30,30,30); 
          }else if(blockColor==4){
            fill(255,0,255);
            rect(i*30,j*30,30,30); 
          }else if(blockColor==5){
            fill(0,255,255);
            rect(i*30,j*30,30,30); 
          }
        }else if(cord[i][j]==3){
          fill(100);
          rect(i*30,j*30,30,30); 
        }else if(cord[i][j]==5){
          fill(200,100,0);
          rect(i*30,j*30,30,30); 
        }
      }
    }
  } 
}


