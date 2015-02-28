
void setup(){
  size(400,400);
  background (0);
  
  
}
  
void draw(){
   
if(mousePressed){
  
 background (0); 
  
  fill(255);
  noStroke();
  ellipse (mouseX, mouseY, random(10,300),random(10,300));
   
}


}
