
class Alien { 
  float x; 
  float y; 
  float tp; 
  float speed; 
  float step; 
  int life; 

  Alien (int xin, int yin, int lifein) { 
    x = xin; 
    y = yin; 
    life = lifein;
  } 
  
  float getX() {//very useful, return back current x, y for objects in array
    return x;
  }

  float getY() {
    return y;
  } 

  void ymove(int step) { 
    y += step;
  } 
  void draw() { 
    if (life !=0 ) {//introduce life system to determine explosion
      image(picAlien, x, y);
    }
  }
}


