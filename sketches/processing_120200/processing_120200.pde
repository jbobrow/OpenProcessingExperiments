


void setup(){
  size(500,500);
  
  background(182,252,8);
}
void draw(){
  strokeWeight(1);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(mouseX,mouseY,(abs(mouseX-pmouseX)),10);
  rect(mouseX,mouseY,(abs(mouseX-pmouseX)),10);
  
  
  
  
  

}
void mousePressed(){
  triangle(mouseX,mouseY,mouseX-pmouseX,mouseX,mouseY,5);
}
  



