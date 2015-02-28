
int x;
int y;
int directionx;
int directiony;


void setup(){
  size(800,450);
  background(random(255),random(255),random(255));
 
   

  x = 0;
  y = 0;
  directionx =5;
  directiony =5;
} 

void draw(){
  if (mousePressed == true) {
    fill(random(255),random(255),random(255));
  } else {
    fill(mouseY);
  if (keyPressed == true) {
    background(random(255),random(255),random(255));
  } else {
    fill(mouseY);
  }  
  }
   

    
  
  x += directionx;
  y += directiony;
  if(y > 450){
    directiony = -5;
      
  
  }
    
   
   ellipse(x,y,100,100);
    fill(random(255),random(255),random(255));
   if(x > 800){
    directionx = -5;
     
   
   }

   if(y < 0){
     directiony = +5;
 
      
   }
   if(x < 0){
      directionx = +5;
        
   }  

   }


 




