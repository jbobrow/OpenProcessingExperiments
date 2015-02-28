
class Ball {
  color c;
  color d;
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float acc;
  int rad;
  float r;
  

  
  Ball(float xTemp, float yTemp) {
    rad = (10);
    c = color(0);
    d = color(255,0,0);
    xpos = xTemp;
    ypos = yTemp;
    xvel = 5;
    yvel = 5;
    acc = 0.95;
    r = 10;
    
    
  }
  
  void make(){
    noStroke();
    fill(c);
    ellipse(xpos,ypos,r,r);
  }
  
  void red(){
    c = d;

  }
 }



