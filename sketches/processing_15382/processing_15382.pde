
PFont label;

int windowsize = 400; //window size
int cellsHW = 5;//1セルの大きさ
boolean started = false;

void setup() {
  size(400,430);
  totalCells = (windowsize/cellsHW) * (windowsize/cellsHW);//総セル数
  cellsXY = floor(totalCells/sqrt(totalCells));
  background(0);

  smooth();//線がスムーズになる
  frameRate(10);//フレームレート
  noStroke();

  setupGUI();

  cellsetup();
  cellDraw();
}

void draw() {
  if(started) {
    cellChange();
    cellDraw();
  }
}


void mousePressed() {
  ButtonGUI();
  if(!started) cellClick();
}

void mouseMoved() {
  if(!started){cellSelector();}
}




//===============
void setupGUI() {
  strokeWeight(1);
  stroke(140);//140グレー枠線
  line(0, 400, 400, 400);
  line(0, 402, 400, 402);


  label = createFont("SansSerif",10);
  textFont(label);
  setButton(0,255);
  clearBtn();
}

void ButtonGUI() {
  if(!started) {
    if(mouseX > 57 && mouseX < 67 && mouseY > 416 && mouseY < 426){
    cellClear();
    }
    if(mouseX > 5 && mouseX < 55 && mouseY > 406 && mouseY < 426) {
      started = true;
      setButton(50,255);
      fill(0);
      rect(56,406,344,424);
    }
  }
  else {
    if(mouseX > 5 && mouseX < 55 && mouseY > 406 && mouseY < 426) {
      started = false;
      setButton(0,255);
      clearBtn();
    }
  }
}

void setButton(color col1,color col2) {
  strokeWeight(1);
  stroke(255);//140グレー枠線
  fill(col1);
  rect(5,406,50,20);

  fill(col2);
  textAlign(CENTER,CENTER);
  if(started) {
    text("stop",30,415);
  }
  else {
    text("start",30,415);
    text("<<Delete Button     Click>>Delete and add cell.",185,420);
  }
  noStroke();
}


void clearBtn() {
  strokeWeight(1);
  stroke(255);//140グレー枠線
  fill(0);
  rect(57,416,10,10);
  line(57,416,67,426);
  line(67,416,57,426);
};

//==================
int totalCells; 
int cellsXY;
int[] cellArray1;
int[] cellArray2;
int[] celltarget;
int[] cDAA;
int SlX;
int SlY;
int X;
int c;
int pc;

void cellsetup() {//セル用setup　ランダムに生存セルを発生
  cellArray1 = new int[totalCells];
  cellArray2 = new int[totalCells];
  celltarget = new int[totalCells];
  cDAA  = new int[8];
  for(int i=0; i<totalCells; i++) {
    float n = random(10);
    if(n <2) {
      cellArray1[i] = 1;
    }
    else {
      cellArray1[i] =0;
    }
  }
}

void cellDraw() {//セル描画用
  int cellX = 0;
  int cellY = 0;
  for(int i=0; i<totalCells; i++) {
    if(cellArray1[i] == 1) {
      fill(255);
    }
    else {
      fill(0);
    }
    if(i%cellsXY == 0 && i != 0) {
      cellX =0;
      cellY +=cellsHW;
    }
    noStroke();
    rect(cellX,cellY,cellsHW,cellsHW);
    cellX +=cellsHW;
  }
}

void cellChange() {
  arrayCopy(cellArray1, cellArray2);
  for(int i=0; i<totalCells; i++) {
    cellArray1[i] = cellDorA(i);//セル生死判定
  }
}

void cellClear() {
  for(int i=0; i<totalCells; i++) {
    cellArray1[i] = 0;//セル抹殺
  }
  cellDraw();
}

int cellDorA(int X) {
  int cellPoint = 0;
  int cellnum = 0;
  int[] cDAA = {
    X-(cellsXY+1),X-cellsXY,X-(cellsXY-1),X-1,X+1,X+(cellsXY-1),X+cellsXY,X+(cellsXY+1)
    };

    //セル数カウント
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
  //内側
    else {
      for(int i = 0; i<8; i++) {
        cellnum += cellArray2[cDAA[i]];
      }
    }

  //周囲のセル数によるセルの生死分岐

  if(cellArray2[X] == 0) {
    //誕生
    if(cellnum ==3) {
      cellPoint = 1;
    }
  }
  else {
    //生存
    if(cellnum == 2 || cellnum == 3) {
      cellPoint = 1;
    }
    //過疎
    else if(cellnum < 2) {
      cellPoint = 0;
    }
    //過密
    else if(cellnum > 3) {
      cellPoint = 0;
    }
  }

  //println(cellsXY);
  return cellPoint;
}

void cellClick() {
  if(mouseY < 399) {
    if(cellArray1[c] == 1) {
      cellArray1[c] = 0;
    }
    else {
      cellArray1[c] = 1;
    }
    cellDraw();
  }
}


void cellSelector() {
    SlX = floor(mouseX/cellsHW);
    SlY = floor(mouseY/cellsHW);
    c = SlY*cellsXY + SlX;
}
                                                
