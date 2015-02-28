
void setup(){
  size(250,250);
  background(74,206,237,230);
  smooth();
}
 
void draw(){
  if (mousePressed==true) {
  stroke(44,76,100,40);
  line(mouseX,random(0,250),mouseY,random(0,250));
  }
}


