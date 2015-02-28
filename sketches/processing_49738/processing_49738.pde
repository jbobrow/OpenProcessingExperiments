
// make a gaudy, crazy drawing
// @author: hugh s
// @title: gaudy drawing

void setup() {
  size(900, 450);
  background(0);
  noCursor();
}

// this color defines color of center circle
color c = color(255,255,255);

//this int determines how many frames to go until resetting
int resetCounter = 0;

void draw() {

// this determines how long it takes for the canvas to reset
/*  if(resetCounter < 500) {
      resetCounter++;
  } else{
      background(random(100,255),random(100,255),random(100,255));
      resetCounter = 0;
  }
  */

  // this section makes the white center circle
  noStroke();
  fill(c, c);
  ellipse(mouseX,mouseY, 20,20);
  explode();
  
}

void explodeLines(int x, int y) {
    stroke(255, 255, 255, int(random(0,100)));
    line(mouseX, mouseY, x, y);
}

void mouseMoved() {
    // random coordinates to send to explodeLines
    int x = int(random(0, 900));
    int y = int(random(0, 450));
    
    explodeLines(x, y);
}

void explode() {
   // creates an ellipse as long as i is > 0, decremented by 20
   // this ellipse is displaced by translate in a random direction
   // determined by a random number between -10 and 10
   
   for(int i = 255; i>0; i = i-20) {
     translate(random(-10,10), random(-10,10));
     fill(i/random(1,4),i/random(1,4),i/random(1,4));
     ellipse(mouseX,mouseY,20,20);
   }
}

//this section changes the background and clears the page on mouse click
void mouseClicked() {
  background(random(0,255),random(0,255),random(0,255));
}                                                                                                                                               
