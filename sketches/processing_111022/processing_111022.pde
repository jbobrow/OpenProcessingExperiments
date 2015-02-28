
void setup(){
  // setting the size of the window
  size(400, 400);
  //changing the color of the background
  background(17, 121, 18);
  // removing the strokes, that surround the shapes
  noStroke();
  // turning smooth function on
  smooth();
  // drawing some shades inside the window
  ellipse(25, 25, 30, 15);
  ellipse(225, 70, 10, 40);
  ellipse(175, 320, 40, 40);
  arc(300, 250, 45, 45, 0, PI+QUARTER_PI, PIE);
}
 
void draw() {
  for(int i=0; i<30; i++){
    //as long as the mouse is pressed
    if(mousePressed) {
      //draw rectangulars that are filled in this colos
      fill(95, 1, 14, 100);
      rect(mouseX, mouseY, 15, 15);
      //if the mouse is not pressed
    } else {
      // draw a trianle instead and fill it in a different color
      fill(32, 41, 85, 60);
      triangle(mouseX, mouseY, mouseX + 20, mouseY -20, mouseX + 40, mouseY);   
  }
 
  }

}



