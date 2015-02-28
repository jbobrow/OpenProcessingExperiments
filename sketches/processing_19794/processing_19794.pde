
void setup() {
 // define the window size & enable anti-aliasing
 size(400, 200);
 smooth();
 // Set "ink" color, font, and alignment for rendering text.
 fill(0);  // Black
 // setup the font (system default sans serif)
 textFont(createFont("SansSerif",18));
 textAlign(CENTER);
 noLoop();  // draw() only once
}
 
void draw() {
 // Draw text to screen using the previously set font.
 text("Hello World!", width/2, height/2);
}                   
