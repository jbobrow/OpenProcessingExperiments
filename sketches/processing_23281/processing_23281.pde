
//Elise Inferrera's Homework #3

void setup(){
  size(600,600);
  background(255);
  smooth();
}
//Ellipses
void draw(){
  stroke(255);
  fill(random(255),random(255),random(255),50);
  ellipse(mouseX,mouseY,mouseX,mouseY);
  
//Lines  
  for(int i = 0; i < 5; i++){
    strokeWeight(.5);
    line(mouseX,mouseY,random(width),random(height));
  }
}


