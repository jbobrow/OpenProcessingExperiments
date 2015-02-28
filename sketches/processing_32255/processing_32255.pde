
void setup(){
size(800, 400);
}

void draw() {
   println(mouseX);
  background(mouseX);
  println(mouseY);
  if(mouseY <200) {

fill(230, 0, 60);
  }else{
    background (30, 0, 10);
  }
rect(120, 210, 80, 90);
ellipse(156, 146, 155, 155);

fill(30, 0, 10);
ellipse(70, 60, 80, 90);

fill(10, 90, 75);
ellipse(240, 60, 80, 90);
triangle(130, 175, 158, 120, 186, 175);

fill(140, 0, 75);
triangle(60, 20, 90, 0, 18, 15);
line(330, 420, 485, 475);
}

