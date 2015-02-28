
void setup(){
  background(0,0,0);
  size(600,600);
  smooth();
 // noStroke();
}


void draw() {
   fill(map(mouseX,0,width,100,255),0,100);
   ellipse(mouseX, mouseY, 100, 100);
   scale(0.5);
   ellipse(mouseX, mouseY, 100, 100);
}


void keyPressed(){
  if (key == 'r') { 
    background(255, 0, 0);
  }
  if (key == 'g') {
    background(0, 255, 0);
  }
  if (key == 'b') { 
    background(0, 0, 255);
  }
   if (key == 'y') { 
    background(255, 255, 0);
  }
}

