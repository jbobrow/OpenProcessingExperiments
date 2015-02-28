
boolean enemy;
int speed = 3;
int speed2 = 3;
int enemyx=rectsize*8+rectsize/2;
int enemyy=rectsize*4+rectsize/2;
int enemyx2=rectsize*6+rectsize/2;
int enemyy2=rectsize*3+rectsize/2;
//level 3
int enemylx = rectsize*6+rectsize/2; int enemyly = rectsize*7+rectsize/2; int speedl = 10;
int enemylx2 = rectsize*8+rectsize/2; int enemyly2 = rectsize*5+rectsize/2; int speedl2 = 10;
int enemylx3 = rectsize*6+rectsize/2; int enemyly3 = rectsize*3+rectsize/2; int speedl3 = 10;

int enemylx4 = rectsize/2; int enemyly4 = rectsize*7+rectsize/2; int speedl4 = 3;
int enemylx5 = rectsize/2; int enemyly5 = rectsize*3+rectsize/2; int speedl5 = 3;
int enemylx6 = rectsize*4+rectsize/2; int enemyly6 = rectsize/2; int speedl6 = 3;
int enemylx7 = rectsize*7+rectsize/2; int enemyly7 = rectsize/2; int speedl7 = 3;


void enemy(){
  //enemy1
  fill(0);
  rect(enemyx,enemyy,rectsize,rectsize);
  fill(0,0,0,60);
  rect(enemyx+28,enemyy+28,rectsize,rectsize);
  enemyy = enemyy + speed;
  if(enemyy>=rectsize*5+rectsize/2+2){
    speed = -3;
   
  }
  if(enemyy<=rectsize*4-rectsize/2-2){
    
    speed = 3;
  }
  if(y-ballsize/2<=enemyy+rectsize/2&&y>=rectsize*2&&x>=rectsize*8){
    gameover = true;
    
  }
  //enemy2
  fill(0);
  rect(enemyx2,enemyy2,rectsize,rectsize);
  fill(0,0,0,60);
  rect(enemyx2+28,enemyy2+28,rectsize,rectsize);
  enemyy2 = enemyy2 + speed2;
  if(enemyy2>=rectsize*5+rectsize/2+2){
    speed2 = -3;
 
  }
  if(enemyy2<=rectsize*4-rectsize/2-2){
    speed2 = 3;
    
  }
  if(y-ballsize/2<=enemyy2+rectsize/2&&y>=rectsize*2&&x -ballsize/2>=rectsize*6&&x-ballsize/2<=rectsize*7){
    gameover = true;
    
  }
}

