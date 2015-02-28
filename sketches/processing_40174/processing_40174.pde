
void setup() {
  size(700, 700);
  background(140);
  smooth();
}
 
void draw() {
  colorMode (HSB, 700,100,700); //change color mode to fit size//
  println(mouseX + " " + mouseY + " " + pmouseX + " " + pmouseY); //tells me whats up//
      if (mousePressed){
        line( pmouseX, pmouseY, mouseX, mouseY); //line based on mouse position//
        stroke (mouseX, 80, mouseY); //vary stroke based on mouse position//
        fill(mouseY *.5, 23, mouseX * .5); //vary fill color based on mouse position//
      }
      
  strokeWeight(abs(mouseX - pmouseX /**(abs(mouseY-pmouseY))*/));
  /* turn on the-- *(abs(mouseY-pmouseY)) -- for a psychedelic light show; a happy accident*/
}
 
void mousePressed() {
  background(140);
}  // clears the background

