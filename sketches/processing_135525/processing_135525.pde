
void setup(){
size(400,400);
background (0);
smooth();
}
void draw () {
  fill (mouseX,mouseY,124);
  noStroke ();
  triangle (mouseX,mouseY,mouseX-10,mouseY-10,mouseX+20,mouseY+30);
}
