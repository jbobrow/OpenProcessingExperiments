
void setup (){
  size (600,600);
  smooth ();
}
void draw (){
  ellipse(mouseX, 300, mouseX, 70);
  ellipse(300,mouseY, 70, mouseY);
}

