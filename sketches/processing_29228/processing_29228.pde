
void setup() { 
  size(640, 480); 
  smooth();
}

void draw() {
   background(255, 255, 255); 
  noStroke();
  fill(0, 0, 0);
   ellipse(320, 240, 100, 100);
   
PFont font;
font = loadFont("DIN-Medium-48.vlw"); 
fill(255, 255, 255);
textFont(font, 22); 
text("Hello", 294, 249);


}






