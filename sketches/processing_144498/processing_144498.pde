
void setup () {
size (1000,600);
}

void draw(){
  fill(mouseY/2,mouseX-50,mouseX);
  ellipse(mouseX,mouseY,mouseY/2,mouseY/2);
}
