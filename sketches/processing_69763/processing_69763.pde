
class Rain {

  int posX;
  int offsetX; //used for variation in origin point of rain
  int posY;
  int rainSize;
  float speed;
  int colors;
  float gravity;

  Rain(int _posX, int _offsetX, int _posY, int _rainSize, float _speed, int _colors) {
    posX = _posX;
    offsetX = _offsetX;
    posY = _posY;
    rainSize = _rainSize;
    speed = _speed;
    colors = _colors;
    
    gravity = 1;
  }

  void display() {
    fill(colors,colors,colors+30,random(150,200)); 
    pushMatrix();
    translate(posX + offsetX, posY); //translates rectangle to mouse point
    rect(0, 0, 1, rainSize);
    popMatrix();
  }
  
  void animate() {
    posY += speed; //move rain
    speed += gravity; //adds gravity
  }
  
  boolean destroy() {
    if (posY > height) { //if the rain goes off the bottom of the screen...
      return true; //...this function returns true
    }
    
    else {
      return false;
    }
  }
    
}


