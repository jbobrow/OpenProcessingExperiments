
void setup(){
size(400,400);
background(255);
smooth();
}

void draw(){

  if (mousePressed) {
    fill(255);
triangle(20, mouseX, 50,mouseX, 200, mouseY);
  }
else background(255);
}



