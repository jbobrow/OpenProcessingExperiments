
class Cats {
  float posX, posY;
  int catNumber;
  int score = 0;
  
    //constructor
  Cats ( int _x, int  _y) {
    reposition(_x,_y);    
  }
  
  void reposition ( int _x, int _y) {
    posX = _x;
    posY = _y;
  }
  
  void move_me(){
    if (score <= 0){
      posY = posY + 2;
    }
    else if (score > 0) {
      posY = (posY + 2 + (score/200)) ;  // velocity of cats moving
    }
    if (posY >= 750 && posX >=0 && posX <= 520) {
      alive = false;
    }
  }
  
  void draw_me(){
   imageMode( CENTER );
   image (imgCat[catNumber], posX, posY);  
  }
}

