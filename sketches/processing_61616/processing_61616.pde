
// Lines follow your cursor
// cdiana@cmu.edu
 
void setup() {
  size(200, 400);
  smooth();
}
 
void draw() {
  // set the background color
  background(#FDFFD8);
  // pen color set to black
  stroke(0);
  
  // draw two small lines following cursor
  strokeWeight(4);
  line(mouseX-10, mouseY, 100, 100); // offset by a little bit
  line(mouseX-10, mouseY-10, 200, 400); // offset by both x and y
}
  
  //save a picture
  void keyPressed() {
      saveFrame();
    }


