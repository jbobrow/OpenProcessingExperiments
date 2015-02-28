

class Attractor { //attractor is a class that holds a position and draws itself and thats all?
  float x,y; //local variables are the x and y position
  
  Attractor(float _x, float _y ) 
  {
    x = _x;
    y = _y;
  }
  
  
  void spot() //method to draw itself
  {
    line(x-4, y, x+4, y);
    line(x, y-4, x, y+4);
  }
  
}

