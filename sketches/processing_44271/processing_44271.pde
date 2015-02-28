
void setup (){
  size (600,600);
  smooth ();
}
void draw (){
  ellipse(300, 300,mouseX,mouseY);
  ellipse(mouseX,mouseY, 70, mouseY);
    ellipse(mouseX, 300, mouseX, 70);
}

