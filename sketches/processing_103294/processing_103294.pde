
void setup () {

size (500,500);
}

void draw () {
  background (255) ;
  ellipseMode(CENTER) ;
  ellipse (mouseX,mouseY,200,200) ;
  line (mouseX-30,mouseY+40,mouseX+30,mouseY+40) ;
  strokeWeight(10);
  point(mouseX-20,mouseY-40) ;
  point(mouseX+20,mouseY-40) ;
if (mousePressed == true) {
 ellipseMode(CENTER) ;
  ellipse (mouseX,mouseY,200,200) ; 
  strokeWeight(10);
  point(mouseX-20,mouseY-40) ;
  point(mouseX+20,mouseY-40) ;
  arc(mouseX, mouseY+40, 80, 80, 0, PI+QUARTER_PI, OPEN);
}
}
