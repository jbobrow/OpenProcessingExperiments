
class Box{
  int x,y,w,h;
  int xLeft,xRight,yTop,yBottom;
  String stmt;
  //Step size  
  int step = 5;

  //Navigation 
  boolean right=false,left=false,up=false,down=false;
  int move=0;
  boolean collision = false;

  // Unparameterized Constructor
  Box(){
    x = 50;
    y = 50;
    w = 50;
    h = 50;
  }
  // Parameterized Constructor
  Box(int _x, int _y,int _w, int _h){
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }

  void paint(){
    if(collision){
      fill(255,0,0,100);
    }
    else{
      fill(0,240,0,100);
    }
    rect(x,y,w,h);
  }

  void moveLeft(){
    if(x>0){
      x-=step;
    }
    else{
      left = false;
      right = true;
    }
  }

  void moveRight(){
    if((x+w)<width){
      x+=step;
    }
    else{
      right = false;
      left = true;
    }
  }

  void moveUp(){
    if(y>0){
      y-=step;
    }
    else{
      up = false;
      down = true;
    }
  }

  void moveDown(){
    if((y+h)<height){
      y+=step;
    }
    else{
      down = false;
      up = true;
    }
  }

  void simulate(){
    move = int(random(4));
    stmt = " move = "+move;

    switch(move){
    case 0 :
      { 
        if(left){
          stmt += " :: left ";
          moveLeft();
        }
        break;
      }
    case 1 :
      {
        if(right){
          stmt += " :: right ";
          moveRight();
        }
        break;
      }
    case 2 :
      {
        if(up){
          stmt += " :: Up ";
          moveUp();
        }
        break;
      }
    case 3 :
      {
        if(down){
          stmt += " :: Down ";
          moveDown();
        }
        break;
      }
    }
    updateDerivedValues();
    println(stmt);
  }
  
  void updateDerivedValues(){
    xLeft = x;
    xRight = x + w;
    yTop =  y;
    yBottom = y + h;
  }
}
















