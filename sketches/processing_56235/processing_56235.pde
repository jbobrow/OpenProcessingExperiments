
class Balloon {
  
  float _y;
  float _yVel; // Y Velocity (Y Speed)
  float _gravity;
  
  Balloon(float y) {
    
    _y = y;
    _yVel = 3;
    _gravity = 0.3;
    
  }
  
  void render(boolean rise) {
    
    // To make our Balloon rise
    // we subtract gravity, and to
    // make it fall, we add gravity.
    
    if(rise) {
      _yVel -= _gravity;
    } else {
      _yVel += _gravity;
    }
    
    // Constrain the velocity of our Balloon so it's not too crazy
    
    if(_yVel > 5) _yVel = 5;
    if(_yVel < -5) _yVel = -5;
    
    _y += _yVel;
    
    if (_y <= 0) _y = 0;
    
    shape(Elephant,80,_y);
    

    //rect(80, _y,50,90);
    
  }
  
}


