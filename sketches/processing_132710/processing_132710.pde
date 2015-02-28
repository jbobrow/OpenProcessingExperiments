

int gridHeight = 50;
 int gridWidth = 50;
 int cellSize = 9;
 int[][][] grid = new int[gridWidth][gridHeight][5];
 int stackXIndex = 0;
 int[] stackX = new int[gridWidth*gridHeight];
 int stackYIndex = 0;
 int[] stackY = new int[gridWidth*gridHeight];
   int finderDirection = 0;
  int finderX = 0;
  int finderY = 0;
void setup(){
  size(500, 500);
    stroke(255);
  int curentX = gridWidth-1;
  int curentY = gridHeight-1;
  grid[curentX][curentY][4]=1;
  for(int i = 0; i<100; i++){
   stackY[i]=-1;
   stackX[i]=-1; 
  }
  while(!isDone()){
   if(rNeibors(curentX,curentY)!=-1){
    pushX(curentX);
    pushY(curentY);
    print(stackXIndex+":"+stackX[stackXIndex]+" ");
    println(stackYIndex+":"+stackY[stackYIndex]+" ");
     
   if(rNeibors(curentX,curentY)==1){
     grid[curentX][curentY][1]=1;
     grid[curentX+1][curentY][3]=1;
     curentX++;
     grid[curentX][curentY][4]=1;
   }
   if(rNeibors(curentX,curentY)==2){
     grid[curentX][curentY][2]=1;
     grid[curentX][curentY+1][0]=1;
     curentY++;
     grid[curentX][curentY][4]=1;
   }
   if(rNeibors(curentX,curentY)==3){
     grid[curentX][curentY][3]=1;
     grid[curentX-1][curentY][1]=1;
     curentX--;
     grid[curentX][curentY][4]=1;
   }
   if(rNeibors(curentX,curentY)==0){
     grid[curentX][curentY][0]=1;
     grid[curentX][curentY-1][2]=1;
     curentY--;
     grid[curentX][curentY][4]=1;
   }
  }
  else{
   if(stackXIndex!=0){
     if(stackX[stackXIndex-1]!=-1){
   curentX = stackX[stackXIndex-1];
     }
     if(stackY[stackYIndex-1]!=-1){
   curentY = stackY[stackYIndex-1];
     }
   popX();
   popY();
   }
   else{
     int randX=floor(random(gridWidth));
     int randY=floor(random(gridHeight));
     if(grid[randX][randY][4]==1){
    curentX=floor(random(gridWidth));
    curentY=floor(random(gridHeight));
    break;
   } 
   }
  }
  }

  
}

void moveDirection(int direction){
  int newX = finderX;
  int newY = finderY;
  finderDirection = direction;
   switch(direction){
    case 0:
    newY=finderY-1;
    break; 
    case 1:
    newX=finderX+1;
    break;
    case 2:
    newY=finderY+1;
    break;
    case 3:
    newX=finderX-1;
    break;
   }
    fill(255,0,0);
    ellipse(finderX*cellSize+cellSize/2,finderY*cellSize+cellSize/2,cellSize,cellSize);
    line(finderX*cellSize+cellSize/2,finderY*cellSize+cellSize/2,newX*cellSize+cellSize/2,newY*cellSize+cellSize/2);
    finderX=newX;
    finderY=newY;
}

void pushX(int toPush){
  if(stackXIndex<(gridWidth*gridHeight)-1){
  stackXIndex++;
  stackX[stackXIndex]=toPush;
  }
  
}
void popX(){
  if(stackXIndex>0){
  stackX[stackXIndex]=-1;
  stackXIndex--;
  }
  
}
void pushY(int toPush){
  if(stackYIndex<(gridWidth*gridHeight)-1){
  stackYIndex++;
  stackY[stackYIndex]=toPush;
  }
  
}
void popY(){
  if(stackYIndex>0){
  stackY[stackYIndex]=-1;
  stackYIndex--;
  }
  
}


