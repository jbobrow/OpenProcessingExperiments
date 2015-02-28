
class DrawX{
  int x, y, wid, initX, initY, growCount, dropCount;
  String state;
  PShape s;
  PShape d = loadShape("crossWhite.svg");
  PShape g = loadShape("crossG.svg");
  PShape g2 = loadShape("crossG2.svg");
  PShape g3 = loadShape("crossG3.svg");
  PShape g4 = loadShape("crossG4.svg");
  PShape g5 = loadShape("crossG5.svg");
  PShape g6 = loadShape("crossG6.svg");
  PShape g7 = loadShape("crossG7.svg");
  PShape g8 = loadShape("crossG8.svg");
  PShape b = loadShape("crossB.svg");
  PShape b2 = loadShape("crossB2.svg");
  PShape b3 = loadShape("crossB3.svg");
  PShape b4 = loadShape("crossB4.svg");
  PShape b5 = loadShape("crossB5.svg");
  PShape b6 = loadShape("crossB6.svg");
  PShape b7 = loadShape("crossB7.svg");
  PShape b8 = loadShape("crossB8.svg");
  PShape p = loadShape("crossP.svg");
  PShape p2 = loadShape("crossP2.svg");
  PShape p3 = loadShape("crossP3.svg");
  PShape p4 = loadShape("crossP4.svg");
  PShape p5 = loadShape("crossP5.svg");
  PShape p6 = loadShape("crossP6.svg");
  PShape p7 = loadShape("crossP7.svg");
  PShape p8 = loadShape("crossP8.svg");
  PShape e = loadShape("cross.svg");
  
  DrawX(int a, int b){
    x = a;
    y = b;
    wid = 23;
    initX = a;
    initY = b;
    state = "none";
    s = d;
    growCount = 0;
    dropCount = 0;
  }
  
  void render(){
    shape(s, x, y, wid, wid);
  }
  
  void grow(int z){
    wid += z;
    x -= (z/2);
    y -= (z/2);
  }
  
  void drop(){
    int drop = 25;
    wid -= drop;
    x += drop/2;
    y += drop/2;
  }
  
  int getWid(){
    return wid;
  }
  
  void resetWid(){
    wid = 23;
    x = initX;
    y = initY;
  }
  
  void changeGrow(){
    growCount++;
  }
  
  void changeDrop(){
    dropCount++;
  }
  
  int getGrow(){
    return growCount;
  }
  
  int getDrop(){
    return dropCount;
  }
  
  void resetGrow(){
    growCount = 0;
  }
  
  void resetDrop(){
    dropCount = 0;
  }
  
  void setState(int x){
    if (x == 0){
      state = "grow";
    }
    if (x == 1){
      state = "none";
    }
    if (x == 2){
      state = "drop";
    }
  }
  
  String getState(){
    return state;
  }
  
  void changeColour(int x, int y){
    if (x == 0){
      s = e;
    }
    if (x == 1 || x == 2){
      if (y == 1){
        s = g;
      }
      if (y == 2){
        s = b;
      }
      if (y == 3){
        s = p;
      }
    }
    else if (x == 3 || x == 4){
      if (y == 1){
        s = g2;
      }
      if (y == 2){
        s = b2;
      }
      if (y == 3){
        s = p2;
      }
    }
    else if (x == 5 || x == 6){
      if (y == 1){
        s = g3;
      }
      if (y == 2){
        s = b3;
      }
      if (y == 3){
        s = p3;
      }
    }
    else if (x == 7 || x == 8){
      if (y == 1){
        s = g4;
      }
      if (y == 2){
        s = b4;
      }
      if (y == 3){
        s = p4;
      }
    }
    else if (x == 9 || x == 10){
      if (y == 1){
        s = g5;
      }
      if (y == 2){
        s = b5;
      }
      if (y == 3){
        s = p5;
      }
    }
    else if (x == 11 || x == 12){
      if (y == 1){
        s = g6;
      }
      if (y == 2){
        s = b6;
      }
      if (y == 3){
        s = p6;
      }
    }
    else if (x == 13 || x == 14){
      if (y == 1){
        s = g7;
      }
      if (y == 2){
        s = b7;
      }
      if (y == 3){
        s = p7;
      }
    }
    else if (x == 15 || x == 16){
      if (y == 1){
        s = g8;
      }
      if (y == 2){
        s = b8;
      }
      if (y == 3){
        s = p8;
      }
    }
    else if (x == 17){
      s = d;
    }
  }
}
    

