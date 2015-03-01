
// setsup everything to run once at the beginging
void setup() {
// sets the size of the canvas at 750x 750  
  size(750,750);
// sets the background to black  
  background(0);
}
// draws over and over in a loop
void draw() {
// repeatedly draws the background black  
  background(0);
 // fill(255);
 // noStroke();
 // rect(0,375,750,375);
 //smoothes the font that will be called
   smooth();
//defines the font 
  PFont font;
// the varible font will call this particular font  
  font = loadFont("CourierNewPSMT-48.vlw");
// this font will be 64pts  
  textFont(font, 64);
//the font will produce the word "processing" at ,mousex and 385 
  text("processing", mouseX, 385);
//there will be no fill on this circle
 noFill();
// the stroke will be 360 points 
 strokeWeight(360);
// the stroke will be black 
 stroke(0);
// the circle will be placed in the center of the screen and
//will have a diameter of 450 pi
 ellipse(375,375,450,450);
}
  


