
PFont f;
String message = "processing... im lost";
float theta;

void setup() {
  size(400,400);
  background(200,150,110,255);
  f = createFont("georgia", 20, true);
}

void draw() {
  
  background(255);
  fill(0);
  textFont(f);                 // Set the font
  translate(width/3,height/2); // Translate to the center
  rotate(theta);               // Rotate by theta
  textAlign(CENTER) ;
  
  // The text is center aligned and displayed at (0,0) after translating and rotating. 
  // See Chapter 14 or a review of translation and rotation.
  text(message,0,0); 
  
  // Increase rotation
  theta += 0.05; 
}
