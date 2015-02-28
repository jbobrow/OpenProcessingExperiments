
pt[] epoints = new pt[25]; //number of points to start with
 
 
 
 
 
void setup() {
 
  size(300, 300);
  background(0);
 
  for (int e=0; e < epoints.length;e++) {
    epoints[e] = new pt(width/2, height/2); //this line is seeding the array
  }
}
 
 
 
 
 
void draw() {
  
 
  for (int e=0; e < epoints.length; e++) {
    epoints[e].shift(); //sets up move command.
    epoints[e].make(); //sets up the drawing of points.
    
  }
}
 
 
 
 
 
class pt {
 
  float x;
  float y;
 
  pt(float x_, float y_) {
    x = x_;
    y = y_;
  }
 
 
  //draws the points with a random orange-ish color
  void make() {
    stroke(0,random(200,255),random(150,200));
    point(x, y);
    point(y,x);
  }
 
 
  //shifts the dots' x coordinates by 10, but the y coordinates randoml
  void shift() {
    
    
    x = x +=10;
    y = random(height/2 - 150, height/2+150);
    if(x>width+10){
      
      x=-10;
      if(y>height+10){
        y=-10;
      }
      
    }
 
  }
}


