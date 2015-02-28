
void setup() {
  size(500,500);
  rectMode(CENTER);
  background(200);
}
  
void draw() {
  
 if(mousePressed ==true) 
  stroke(255);
    fill(66,98,78,30);
         
    fill(220,150,244,30);
    ellipse(250,250,mouseX,mouseY);  
     
   if(mousePressed ==false){ 
 
   }
   
}
