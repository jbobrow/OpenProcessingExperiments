
float a = 1;
void setup () {
  size (500,500);
  noCursor();
  background (0);

}


void draw () {
  triangle (mouseX, mouseY, width/2, height/2, width/3, height/3);
  stroke (1+a,41,99,20); 
  noFill();
  // a += 1 ;

}
