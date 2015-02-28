
class Contj{
  float x,y;
  float ellSize;
  float speed = 10;
  
  
  //constructor
  Contj(float _x, float _y, float _ellSize){
    x = _x;
    y = _y;
    ellSize = _ellSize;
  }
  
  //methods
  void display(){
    fill(0,100,200);
    noStroke();
    ellipse(x,y,ellSize,ellSize);
  }
  
  void update(){
   //Movement
   if(keyPressed){
     if(keyCode==LEFT){
       x-=speed;
     }
     if(keyCode==RIGHT){
       x+=speed;
     }
     if(keyCode==UP){
       y-=speed;
     }
     if(keyCode==DOWN){
       y+=speed;
     }
   }
    
    //---------------------//
    
    //Boundaries
    if(x<ellSize){
      x=ellSize;
    }
    if(x>(width-ellSize)){
      x=(width-ellSize);
    }
    if(y<ellSize){
      y=ellSize;
    }
    if(y>(height-ellSize)){
      y=(height-ellSize);
    }
  }
  
  
  }
  



