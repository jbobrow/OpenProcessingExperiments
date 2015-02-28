
// A Hole object
class Hole{
  //A hole object knows about its location in the grid as well as its size
  float x,y;   // x,y location
  float w,h;   // width and height



  // Hole Constructor
  Hole(float tempX, float tempY, float tempW, float tempH) {
    
    x = tempX;
    y = tempY;
    
    w = tempW;
    h = tempH;
  } 

  void display() {
    stroke(0);
    fill(0);
    ellipse(x,y,w,h);     
  }
  
  void setSize(float d) {
    float t = (dx+dy)/2;
    d = map(d,0,1,minR*t/100,maxR*t/100);
    w = d;
    h = d;
  }
  
  
}

