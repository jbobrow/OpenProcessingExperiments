
void setup () {
  
  size (400,400);
  smooth ();
  background(130,0,150);
  
}



void draw () {
  
  line (pmouseX, pmouseY, mouseX, mouseY);
}

