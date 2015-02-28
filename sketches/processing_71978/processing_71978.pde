
PFont f;

void setup(){
  size(600,600);
  colorMode(HSB);
  background(255);
  f = createFont("Arial", 16, false);
  smooth();
  noFill();
}

//line trail
void draw(){
  textFont(f);
  fill(0);
  text("Click and move the mouse to draw", 40, 560);
  text ("Press the spacebar to change the background color", 40, 580);
   if(mousePressed) {
     stroke(random(333), random(mouseX), random(mouseY));
     strokeWeight(4);
     line(pmouseX-50, pmouseY+50, mouseX, mouseY); //enables you to draw a line that is not connected at a point
   }
}

// clear background
void keyPressed() {
  background(random(333), random(333), random(333)); // random the background color when a key is pressed
}
