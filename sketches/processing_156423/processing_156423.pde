

void setup(){
  
  background(255);
  size(300, 300);
  stroke(255, 0, 0);
 

 }

void draw(){
  
  line(0, mouseX, mouseY, 0);
  
  
if(keyPressed == true && key == 's'){
  println("Saving image...");
  saveFrame("output-####.jpg"); 
}}



