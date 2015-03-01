
void setup(){

size(600, 600);
background(0);

stroke(120, 0, 150, 100);



}

void draw(){
  noFill();
  ellipse(300, 300, mouseX, mouseY);
  
if(keyPressed == true && key == 's'){
  println("Saving image...");
  saveFrame("output-####.jpg"); 
}}



