
 void setup () {  

  size(680,800);  
  background(0);  

}  
   
void draw() {  
  fill(100);
  stroke(100);  

  fill(random(255),random(200),random(150),random(200));  

  rectMode(CENTER);  

  rect(mouseX,mouseY,random(10,40),random(10,60));  

}  


