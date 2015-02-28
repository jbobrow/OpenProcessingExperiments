

String message = "Glimpse";


void setup() {
  size(400, 400);
  smooth();
  PFont didot =loadFont ("Didot-Bold-48.vlw");
  textFont(didot);
  textAlign(CENTER, CENTER);
  background(0, 0, 0);
}

void draw() {
  smooth();
  textSize(30);
  fill(20,20,50);
 
    background(0);

  if(mousePressed) {
    if (mouseButton == LEFT ) {
      fill(0);
      background(255);
    }
    else {
      fill(255);
      background(0);
    }
   text(message,200,200);
  }
}

