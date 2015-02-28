
void setup(){  
  
  size(500,500);
  background(0);
}  


void draw(){  
  if (mousePressed && (mouseButton == LEFT)){
  stroke(54,234,212,30);
  strokeWeight(2);
  line(mouseX,mouseY,0,0);
  }
} 


