
void setup(){  
   size(600,400);  
   background(50);  
}   
void draw(){  
   background(50);  
   noStroke();  
   fill(255);  
   if(mouseX<100) {  
       fill(255,0,0);  
   }  
   if(mouseX>100){
       fill(0,255,0);
   }    
   if(mouseY<width-50){
       fill(0,0,255);
   }            
   rect(mouseX,mouseY,20,20);  
} 
