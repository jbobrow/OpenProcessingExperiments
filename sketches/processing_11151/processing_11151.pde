
class DrawX{
  int x, y, wid, initX, initY, state;
  PShape s;
  DrawX(int a, int b){
    x = a;
    y = b;
    wid = 23;
    initX = a;
    initY = b;
    state = 0;
    s = loadShape("cross.svg");
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
    int drop = 30;
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
  
  void setState(){
    state = 1;
  }
  
  int getState(){
    return state;
  }
}
    