void enemylevel3(){
  //enemy1
  fill(0);
  rect(enemylx,enemyly,rectsize,rectsize);
  rect(enemylx2,enemyly2,rectsize,rectsize);
  rect(enemylx3,enemyly3,rectsize,rectsize);
  rect(enemylx4,enemyly4,rectsize,rectsize);
  rect(enemylx5,enemyly5,rectsize,rectsize);
  rect(enemylx6,enemyly6,rectsize,rectsize);
  rect(enemylx7,enemyly7,rectsize,rectsize);
  
  fill(0,0,0,60);
  rect(enemylx+28,enemyly+28,rectsize,rectsize);
  rect(enemylx2+28,enemyly2+28,rectsize,rectsize);
  rect(enemylx3+28,enemyly3+28,rectsize,rectsize);
  rect(enemylx4+28,enemyly4+28,rectsize,rectsize);
  rect(enemylx5+28,enemyly5+28,rectsize,rectsize);
  rect(enemylx6+28,enemyly6+28,rectsize,rectsize);
  rect(enemylx7+28,enemyly7+28,rectsize,rectsize);
  
  enemylx = enemylx + speedl;
  enemylx2 = enemylx2 + speedl2;
  enemylx3 = enemylx3 + speedl3;
  enemylx4 = enemylx4 + speedl4;
  enemylx5 = enemylx5 + speedl5;
  enemyly6 = enemyly6 + speedl6;
  enemyly7= enemyly7 + speedl7;
  
  //1
  if(enemylx>=rectsize*8+rectsize/2){
    speedl = -10;
  }
  if(enemylx<=rectsize*7-rectsize/2){
    speedl = 10;
  }
  //2
  if(enemylx2>=rectsize*8+rectsize/2){
    speedl2 = -10;
  }
  if(enemylx2<=rectsize*7-rectsize/2){
    speedl2 = 10;
  }
    //3
    if(enemylx3>=rectsize*8+rectsize/2){
    speedl3 = -10;
  }
  if(enemylx3<=rectsize*7-rectsize/2){
    speedl3 = 10;
  
}//4
if(enemylx4>=rectsize*2+rectsize/2){
    speedl4 = -3;
  }
  if(enemylx4<=rectsize/2){
    speedl4 = 3;
  
}//5
if(enemylx5>=rectsize*2+rectsize/2){
    speedl5 = -3;
  }
  if(enemylx5<=rectsize/2){
    speedl5 = 3;
  
}//6
if(enemyly6>=height-rectsize/2){
    speedl6 = -3;
  }
  if(enemyly6<=rectsize/2){
    speedl6 = 3;
  
}//7
if(enemyly7>=rectsize*2+rectsize/2){
    speedl7 = -3;
  }
  if(enemyly7<=rectsize/2){
    speedl7 = 3;
  
}
if(s){
  soundplayer();
  if(enemylx>=rectsize*8+rectsize/2){
    speedl = -1;
  }
  if(enemylx<=rectsize*7-rectsize/2){
    speedl = 1;
  }
}

if(s2){
  soundplayer();
  if(enemylx2>=rectsize*8+rectsize/2){
    speedl2 = -1;
  }
  if(enemylx2<=rectsize*7-rectsize/2){
    speedl2 = 1;
}
}

if(s3){
  soundplayer();
  if(enemylx3>=rectsize*8+rectsize/2){
    speedl3 = -1;
  }
  if(enemylx3<=rectsize*7-rectsize/2){
    speedl3 = 1;
}
}
  

//1
if(y-ballsize/2<=enemyly+rectsize/2&&y+ballsize/2>=enemyly-rectsize/2
&&x -ballsize/2<=enemylx+rectsize/2&&x+ballsize/2>=enemylx){
    gameover = true;
}//2
if(y-ballsize/2<=enemyly2+rectsize/2&&y+ballsize/2>=enemyly2-rectsize/2
&&x -ballsize/2<=enemylx2+rectsize/2&&x+ballsize/2>=enemylx2){
    gameover = true;
}//3
if(y-ballsize/2<=enemyly3+rectsize/2&&y+ballsize/2>=enemyly3-rectsize/2
&&x -ballsize/2<=enemylx3+rectsize/2&&x+ballsize/2>=enemylx3){
    gameover = true;
}//4
if(y-ballsize/2<=enemyly4+rectsize/2&&y+ballsize/2>=enemyly4-rectsize/2
&&x -ballsize/2<=enemylx4+rectsize/2&&x+ballsize/2>=enemylx4){
    gameover = true;
}//5
if(y-ballsize/2<=enemyly5+rectsize/2&&y+ballsize/2>=enemyly5-rectsize/2
&&x -ballsize/2<=enemylx5+rectsize/2&&x+ballsize/2>=enemylx5){
    gameover = true;
}//6
if(y-ballsize/2<=enemyly6+rectsize/2&&y+ballsize/2>=enemyly6-rectsize/2
&&x -ballsize/2<=enemylx6+rectsize/2&&x+ballsize/2>=enemylx6){
    gameover = true;
}//7
if(y-ballsize/2<=enemyly7+rectsize/2&&y+ballsize/2>=enemyly7-rectsize/2
&&x -ballsize/2<=enemylx7+rectsize/2&&x+ballsize/2>=enemylx7){
    gameover = true;
}
}

