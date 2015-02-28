
//    Symmetria   //
//       By       //
//  Mistah Specs  //

void setup() {
  size(500, 500);
  // Replace '(500, 500)' with '(screen.height, screen.height)'
  // and use Ctrl+Shift+R for present mode
  background(255);
  colorMode(HSB, 100);
} 

void draw() {
  smooth();
  // Circles  
  if(mousePressed && (mouseButton == LEFT)) {
    strokeWeight(25);
    stroke(random(33, 85), 100, 100);
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(mouseY, mouseX, pmouseY, pmouseX);    
    line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
    line(height-mouseY, width-mouseX, height-pmouseY, width-pmouseX);
    line(width-mouseX, mouseY, width-pmouseX, pmouseY);
    line(height-mouseY, mouseX, height-pmouseY, pmouseX);
    line(mouseX, height-mouseY, pmouseX, height-pmouseY);
    line(mouseY, width-mouseX, pmouseY, width-pmouseX);
  }
  // Black Lines
  if(mousePressed && (mouseButton == RIGHT)) {
    strokeWeight(4);
    stroke(random(33, 85), 100, 0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(mouseY, mouseX, pmouseY, pmouseX);    
    line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
    line(height-mouseY, width-mouseX, height-pmouseY, width-pmouseX);
    line(width-mouseX, mouseY, width-pmouseX, pmouseY);
    line(height-mouseY, mouseX, height-pmouseY, pmouseX);
    line(mouseX, height-mouseY, pmouseX, height-pmouseY);
    line(mouseY, width-mouseX, pmouseY, width-pmouseX);
  }
  // Space-Bar Clears
  if(keyPressed && (key == ' ')) {
    background(100, 0, 100);
  }
}


