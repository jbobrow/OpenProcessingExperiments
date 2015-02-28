
class Ball{
  float x = 100;
  float y = 200;
  float speedx = 4;
  float speedy = 4;
  
  Ball(){
   
  }
  
  void display(){
   ellipse(x,y,40,40); 
   
  }
  void moving(){
   x+=speedx; 
   y+=speedy;
  }
  void rebound(){
   if (x>width || x<0){
     speedx=-speedx;   
   }
   if (y<0){
     speedy=-speedy;   
   } 
   
  }
  void reset(){
   if (keyPressed) {
    if (key == 'r') {
      x = 150;
      y = 0;
    }
   }
  }
  
}

