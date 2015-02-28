
float circleX = 500;
float circleY = 350;
float moveX = 6;
float moveY = -6;


void setup(){
 smooth();
 size(1000, 700);
 noStroke();
 
  
}

void draw(){
  background(0);
  
  
  
 
  fill(0, 255, 255);
  
  ellipse(circleX, circleY, 40, 40);
  circleX= circleX + moveX;
  circleY = circleY + moveY;
  
  if(circleX > width){
    circleX = width;
    moveX = -moveX;
  } 
  if(circleY > height){
    circleY = height;
    moveY = -moveY;
  }
   if(circleX < 0){
   circleX = 0;
   moveX = - moveX;
   
  }
  if(circleY < 0){
    circleY = 0;
    moveY = -moveY;
    
  }
  
  
if(mousePressed == true){
  
}else{
  
  
  fill(0, 255, 255);
  
  ellipse(mouseX, mouseY, 40, 40);
  
  
    
  
  
}  
}

