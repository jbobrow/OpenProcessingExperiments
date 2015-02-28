
class Ball{
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
  
  Ball (float xin, float yin, float din, int idin, Ball[] oin){
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  }
  
  void move(){
    vy += gravity;
    x += vx;
    y += vy;
    if (x+diameter/2>width){
      x = width-diameter/2;
      vx*=friction;
    }
else if (x - diameter/2 < 0) {
      x = diameter/2;
      vx *= friction;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= friction; 
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= friction;
    }
//    if (y+diameter/2==height){
//      diameter*=2;
  }
  
  void display() {
    fill(255, 204);
        //if (diameter[i]!=diameter){    
    ellipse(x, y, diameter, diameter);
  }
}      

