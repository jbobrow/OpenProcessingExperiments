
class Point { 
  float ypos, xpos, xposNew, yposNew; 

  
  Point (float density) {  
    xpos = density;
    ypos = density;  
  }
  
  
  Point (float x, float y) {  
    xpos = x;
    ypos = y;
  }


  void update() { 
   point (xpos,ypos);
  } 

}




