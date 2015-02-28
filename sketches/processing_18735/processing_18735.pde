
//move the circles around with the mouse, click and hold the mouse button to change shapes
void setup() {
  size(250, 250);
  background(0);
}

void draw() {
  
  strokeWeight(50);
  line(20, 0, 20, 250);
  strokeWeight(20);
  line(60, 0,60, 250);
  strokeWeight(10);
  line(90, 0, 90, 250);
  strokeWeight(5);
  line(110, 0, 110, 250);
  strokeWeight(1); 
  line(125, 0, 125, 250);
  
  if(mousePressed) {
   fill(#BD1550);
   stroke(#490A3D);
    rect(mouseX, mouseY, mouseX+25, mouseY-25);
    
  } else {
    fill(#F8CA00);
    stroke(#E97F02);
     ellipse(mouseX, mouseY, mouseX-40, mouseY+40);
  }
  
  
}


