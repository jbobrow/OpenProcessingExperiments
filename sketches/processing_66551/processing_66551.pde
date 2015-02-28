
PFont myFont;

boolean bUp;
float myY;

void setup() {
  size(80, 500);
  background(255);
  bUp = false;
  myY = 1;
  
  myFont = loadFont("Courier-Bold-14.vlw");
  textFont(myFont, 14);
}

void draw() {
  background(255);
  text("use keys", 8, 15);
  text("U and D!", 8, 30);

  smooth();
  noStroke();

  // make it, place it
  fill(100);
  ellipseMode(CORNER);
  ellipse(15, myY, 50, 50);

  // make it move
  if (bUp == false) {
    myY = myY * 1.1;
  } 
  else {
    myY = myY * 0.95;
  }
  
  // make it bounce from side
  if (myY >= 450) {
    bUp = true;
  } 
  else if (myY <= 1) {
    bUp = false;
  }

  // toggle on request
  if (keyPressed) {
    if (bUp == false && key == 'u') {
      bUp = true;
    }

    if (bUp == true && key == 'd') {
      bUp = false;
    }
  }
}
