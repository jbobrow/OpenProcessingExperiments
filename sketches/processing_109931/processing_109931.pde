
class BasketBall {
  
  private PImage img; 
  private final static String BBALL = "bball2.png";
  
  private float x,y; 
  private float xspeed,yspeed; 
  
  
  BasketBall() {
   img = loadImage(BBALL);
   x = random(width);
   y = random(height);
   xspeed = random(-5,5);
   yspeed = random(-5,5);
  }
  
  void setXspeed(float _f) {
   xspeed = _f; 
  }
  
  void setYspeed(float _f) {
   yspeed = _f; 
  }
  
    void move() {
    x += xspeed; 
    y += yspeed; 
    
  
    if (x > (width-img.width) || x < 0) {
      xspeed *= - 1;
    }
   
    if (y > height-img.height || y < 0) {
      yspeed *= - 1;
    }
  }
  

  void display() {
      image(img, x, y);
  }
    
}

