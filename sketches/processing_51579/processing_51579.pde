
//Hasan M. 
//PS-1: Question 3

void setup() {
 size(800,800);
 background(0,0,205); 
 smooth();  
}

void draw() {
  fill(255,255,0);
 // arc(220,235,50,50,0, PI / 2.0); // lower quarter circle 
  arc(400, 400, 300, 300, -PI, 2.3);  // upper half of circle
  ellipse(200,450,50,50); 
  fill(mouseX,0,mouseY);
  arc(315, 335, 30, 50, -PI, 2.8);  // upper half of circle
}

void mousePressed() {
  fill(mouseX,0,mouseY);
  arc(mouseX, mouseY,100,100,-PI,2.3);
  fill(0,0,0);
  arc(mouseX-20,mouseY-23,10,20,-PI,2.8);
}

void mouseReleased() {
}

void keyPressed() {
  background(0,0,205);
}
  

