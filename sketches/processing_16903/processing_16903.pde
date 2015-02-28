
//    Inkblot   //
//      By      //
// Mistah Specs //

void setup() {
  size(500, 500); //For OpenProcessing Viewing Only
  // Replace '(500, 500)' with '(screen.height, screen.height)'
  // and use Ctrl+Shift+R for present mode
  background(255);
  colorMode(HSB, 255);
  smooth();
} 

void draw() {

  // Black Lines With Random Stroke Weight
  if(mousePressed && (mouseButton == LEFT)) {
    strokeWeight(random(1, 15));
    stroke(0);
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(mouseY, mouseX, pmouseY, pmouseX);
    line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
    line(height-mouseY, width-mouseX, height-pmouseY, width-pmouseX);
    line(width-mouseX, mouseY, width-pmouseX, pmouseY);
    line(height-mouseY, mouseX, height-pmouseY, pmouseX);
    line(mouseX, height-mouseY, pmouseX, height-pmouseY);
    line(mouseY, width-mouseX, pmouseY, width-pmouseX);
  }

  // Colored Lines With Random Stroke Weight
  if(mousePressed && (mouseButton == RIGHT)) {

    strokeWeight(random(3, 20));
    stroke(random(0, 32), 255, 255, 255);

    line(mouseX, mouseY, pmouseX, pmouseY);
    stroke(random(128, 160), 255, 255, 255);
    line(mouseY, mouseX, pmouseY, pmouseX);
    stroke(random(32, 64), 255, 255, 255);

    line(width-mouseX, height-mouseY, width-pmouseX, height-pmouseY);
    stroke(random(160, 192), 255, 255, 255);
    line(height-mouseY, width-mouseX, height-pmouseY, width-pmouseX);
    stroke(random(64, 96), 255, 255, 255);

    line(width-mouseX, mouseY, width-pmouseX, pmouseY);
    stroke(random(192, 224), 255, 255, 255);
    line(height-mouseY, mouseX, height-pmouseY, pmouseX);
    stroke(random(96, 128), 255, 255, 255);

    line(mouseX, height-mouseY, pmouseX, height-pmouseY);
    stroke(random(224, 240), 255, 255, 255);
    line(mouseY, width-mouseX, pmouseY, width-pmouseX);
  }

  // Space Bar Clears
  if(keyPressed && (key == ' ')) {
    background(255);
  }
}


