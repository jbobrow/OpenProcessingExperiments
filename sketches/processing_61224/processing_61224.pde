
void setup() {
  size(400,400);
  
  rectMode(CENTER);
  
  background(255,255,255);
}
 
void draw() {
    stroke(255,255,255);
    fill(242,0,61,5);
    ellipse(150,190,mouseX/3,mouseY/3);   
    
    fill(190,200,50,5);
    ellipse(200,190,mouseX/3,mouseY/3);   
    
    fill(15,137,16,5);
    ellipse(250,190,mouseX/3,mouseY/3);   
    
   if(mousePressed){  
   background(255,255,255);  
   } 
    
}
