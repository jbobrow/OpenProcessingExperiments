
void setup(){
  size(1200,700);

  
  
}

void draw(){
  ellipse(600, 350, mouseX, mouseX);
  fill(mouseX, mouseY, 0);
  stroke(0, mouseX, mouseY);
  strokeWeight(mouseX);
  noFill();
  ellipse(600, 350, 300, 300);
 
 if(keyPressed == true && key == 's'){
  println("Saving image...");
  saveFrame("output-####.jpg"); 
 }
 
}


