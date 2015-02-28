
class Bullet{
 
 float x;
 float y; 
  
 float velY;
 
 Bullet(){
   
   reset();
   
 }
  
 void reset(){
   
   x = width/2;
   y = height;

   velY = -2;
   
 }
  
  
  void update(){
     
    y += velY;
   
    
    
  }
  
}

