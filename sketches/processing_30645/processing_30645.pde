

Car[] carros; 
 
int num;

void setup(){
  size (800,600); 
   
  num = 600; 
  carros = new Car[num]; 
  
  for ( int i =0; i< num; i++){
      carros[i] = new Car ( 0, random (height), random (6));
  }
  
}

void draw(){
  background(255);
  
  
   for ( int i =0; i< num; i++){
     
     carros[i].drive();
      carros[i].display();
      
  }

}


 
class Car{
  
  float r,g,b; 
  float xpos; 
  float ypos; 
  float xspeed; 
  
  
  Car ( int t_xpos, float t_ypos, float t_xspeed  ){
    
   xpos = t_xpos; 
   ypos = t_ypos; 
   xspeed = t_xspeed; 
   r = (164); 
   g = (228); 
   b = random(229); 
  
  }
  
  
  void drive (){
    
    xpos = xpos + xspeed; 
    if ( xpos > width){
     xpos = 0; 
     ypos = (int) random(height); 
     r = (231); 
     g = random(250); 
     b = (114); 
    }
    
  }
  
  
  void display (){
    
    fill(r,g,b); 
    rect (xpos, ypos, 200, 10); 
  
  }
  
}

