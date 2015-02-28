


class Balloon{
  //GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 2;
  float speedY = 2;
  
  
  //CONSTRUCTOR
  Balloon(float _x ,float _y) {
    
    x = _x;
    y = _y;   
  }
  
  //FUNCTIONS
  void run() {
    display();
    move();
    bounce();
    gravity();
    mouseMoved();
  }
  void gravity(){
   speedY += 0.2; 
  }
  
  void bounce(){
   if(x > width){
    speedX = speedX *  -1;
   }
   if(x < 0){
     speedX = speedX * -1;
   }
    if(y > height) {
     speedY = speedY * -1;
    }
    if(y < 0){
      speedY = speedY * -1;
    }
  }
  
  void move(){
   x +=speedX; 
   y += speedY;
  }
  
   void display() {
    fill(255,0,0);
    ellipse(x,y,60,60);
    line(x,y+30,x,y+100);
   }
 }


