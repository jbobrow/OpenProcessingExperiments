
class Bonus {
  float posX, posY;
  int bonusNumber;
  float time = 0.0;
  
  
    //constructor
  Bonus ( int _x, int  _y) {
    reposition(_x,_y);    
  }
  
  void reposition ( int _x, int _y) {
    posX = _x;
    posY = _y;
  }
  
  void move_me(){
    time = time + 1;
    posY = posY + 2 + time/2000;
  }
  
  void draw_me(){
   imageMode( CENTER );
   image (imgBonus, posX, posY); 
  }
}

