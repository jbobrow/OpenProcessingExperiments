
class Circle{
  float x;
  float y;
  float w;
  float h;
  float speedx = random(10);
  float speedy = random(10);
  
  Circle(float ix, float iy, float iw, float ih){
    x = ix;
    y = iy;
    w = iw;
    h = ih;
  }
  
  void display(){
   ellipse(x,y,w,h); 
  }
  void moving(){
   x+=speedx; 
   y+=speedy;
  }
  void rebound(){
   if (x>width || x<0){
     speedx=-speedx;   
   }
   if (y>height || y<0){
     speedy=-speedy;   
   } 
   
  }
  
  
}

