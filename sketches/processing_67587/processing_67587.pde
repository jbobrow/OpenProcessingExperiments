
void setup() {
size(1000, 700);
background(0);
smooth();
}

void draw(){
 if (mousePressed == true) {
  fill(255);
  } else {
  fill (0);
}
rect(mouseX, mouseY, 30, 30);
}



