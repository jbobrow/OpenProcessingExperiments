
class Node{
  int id, parentID;
  float x,y,r;
  int F,G,H;
  boolean isStart,isEnd,isWall,isWalked,isChecked;
  boolean inOpenList,inClosedList;
  boolean isPath;
  
  Node(float tx,float ty,int tid){
    x = tx; y = ty; r = side; id = tid;
    parentID = -1;
    G = 1000;
  }
  
  void render(){
    stroke(50);
    ///
    if(isStart==true) fill(0,150,0);
    else if(isEnd==true) fill(150,0,0);
    else if(isPath==true) fill(255,160,0);
    else if(isWalked==true) fill(80,150,200);
    else if(isWall==true) fill(150);
    else noFill();
    ///
    rectMode(CENTER);
    rect(x,y,r,r);
  }
  
  void calcH(Node n){
    H = (int) (10*(abs(x-n.x) + abs(y-n.y))/r);
  }
  
  void calcF(){
    F = G + H;
  }
}

