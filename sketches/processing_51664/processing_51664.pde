
class Ball {
 
    float x = 0;
    float y = 0;
    float speedX = 4;
    float speedY = 0.5;

    
        Ball(float _x, float _y) {
          
          x = _x;
          y = _y;
        }
          
  void run() {
    
   display();
   movement();
   bounce();
   gravity();
  }
  
  void display() {
    ellipse (x, y, 60, 60);
  }
  
  void movement() {
   
    x += speedX;
    y += speedY;
  }
  
  void bounce() {
    
    if (x > width-30) {
      speedX = speedX * -1;
     fill( random(255), random(255), random(255));
    }
    if (x < 30) {
      speedX = speedX * -1;
    fill( random(255), random(255), random(255));
  }
    if (y > height-30) {
      speedY = speedY * -1;
      fill( random(255), random(255), random(255));
    }
    if (y < 30) {
      speedY = speedY * -1;
      fill( random(255), random(255), random(255));
    }
  }
  
  void gravity() {
    speedY += 0.2;
  }

}

