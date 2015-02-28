

void setup() {
  
 size(500, 500);
 background(255);
 
}

void draw() {
  
  if(mouseX >245 && mouseX < 255 && mouseY > 245 && mouseY < 255){
    background(0);
  }
  else{
    background(255);
  }
  if(mousePressed){
    fill(0);
    rect(0, 0, 10, 500);
    rect(50, 0, 10, 500);
    rect(100, 0, 10, 500);
    rect(150, 0, 10, 500);
    rect(200, 0, 10, 500);
    rect(250, 0, 10, 500);
    rect(300, 0, 10, 500);
    rect(350, 0, 10, 500);
    rect(400, 0, 10, 500);
    rect(450, 0, 10, 500);
}
  stroke(0);
  noFill();
  ellipse(245, 250, 5, 5);  
 
 }
    
  
 
  



