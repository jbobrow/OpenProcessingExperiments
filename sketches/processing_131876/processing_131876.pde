
  void setup() {
       size(200, 200); 
       stroke(255);
     } 


void draw() {
  
background(192, 64, 0);  
strokeWeight(mouseX);
fill(mouseX,0,0,mouseY);
line(mouseX, mouseY, mouseX, mouseY);


}


