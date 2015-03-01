
void setup(){
 
size(600, 600);}
void draw(){
  
  if(mousePressed) {
    noFill();
    ellipse(mouseX, mouseY, 20,20);
  
  }else{ 
  fill(100,0,220);
  ellipse(mouseY, mouseX,random(60),random(100));}}
