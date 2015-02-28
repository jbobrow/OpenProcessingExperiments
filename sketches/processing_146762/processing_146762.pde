
void setup() {
  size (400,400);
  smooth();
  frameRate (100);
  
}

void draw() {
 fill(0, 2);  // background colour, alpha for motion blur
 rect(0,0,width,height); // background shape size of window
 line(9,3,6,5,6,6);
 fill(255);
 beginShape();
vertex(mouseX-50, mouseY-150);
vertex(mouseX, mouseY+100);
vertex(250, 300);
vertex(75, 175);
vertex(275, 175);
endShape();
 
 
}

