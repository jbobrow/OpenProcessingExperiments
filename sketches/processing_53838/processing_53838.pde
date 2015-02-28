
//Kim Sipkens
//PS2 Q2
void setup() {
  size(400,400);
  background(83);
  smooth();
  noStroke();
 
}
 
void draw() {




if (mousePressed && (mouseButton==LEFT)) {
  brush(mouseX,mouseY);
}
}
void brush(int x, int y) {

  fill(mouseX,mouseY,100,160);



  rect(mouseX,mouseY,50,50);
 
ellipse(mouseX, mouseY, 100, 25);
ellipse(mouseX,mouseY, 25, 100);

translate(45, 45);

ellipse(mouseX,mouseY, 100, 25);
ellipse(mouseX,mouseY, 25, 100);


}
 


                
                
