
void setup() {
  size(400,400);
  background(95,98,55,89);
} 
void draw() {
  //background(192, 64, 80);
  line(150, 25, mouseX, mouseY, mouseX, mouseY);
  stroke(5,12,45,2);
  line(150, 55, mouseX, mouseY);
  line(150, 155, mouseX, mouseY);
  line(15, 5, mouseX, mouseY);
  line(80, 125, mouseX, mouseY, mouseX, mouseY);
  line(34,142, mouseY, mouseX); 
  line(56,89, mouseX, mouseY);
}
//the code in mousePressed() is only executed when the mouse button is pressed
void mousePressed() {
  stroke(0);
  fill(55,34,25,20);
  triangle(mouseX,mouseY,32,3,34,mouseX);
  ellipse(200,200,random(200),random(200));
}
  
//the code in kePressed() is only executed when a keyboard key is pressed
void keyPressed() {
  background(70,80,52,7);
}         
                
