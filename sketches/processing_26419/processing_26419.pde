
void setup() { 
  size(200,200);
  background(255);
}

void draw() { 
}

void mousePressed() { 
  stroke(0); 
  fill(175); 
  rectMode(CENTER); 
  rect(mouseX,mouseY,16,16);
}

void keyPressed() { 
  background(255);
}

/*If "background(255);" is added to the draw() function the program
stops working as the screen is covered by the white background that 
is continuously being looped at the end of each draw() cycle, so that
the squares that occur with each mouse click are obscured.*/


