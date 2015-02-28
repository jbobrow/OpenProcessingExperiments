
void setup (){
  size (400,400);
  background (250, 232, 30);
  smooth ();
}

void draw (){
  fill (250, 232, 30, 100);
  rect (0,0,width, height);
  fill (0);
  ellipse (mouseX, mouseY, mouseX/2, mouseX/2);
  }
  

