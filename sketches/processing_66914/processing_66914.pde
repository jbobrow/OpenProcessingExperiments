

PFont myFontOne;
PFont myFontTwo;
float x = 600;
float y = 600;

void setup(){
  size(800, 800);
  background(0);
  frameRate(24);
  smooth();
  myFontOne = loadFont("TheSerifBlack-Caps-48.vlw");
  myFontTwo = loadFont("TheSansExtraBold-Plain-48.vlw");
}
void draw() {
  background(0);
  fill(mouseX, 255, mouseY );
  noStroke();
  rect(0, 0, width, height);
  println("R = " + mouseX + "B = "+ mouseY + " G = 0" );
  
  fill(255);
  frameRate(3);
  textFont(myFontOne);
  text("I'm serif", x, y);
  textFont(myFontTwo);
  text("I'm sans people loves me better", 40, 100);


  
  
}

