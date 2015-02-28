
void setup() {  //setup function called initially, only once
  size(300, 300);
  noStroke();
}

void draw() {  //draw function loops 
background(255);
fill(0);
triangle(0,300,300,300,300,0);
fill(32,178,170);
ellipse(mouseX, mouseX, mouseY/2, mouseY/2);
fill(218,165,32);
ellipse(300-mouseX,25,mouseY/2, mouseY/2);
fill(255,20,147);
ellipse(25,mouseY,mouseY/2, mouseY/2);
}
