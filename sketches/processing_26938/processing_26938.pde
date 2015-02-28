
class Box{
  
 //GLOBAL VARIABLES
float x=0;
float y=0;
 float speedX = 5;
 float speedY = 4;
 
  
//CONSTRUCTOR  
  Box(float _x, float _y){
    x = _x;
    y = _y;  
  }
   
 //FUNCTIONS 
 void run(){
  display();
  move();
  bounce();
  gravity();
 }
 
 void gravity(){
  speedY += 0.2; 
 }
 
 void bounce(){
  if (x > width){
   speedX = speedX * -1;
  } 
  if (x < 0){
   speedX = speedX * -1;
  } 
  if (y > height){
   speedY = speedY * -1;
  } 
  if (y < 0){
   speedY = speedY * -1;
  } 
 }
 
 void move(){
  x += speedX;
 y += speedY; 
 }
 
  void display(){
    fill(mouseX,158,mouseY);
    rect(x,y,mouseX,mouseY);
  }
    
}

