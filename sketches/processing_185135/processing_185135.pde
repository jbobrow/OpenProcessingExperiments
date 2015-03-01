
class FirefliesSystem {
  Fireflies parts [];
  
  FirefliesSystem (int num){ 
    parts= new Fireflies [num]; 
    for(int i=0; i<parts.length; i++){  
      parts[i]= new Fireflies(); 
    }
  }
  void render(){
     for(int i=0; i<parts.length; i++){
      parts[i].display();
    }
  }
}

class Fireflies{
  float x,y,vx,vy;
  float radius =4;
  float decelerate;
  
 Fireflies(){
 update();
  }
 void update(){
 x =random (width);
 y= random(100, 380);
 vx= random (0, -1);
 
 }

void display(){
  
  vx+= random(-0.2, 0.2);
  x+= vx;
  
  
  if(y>350){
    decelerate = -10;
  if (vx<0){
    update();
  }
  
  }fill (255,347,3);{
    
  if(mousePressed ==true) {
      fill (random(219),random(255),random(252));
    }else{
      fill (255,347,3);
    }
    {
   noStroke ();  } 
 }
ellipse (x,y,radius, radius);
 }
  
  }
  



