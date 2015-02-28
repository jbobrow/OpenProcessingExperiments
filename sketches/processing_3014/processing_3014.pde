
void setup(){
  size(500,500);
  background(104,52,216);
}
void draw(){
  stroke(0);
  fill(50,234,72);

  triangle(mouseX,mouseY,50,400,150,400);
  triangle(mouseX,mouseY,200,450,300,450);
  triangle(mouseX,mouseY,350,400,450,400);
  triangle(mouseX,mouseY,50,100,150,100);
  triangle(mouseX,mouseY,200,50,300,50);
  triangle(mouseX,mouseY,350,100,450,100);
  triangle(mouseX,mouseY,40,200,40,300);
  triangle(mouseX,mouseY,460,200,460,300);
}

void mousePressed(){
  background(104,52,216);
}


