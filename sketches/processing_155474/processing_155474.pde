
void setup(){
  // runs once 
  
  size(1000, 500);
}
 
void draw(){
  // runs repeatedly
   
   println("Hello!");
   fill(mouseX, mouseY, 0, 50);
   stroke(mouseX, mouseY, 0, 50);
   rect(10, 10, 979, 479);
   
   fill(mouseY, mouseX, 0, 100);
   stroke(mouseY, mouseX, 0, 100);
   rect(100, 100, 800, 300);
   
   noFill();
   stroke(0,0,0);
   line(200, mouseY, 800, mouseY);
   
   /* 
  Add the code to the end of your draw() function.
  Press 's' key to save.
  Images saved as output-####.jpg in sketch folder, where #### is the frame number.
*/
 
if(keyPressed == true && key == 's'){
  println("Saving image...");
  saveFrame("output-####.jpg"); 
}
}


