

  void setup () {
  
  size (500, 500);
  smooth ();
    background (127);
  }
  
  void draw () {
  
  
 // ellipse (mouseX, mouseY, 80, 80);
 float x = random (0, 100);
 
  ellipse (random (mouseX), random (mouseY), x, x);
   
  fill (random (255), random (255), random (255));
  
  }                
                                
