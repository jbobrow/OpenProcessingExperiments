
void setup() {
  size(500,500);
  smooth();
  
}
 
void draw() {
  background(200,100,50);
  noStroke();
  fill(100,50,60);
  ellipse(mouseY,mouseY,mouseY,mouseX);
   
  fill(mouseX,mouseY,mouseX);
  rect(300,150,200,200);
   
noFill();
stroke(20);
ellipse(10,mouseY,mouseY,13);
ellipse(mouseY,mouseY,35,mouseY);
rect(mouseX,mouseX,mouseX,mouseX);
ellipse(mouseY,534,mouseY,mouseX);
rect(60,mouseX,mouseX,mouseY);
 
}




