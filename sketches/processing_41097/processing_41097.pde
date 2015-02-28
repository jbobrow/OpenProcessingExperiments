
void setup() {
  
  size(400, 400); 


  smooth();
  
}


void draw() {
  
   //background(200);
   noStroke();
   
   fill(200, 50);
    
  
    
        
   if(mousePressed){
      stroke(255); 
     
   }else{
  
        stroke(0);  
        
}
   
  ellipse(200,200, mouseX, mouseY);
smooth();
 ellipse(200,200, mouseX, mouseY);
 smooth(); 
  
  ellipse(10,10, mouseX, mouseY);
smooth();

  ellipse(390,390, mouseX, mouseY);
smooth();

  ellipse(10,400, mouseX, mouseY);
smooth();

  ellipse(400,10, mouseX, mouseY);
smooth();
}







                
                
