
PFont myFont;

void setup() {
  size(1000, 300, P3D);  
  background(235, 235, 225);
}

void draw() {
  myFont = createFont("Helvetica", 48); 
  fill (122, 127, 87);
  textFont(myFont);
  text("Starbucks", mouseX, mouseY, random(250), random(-100), random(400));
}



