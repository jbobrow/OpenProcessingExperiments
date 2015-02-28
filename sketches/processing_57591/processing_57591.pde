
class Cup
{
  float x, y;
  float w;
  color c;
  float sw;
  float scaleVal; 
  float angleInc; 
  float angle;

  Cup(float _x, float _y, float _w, float _scaleVal, float _angleInc, color _c, float _sw)
  {
    x=_x;
    y=_y;
    w=_w;
    scaleVal=_scaleVal;
    angleInc=_angleInc;
    c= _c;
    sw= _sw;
    angle = 0;
  }
  
  void wave()
  {  
    //liquid
    for (float i = -(w/2); i<= w/2; i+=1) {
   
     float j = sin(angle)*scaleVal;
      ellipse(x+i,y+j, 0.5, 0.5);
      angle += angleInc;
        
    }
  }

  void display()
  {
    stroke(c);
    strokeWeight(sw);
    //body
    arc(x, y, w, w, radians(-20), radians(200));
    //handle
    arc((x+w/2), y, (w*0.3), (w*0.3), radians(-90), radians(90));
    arc((x+w/2), y, w/5, w/5, radians(-90), radians(90));
    
  }
}



