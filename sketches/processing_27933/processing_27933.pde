


class Balloon{
  //GLOBAL VARIABLES
  float x = 0;
  float y = 0;
  float speedX = 0.1;
  float speedY = 0.1;
  color col = color(28,177,255);
  boolean notPopped=true;
  
  //CONSTRUCTOR
  Balloon(float _x ,float _y) {
    
    x = _x;
    y = _y;
  y=random(height);   
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
   speedY += 0.005; 
  }
  
  void bounce(){
    
   if(x > width){
    speedX = speedX *  -1;
  
   }
   
    if(y > height) {
     speedY = 0;
     
     y = 0;
    
     sound.rewind();
     sound.play();
    }
    if(dist(mouseX,mouseY,x,y)<50){
      speedY = -abs(speedY);
    
      
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
     if(notPopped == true){
      
    fill(col);
    ellipse(x,y,50,60);
    line(x,y+30,x,y+100);
     }
    }
   }



