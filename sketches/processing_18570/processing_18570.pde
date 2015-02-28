
void setup () {
  size(300,300) ;
  background(255);


}
void draw() {
 
  smooth ();
stroke(255,mouseY,mouseX) ;
  strokeWeight (1.5 );
  fill(0,0,0,0) ;
  rect(0,0, mouseX, mouseY) ;
}



