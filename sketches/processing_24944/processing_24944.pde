
void setup(){
  size (300,300);
  strokeWeight (.5);
  smooth ();
  background(0);
   
}
void draw (){
  stroke (#EDFF03, 20);
  line (150, 150, 300, 300);
  stroke (#EDFF03, 20);
  line (150, 150, mouseX, mouseY);
  line (mouseX, mouseY, mouseY, mouseY);

}