int rNeibors(int x, int y){
  int count = 0;
  int[] neibors = new int[4];
  if(y>0){
  if(grid[x][y-1][4]==0){
     neibors[count]=0;
     count++;
  }
  }
  if(x<gridWidth-1){
  if(grid[x+1][y][4]==0){
     neibors[count]=1;
     count++;
  }
  }
  if(y<gridHeight-1){
  if(grid[x][y+1][4]==0){
     neibors[count]=2;
     count++;
  }
  }
  if(x>0){
  if(grid[x-1][y][4]==0){
     neibors[count]=3;
     count++;
  }
  }
  if(count==0){
    return -1;
  }
  return neibors[floor(random(count))];
  
}

int getLeft(int direction){
 if(direction == 0){
   return 3;
   
 }
 if(direction == 1){
   return 0;
   
 }
 if(direction == 2){
   return 1;
   
 }

   return 2;
   
}

boolean isDone(){
    for(int x = 0; x<gridWidth; x++){
    for(int y = 0; y<gridHeight; y++){
      if(grid[x][y][4]==0){
       return false;
    }
    }
    }
    return true;
}

void draw(){
  stroke(255);
  background(0);
     for(int x = 0; x<gridWidth; x++){
    for(int y = 0; y<gridHeight; y++){
     //top
     if(grid[x][y][0]==0){
     line(x*cellSize, y*cellSize, x*cellSize+cellSize,y*cellSize);
     }
     //right
     if(grid[x][y][1]==0){
     line(x*cellSize+cellSize, y*cellSize, x*cellSize+cellSize,y*cellSize+cellSize);
     }
     //bottom
     if(grid[x][y][2]==0){
     line(x*cellSize, y*cellSize+cellSize, x*cellSize+cellSize,y*cellSize+cellSize);
     }
     //left
     if(grid[x][y][3]==0){
     line(x*cellSize, y*cellSize, x*cellSize,y*cellSize+cellSize);
     }   
    

  } 
    
  }
  stroke(255,0,0);
 if(finderX!=gridWidth-1 || finderY!=gridHeight-1){
   int dir = getLeft(finderDirection);
   for(int i = 0; i<=3; i++){
     if(grid[finderX][finderY][dir]==1){
       moveDirection(dir);
       
       break;
     }
     dir=(dir+1)%4;
   }
    
  }
  else{
    finderX=0;
    finderY=0;
  }
}



