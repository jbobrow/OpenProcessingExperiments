
class beam {
  color c = color(243, 252, 0);
  float wireX;
  float wireY;
  float _wireX;
  float _wireY;
  beam(color c, float wireX_, float wireY_)
  {//constructor

    
  }

  void drawBeam() 
  {
    wireX = random(100, 250);
    wireY = random(250, 250);
    _wireX = random(250, 250);
    _wireY = random (75, 25);
    //_wireX = random(100, 300);
    //_wireY = random (100, 300);
    //delay (100);
    //DRAW THE RED WIRES
    //red led power
    noFill();
    stroke(c);
    line(_wireX,_wireY,wireX,wireY);
  
    stroke(100);
    fill(100);
  }
  
  void retractBeam()
  {
    
line(_wireX,_wireY,wireX-.1,wireY-.1);
//  _wireX = _wireX-1;
//  _wireY = _wireY-1;
//  wireX = wireX-1;
//  wireY = wireY-1;
  }
  
 
  
}


