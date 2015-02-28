
void setup(){
  
  size(700,400);
  background(0);
  stroke(0);
  
} 

float rectX = 350;
float rectY = 0;
float speed = 0;
float gravity = 0.1;


void draw(){
  
  background(0);
  fill(219,187,121);
  rect(rectX,rectY,50,50);
  
  rectY = rectY+speed;
  speed = speed+gravity;
  
    
  if(rectY > 350){
  
    speed = speed*-0.99;
    
  }
  

}

