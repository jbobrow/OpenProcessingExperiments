
void setup () {
  size (1480,920);
  smooth();
  background (0,180,0);

}

void draw (){
  if (mousePressed) {
    fill (123,0,40);
  } else {
    fill(0,10,100);
  }
  ellipse(mouseX, mouseY, 225, 90);
}


