
int value = 0;

void setup() {
  size(300, 300);
  background(0);
}


void draw() { 
  if(mousePressed == true) { 
    value = 255;

  }
ellipse(156, 146, 155, 155);
fill(255,255,255);

ellipse(156, 146, 55, 55);
fill(255,255,255);

ellipse(100, 146, 55, 55);
noStroke();
fill(255,255,0);

ellipse (mouseX, mouseY, 55, 55);


  }





