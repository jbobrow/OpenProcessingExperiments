
void setup () {
  size (800, 800);
}

void draw() {


  line(mouseX, mouseY, 20, 20);
  fill(#B0E319);
  triangle(20,20,200,200,mouseX,mouseY);
  fill(#E0105C);
  rect(mouseY, mouseX, 20, 20);
   line(mouseY, mouseX, 20, 20);
  fill(#F70A2A);
  rect(mouseX, mouseY, 20, 20);
  fill(#B21D99);
  triangle(20,20,200,200,mouseY,mouseX);
 

  
}
