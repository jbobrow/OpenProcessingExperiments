
void setup(){
size (400,400);
}

void draw(){
  if(mousePressed == true) {
    point(mouseX,mouseY);
  }
}

void keyPressed() {
  save("MY_SKETCH.PNG");
}

