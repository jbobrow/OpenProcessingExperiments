

void setup(){
size(600, 600);
background(255);
}

void draw() {
  background(255);
  noStroke();
  fill(236,0,140,150);
ellipse(mouseX-mouseY,mouseY+mouseX,300,300);
  fill(0,174,239,150);
ellipse(mouseY+mouseY,mouseX-mouseY,300,300);
 fill(255,242,0,150);
ellipse(mouseY,mouseX,300,300);
  
}


