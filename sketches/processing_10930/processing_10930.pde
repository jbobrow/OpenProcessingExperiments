
class ColorBalls {
  
  float xpos;
  float ypos;
  float randSize;
  
  float showUpCounter = 0;
  
  ColorBalls (float _xpos, float _ypos, float _randSize) {
    
    xpos = _xpos;
    ypos = _ypos;
    randSize = _randSize;
    
  }
  
  void display() {
    fill(random(255),random(255),random(255),random(100));
    noStroke();
    ellipse(xpos,ypos,randSize,randSize);
  }
}

