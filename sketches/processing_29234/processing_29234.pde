
void setup(){
  size(850, 500);
  smooth();
  background (0);
}
 
 
void draw(){
  
  noStroke();
  fill(255, 255, 255, 20);
  
  if(mousePressed){
  ellipse(mouseX, mouseY, 120, 120);
}else{
    
  stroke(255, mouseX);
  line(width/2, height-0, mouseX, mouseY);
  line(width/2, 0, mouseX, mouseY);
  }
}

