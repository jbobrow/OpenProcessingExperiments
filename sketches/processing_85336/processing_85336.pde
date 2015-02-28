
import netscape.javascript.*;

/**
 * Cant touch this. 
 * 
 * Remake of "tickle," now with This. Try to touch it .
 * Off the screen - Game over.
 */
 
 

String message = "this";
float x, y; // X and Y koordinate teksta
float hr, vr;  // horizontalni in vertikalni premer teksta

void setup() {
  size(960, 500);
  PFont font = loadFont("TheSans-Plain-12.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  hr = textWidth(message) ;
  vr = (textAscent() + textDescent()) ;
  noStroke();
  x = width / 2;
  y = height / 2;
 
}


  void mouseReleased () {
     float d = dist (x+2, y+1, mouseX, mouseY);
    if (d< 10.5) {
      
  /// spreminji tole cifro za sensitivity, pa link klele uspodi
  
        link("http://www.youtube.com/watch?v=otCpCn0l4Wo&noredirect=1", "_new"); }}
 // da ti link odpre v novem oknu zamenji zgorno vrstico s spodnjo
 //     link("http://www.youtube.com/watch?v=otCpCn0l4Wo&noredirect=1", "_new"); }}
    
void draw() {
  // instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top, ce ga zadanš se zavrti komad
  
  background(255);
  fill(255, 120);
  rect(10, 10, width, height);
  fill(0);
  // If the cursor is over the text, change the position


  
    
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-10, 10);
    y += random(-10, 10);
  }
  text("THIS", x, y);
  
 
  
  
  
}


