
class Circle {
  color c;            // color
  color cChange;      // color change
  float xPos;         // X position
  float yPos;         // Y position
  float d;            // diamter
  float dChange;      // diameter change
  float ySpeed;       // falling speed
  float ySpeedChange; // falling speed change
  float sColor;       // stroke color
  
  // constructor
  Circle(color _c, color _cChange, float _xPos, float _yPos, float _d, float _dChange, float _ySpeed, float _ySpeedChange, float _sColor){
    c = _c;
    cChange = _cChange;
    xPos = _xPos;
    yPos = _yPos;
    d = _d;
    dChange = _dChange;
    ySpeed = _ySpeed;
    ySpeedChange = _ySpeedChange;
    sColor = _sColor;
  }

  void moveCircle(){
    yPos += ySpeed;
    // when the bubble gets to the bottom of the skeych
    // it comes back to the top of the sketch
    // falling speed increases by ySpeedChange
    if (yPos > height+20){
      yPos=0;
      ySpeed = ySpeed + ySpeedChange;
    }
  }
  
  void drawCircle(){
    stroke(sColor);
    //
    if(yPos > height+18){
      // Color is decreasing by cChange
      c = c - cChange;
      // Diameter is increasing by dChange
      d = d + dChange;
    }
    fill(c);
    ellipse(xPos, yPos, d, d);
  }
}