/*
import processing.pdf.*;
int gridHeight = 10;
 int gridWidth = 10;
 int cellSize = 10;
 int boarder = 7;
 int[][][] grid = new int[gridWidth][gridHeight][5];
 int stackXIndex = 0;
 int[] stackX = new int[gridWidth*gridHeight];
 int stackYIndex = 0;
 int[] stackY = new int[gridWidth*gridHeight];
   int finderDirection = 0;
  int finderX = 0;
  int finderY = 0;
void setup(){
  size(gridWidth*cellSize+boarder*2, gridHeight*cellSize+boarder*2, PDF, "maze.pdf");
    stroke(255);
  int curentX = gridWidth-1;
  int curentY = gridHeight-1;
  grid[curentX][curentY][4]=1;
  for(int i = 0; i<100; i++){
   stackY[i]=-1;
   stackX[i]=-1; 
  }
  while(!isDone()){
   if(rNeibors(curentX,curentY)!=-1){
    pushX(curentX);
    pushY(curentY);
    print(stackXIndex+":"+stackX[stackXIndex]+" ");
    println(stackYIndex+":"+stackY[stackYIndex]+" ");
     
   if(rNeibors(curentX,curentY)==1){
     grid[curentX][curentY][1]=1;
     grid[curentX+1][curentY][3]=1;
     curentX++;
     grid[curentX][curentY][4]=1;
   }
   if(rNeibors(curentX,curentY)==2){
     grid[curentX][curentY][2]=1;
     grid[curentX][curentY+1][0]=1;
     curentY++;
     grid[curentX][curentY][4]=1;
   }
   if(rNeibors(curentX,curentY)==3){
     grid[curentX][curentY][3]=1;
     grid[curentX-1][curentY][1]=1;
     curentX--;
     grid[curentX][curentY][4]=1;
   }
   if(rNeibors(curentX,curentY)==0){
     grid[curentX][curentY][0]=1;
     grid[curentX][curentY-1][2]=1;
     curentY--;
     grid[curentX][curentY][4]=1;
   }
  }
  else{
   if(stackXIndex!=0){
     if(stackX[stackXIndex-1]!=-1){
   curentX = stackX[stackXIndex-1];
     }
     if(stackY[stackYIndex-1]!=-1){
   curentY = stackY[stackYIndex-1];
     }
   popX();
   popY();
   }
   else{
     int randX=floor(random(gridWidth));
     int randY=floor(random(gridHeight));
     if(grid[randX][randY][4]==1){
    curentX=floor(random(gridWidth));
    curentY=floor(random(gridHeight));
    break;
   } 
   }
  }
  }

  
}

void moveDirection(int direction){
  int newX = finderX;
  int newY = finderY;
  finderDirection = direction;
   switch(direction){
    case 0:
    newY=finderY-1;
    break; 
    case 1:
    newX=finderX+1;
    break;
    case 2:
    newY=finderY+1;
    break;
    case 3:
    newX=finderX-1;
    break;
   }
    fill(255,0,0);
    ellipse(finderX*cellSize+cellSize/2,finderY*cellSize+cellSize/2,cellSize,cellSize);
    line(finderX*cellSize+cellSize/2,finderY*cellSize+cellSize/2,newX*cellSize+cellSize/2,newY*cellSize+cellSize/2);
    finderX=newX;
    finderY=newY;
}

void pushX(int toPush){
  if(stackXIndex<(gridWidth*gridHeight)-1){
  stackXIndex++;
  stackX[stackXIndex]=toPush;
  }
  
}
void popX(){
  if(stackXIndex>0){
  stackX[stackXIndex]=-1;
  stackXIndex--;
  }
  
}
void pushY(int toPush){
  if(stackYIndex<(gridWidth*gridHeight)-1){
  stackYIndex++;
  stackY[stackYIndex]=toPush;
  }
  
}
void popY(){
  if(stackYIndex>0){
  stackY[stackYIndex]=-1;
  stackYIndex--;
  }
  
}


int rNeibors(int x, int y){
  int count = 0;
  int[] neibors = new int[4];
  if(y>0){
  if(grid[x][y-1][4]==0){
     neibors[count]=0;
     count++;
  }
  }
  if(x<gridWidth-1){
  if(grid[x+1][y][4]==0){
     neibors[count]=1;
     count++;
  }
  }
  if(y<gridHeight-1){
  if(grid[x][y+1][4]==0){
     neibors[count]=2;
     count++;
  }
  }
  if(x>0){
  if(grid[x-1][y][4]==0){
     neibors[count]=3;
     count++;
  }
  }
  if(count==0){
    return -1;
  }
  return neibors[floor(random(count))];
  
}

int getLeft(int direction){
 if(direction == 0){
   return 3;
   
 }
 if(direction == 1){
   return 0;
   
 }
 if(direction == 2){
   return 1;
   
 }

   return 2;
   
}

boolean isDone(){
    for(int x = 0; x<gridWidth; x++){
    for(int y = 0; y<gridHeight; y++){
      if(grid[x][y][4]==0){
       return false;
    }
    }
    }
    return true;
}

void draw(){
  strokeWeight(5);
  background(0);
     stroke(255);
     for(int x = 0; x<gridWidth; x++){
    for(int y = 0; y<gridHeight; y++){
     //top
     if(grid[x][y][0]==0){
     line(x*cellSize+boarder, y*cellSize+boarder, x*cellSize+cellSize+boarder,y*cellSize+boarder);
     }
     //right
     if(grid[x][y][1]==0){
     line(x*cellSize+cellSize+boarder, y*cellSize+boarder, x*cellSize+cellSize+boarder,y*cellSize+cellSize+boarder);
     }
     //bottom
     if(grid[x][y][2]==0){
     line(x*cellSize+boarder, y*cellSize+cellSize+boarder, x*cellSize+cellSize+boarder,y*cellSize+cellSize+boarder);
     }
     //left
     if(grid[x][y][3]==0){
     line(x*cellSize+boarder, y*cellSize+boarder, x*cellSize+boarder,y*cellSize+cellSize+boarder);
     }   
    

  } 
    
  }
 
  exit();
}
*/

