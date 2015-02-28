
// Block is our world
// Class. Our world is
// built from blocks!

class Block {
  
  float _x;
  float _y;
  float _w;
  float _h;
  color _col; // Colour
  float _xVel; // X Velocity (X Speed)
  
  Block(float x, float y, float w, float h, color col, float xVel) {
  
    _x = x;
    _y = y;
    _w = w;
    _h = h;
    _col = col;
    _xVel = xVel;
    
  }
  
  void render() {
    
    _x += _xVel;
    
    fill(_col);
    rect(_x, _y, _w, _h);
    
  }
  
  boolean checkCollision(float x, float y, float w, float h) {
    
    return (_x < (x + w) && (_x + _w) > x 
    
         && _y < (y + h) && (_y + _h) > y);
    
  }
  
}


