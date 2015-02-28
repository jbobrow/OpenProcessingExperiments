
class CX1CY1{
  int x,y,rad;
  boolean IsDraged;
  
  CX1CY1(int _x, int _y){
    x=_x;
    y=_y;
    rad=10;   //selecting area size
  }
  
  void display(){
    noStroke();
    fill(255,100);
    ellipse(x,y,rad,rad);
    if(IsDraged==true){
      x=mouseX;
      y=mouseY;
    }
  }
  
  int xpos(){
    return x;
  }
  int ypos(){
    return y;
  }
  
  boolean drag(){
    if(dist(mouseX,mouseY,x,y)<rad/2){
      IsDraged=true;
      return IsDraged;
    }
    else{
      IsDraged=false;
      return IsDraged;
    }
  }
  boolean finish(){
    IsDraged=false;
    return IsDraged;
  }
}

