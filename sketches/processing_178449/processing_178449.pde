
int counter;
 
void setup() {
  size(400, 250);
  background(188,230,0);
}
 
void draw() { 
if(mousePressed == true){
  ellipse(mouseX,mouseY,30,30);
  ellipse(mouseX,mouseY+35,40,40);
  ellipse(mouseX,mouseY+80,50,50);
  ellipse(mouseX-6,mouseY,2,2);
  ellipse(mouseX+6,mouseY,2,2);
  triangle(mouseX,mouseY+2,mouseX,mouseY+6,mouseX-8,mouseY+5);
  }
}
 

