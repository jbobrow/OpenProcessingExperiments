
// Keep this line as is, except for renaming the class
class Aramirez01Obj extends AnimatedObject { 
  float a;
  float x = 100;

  
  // Constructor
  Aramirez01Obj(float size) { 
    
    // ...
  }

  // Displays the creature
  void display() {
   
  float px = x;
  float py = 500;

  
  
  for (float y=500; y>= 400; y=y-1) {// subclass draw method 
    float xx = x+ 4*sin(y*0.2) *sin(a);
    line(px, py, xx, y);
    px = xx;
    py = y; 
    
  }
  
  a = a + 0.2;

}
  

  // Moves the creature
  void move() {// the seaweed will move across the screen
    x=x+1; 
    x=(x+1)%width;
    
  }
  
}



