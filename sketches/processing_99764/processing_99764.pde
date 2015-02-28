
void setup() { 
  size(500, 500);
  background(15);
}
void draw() {   
  stroke(random(255),random(25), random(80),random(50,90));

  if (mousePressed == true) {
    strokeWeight(random(8));
    line(mouseY, mouseX, mouseX, mouseY, 9);
    line(mouseY, mouseY, mouseY, mouseX, 9);
   // line(mouseX, mouseY, mouseX, mouseX, 9);

  }
  
}


