
float a = 1;
void setup () {
  size (500,500);
  background (0);

}

void draw () {

  ellipse (mouseX, mouseY, width/6, height/6);
  fill (1+a,41,99,20); 
  noStroke();
  a += 1 ;

}
