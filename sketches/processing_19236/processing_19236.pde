
void setup(){
  size (250,250);
  strokeWeight (.3);
  background(0);
  smooth();
}
void draw (){
  stroke (0,277,35);
  line (mouseX, mouseY, 175, 175);
  stroke(0);
  line (mouseY, mouseX, 175, 175);
  
}
 


