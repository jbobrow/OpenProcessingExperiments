
float a = 63;
void setup () {
  size (500,500);
  background (69,85,13,4);

}


void draw () {
  triangle (mouseY, mouseX, width/6, height/2, width/6, height/3);
  stroke (23+a,65,19,220); 
  noFill();
  // a += 1 ;

}
