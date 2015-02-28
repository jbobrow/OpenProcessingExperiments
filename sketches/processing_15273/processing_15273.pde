
//むしゃくしゃしたのでライフゲーム的なものが作れないかと考えた

int totalCells = 1600;
int cellX = 0;
int cellY = 0;
int cellsXY;
int cellsHW = 5;
int[] cellArray1;
int[] cellArray2;
int[] cDAA;
float cellRandom;
int X;

void setup() {
  cellsXY = floor(totalCells/sqrt(totalCells));
  size(200,200);
  background(255);
  smooth();
  frameRate(2);//フレームレート
  noStroke();
  fill(0);
  cellsetup();
  cellDraw();
}

void draw() {
  cellChange();
  cellDraw();
}

void mousePressed() {
  //println(cellArray1);
}

void cellsetup() {
  cellArray1 = new int[totalCells];
  cellArray2 = new int[totalCells];
  cDAA  = new int[8];
  cellArray1[900] = 1;
  cellArray1[900+cellsXY] = 1;
  cellArray1[900+cellsXY*2] = 1;
  for(int i=0; i<totalCells; i++) {
    cellArray1[i] = floor(random(2));
    }
}

void cellDraw() {
  for(int i=0; i<totalCells; i++) {
    if(cellArray1[i] == 1) {
      fill(0);
    }
    else {
      fill(255);
    }
    if(i%cellsXY == 0 && i != 0) {
      cellX =0;
      cellY +=cellsHW;
    }
    rect(cellX,cellY,cellsHW,cellsHW);
    cellX +=cellsHW;
  }
  cellX =0;
  cellY =0;
  
}

void cellChange() {
  arrayCopy(cellArray1, cellArray2);
  for(int i=0; i<totalCells; i++) {
    cellArray1[i] = cellDorA(i);
  }
}

int cellDorA(int X) {
  int cellPoint = 0;
  int cellnum = 0;
  int[] cDAA = {
    X-(cellsXY+1),X-cellsXY,X-(cellsXY-1),X-1,X+1,X+(cellsXY-1),X+cellsXY,X+(cellsXY+1)
    };

    //左上
    if(X == 0) {
      cellnum = cellArray2[cDAA[4]]+cellArray2[cDAA[6]]+cellArray2[cDAA[7]];
    }
  //右上
    else if(X == cellsXY-1) {
      cellnum = cellArray2[cDAA[3]]+cellArray2[cDAA[5]]+cellArray2[cDAA[6]];
    }
  //左下
   else if(X == totalCells - cellsXY) {
      cellnum = cellArray2[cDAA[1]]+cellArray2[cDAA[2]]+cellArray2[cDAA[4]];
  }
  //右下
    else if(X == totalCells-1) {
      cellnum = cellArray2[cDAA[0]]+cellArray2[cDAA[1]]+cellArray2[cDAA[3]];
    }
  //上列
    else if (X < cellsXY && X  != 0 && X != cellsXY-1) {
      for(int k = 3; k<8; k++) {
        cellnum += cellArray2[cDAA[k]];
      }
    }
 // 下列
   else if(X > (totalCells - cellsXY )&& X != totalCells-1) {
    for(int k = 0; k<5; k++) {
     cellnum += cellArray2[cDAA[k]];
   }
   }
  //左列
   else if(X%cellsXY == 0 && X  != 0 && X != totalCells-cellsXY) {
       cellnum = cellArray2[cDAA[1]]+cellArray2[cDAA[2]]+cellArray2[cDAA[4]]+cellArray2[cDAA[6]]+cellArray2[cDAA[7]];
   }
  //右列
    else if(X%cellsXY == cellsXY-1 && X != cellsXY-1 && X != totalCells-1) {
      cellnum = cellArray2[cDAA[0]]+cellArray2[cDAA[1]]+cellArray2[cDAA[3]]+cellArray2[cDAA[5]]+cellArray2[cDAA[6]];
    }
    else{
    for(int i = 0; i<8; i++) {
     cellnum += cellArray2[cDAA[i]];
   }
    }
 
 
  //誕生
  if(cellArray2[X] == 0){
    if(cellnum ==3){
  cellPoint = 1;}
  }
//生存
else{
  if(cellnum == 2 || cellnum == 3) {
    cellPoint = 1;  }
//過疎
  else if(cellnum < 2) {
    cellPoint = 0;  }
//過密
  else if(cellnum > 3) {
    cellPoint = 0;
  }
}

  //println(cellsXY);
  return cellPoint;
}
                
