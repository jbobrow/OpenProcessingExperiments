
PFont font;
String annex = "L1W 3Z2"; // repeats itself 
 
void setup() {
  size(250, 250);
  background(155);
  smooth();
}
 
void draw() {
 

  font = loadFont("BelleroseLight-48.vlw"); //font family 
  textFont(font, 65); //font, size
  fill(255); 
  text("L", 90, 50);
  text("1", 140, 90);
  text("W", 49, 130);
  smooth(); // smooth type 
 
  frameRate(10);
  textFont(font, 60);
  fill(random(255),random(255),random(255)); // causes color change
  text("3", 110, 120); 
  text("Z", 150, 180);
  text("2", 180, 240);
 
  if(mousePressed) { // when mouse is pressed this function works
    smooth();
    textFont(font, 10);
    fill(random(255));  
    text("L1W3Z2 L1W3Z2 2Z3L1Q 3Z2L1W", mouseX, mouseY); // small type
  }

  if(keyPressed) {
    background(0);
     
 
}
}

