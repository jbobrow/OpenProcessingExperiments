

boolean f=false;
void setup() {
  size(600, 600);
  background (12, 32, 123);
  fill (245, 945, 23);
}
void mouseReleased () {
  if (f==false) {
    f=true;
  } 
  else if (f==true) {
    f=false;
  }
}
void draw () {
  if (f==true) {
    rect (mouseX, mouseY,23,56);
    fill (123,345,533);
  }
  else if (f==false)
  {
    ellipse(mouseX, mouseY, 40, 10);
    fill (123,98,546);
  }
}


void keyPressed() {
  if (key=='s') {
    save ("foto.png");
  }
}



