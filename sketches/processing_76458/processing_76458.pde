
boolean shoot = false;

void setup(){
    
    size(600,700);
  }
  
void draw(){ 
   background(#ABB0E8);         
   
  if (mousePressed == true){
   fill(250,20,20);
   strokeWeight(3);
   line(mouseX, 565, mouseX, 0);
   } 
   
   //wings and body
   fill(#72737C);
   noStroke();   
   rect(mouseX-20,590,40,10);
   triangle(mouseX-20, 600, mouseX+20, 600, mouseX, 565);
   //nose
   fill(#585A71);
   rect(mouseX-2,564,4,8);
   triangle(mouseX-8, 580, mouseX+8, 580, mouseX, 565);   
  
   
  if (mouseX>=0 || mouseY>=0){
   //fire  
   fill(#F7BC16);
   triangle(mouseX-7, 600, mouseX+7, 600, mouseX, 625);  
   fill(#DB4116);
   triangle(mouseX-5, 600, mouseX+5, 600, mouseX, 617);  
  } 
 
}
