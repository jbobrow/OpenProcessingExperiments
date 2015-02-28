
class Moon {
  
   // moon directions
  float x;
  float y;
  PImage moon;
   
  float offsetX;
  float offsetY = 20;
  float angle = 0.0;
  float angleMoon = 0.0;
  float scalar = 5;
  float speedMoon = 0.05;
  
  float scaleMoon = .6;
  
  Moon () {
      offsetX = width - 100;
    
      moon = loadImage ("moon.png");
  }
  
  void move ()
  {
   float multiply = 1/scaleMoon;
   angleMoon += 0.02;
   
   x = (offsetX * multiply)  + cos (angle) * scalar;
   y = (offsetY * multiply) + sin (angle) * scalar;

     if (mousePressed) {
      speedMoon = -speedMoon; 
     }
   
    angle += speedMoon;
  }
  
  void display () {
        
      pushMatrix();
      scale (scaleMoon);
      image (moon, x, y); 
      popMatrix();
  }
}
  
  

