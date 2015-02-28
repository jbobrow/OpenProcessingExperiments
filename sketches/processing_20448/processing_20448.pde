
void setup() {
  size(600, 600);
  background(150);
  colorMode(HSB, 600, 100, 600);
  stroke(100);
  smooth();
}

void draw() {
  println(mouseX + " " + mouseY);
  stroke(mouseX, 360, mouseY);
  line(random(300), random(300), mouseX, mouseY);
  
}

// clear bkg
void mousePressed() 
{
background(150);
}


