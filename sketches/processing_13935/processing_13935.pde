

                
       void setup() {
  size(500,500);
  stroke(random(0), 70);
  background(0);
}




void draw() {
  
  
  fill(random(255),random(255),random(255), 70);
  rect(mouseX,mouseY,300,300);
  
  fill(random (255),random(0),random(0), 70);
  ellipse(mouseX,mouseY,300,300);
  
  fill(random(0),random(0),random(255), 70);
  ellipse(mouseY,mouseX,300, 300);
  
}
         
