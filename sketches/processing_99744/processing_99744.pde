
void setup() {  
  size(400, 400);
  background(192,192,192); 
}
void draw() {    
  stroke(random(75),random(255),random(100,255),100);
  strokeWeight(2+mouseX/50); 
  if(mousePressed == true) { 
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}
