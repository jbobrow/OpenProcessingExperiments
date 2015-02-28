
// Cicular Reflections //
//         By          //
//    Mistah Specs     //


void setup() {
  size(500, 500); //For OpenProcessing Viewing Only
  // Replace '(500, 500)' with '(screen.height, screen.height)'
  // and use Ctrl+Shift+R for present mode
  background(0);
}

void draw() {
  smooth();
  // Blue/Green Circles
  if(mousePressed && (mouseButton == LEFT)) {
    stroke(0, random(255), random(255));
    strokeWeight(2);
    fill(random(255), 0, random(255), 127);
    ellipse(mouseX, mouseY, 4, 4);
    ellipse(mouseY, mouseX, 4, 4);
    ellipse(width-mouseX, height-mouseY, 4, 4);
    ellipse(height-mouseY, width-mouseX, 4, 4);
    ellipse(mouseX, height-mouseY, 4, 4);
    ellipse(height-mouseY, mouseX, 4, 4);
    ellipse(width-mouseX, mouseY, 4, 4);
    ellipse(mouseY, width-mouseX, 4, 4);
    ellipse(mouseX*.5, mouseY*.5, 4, 4);
    ellipse(mouseY*.5, mouseX*.5, 4, 4);
    ellipse(width-mouseX*.5, height-mouseY*.5, 4, 4);
    ellipse(height-mouseY*.5, width-mouseX*.5, 4, 4);
    ellipse(mouseX*.5, height-mouseY*.5, 4, 4);
    ellipse(height-mouseY*.5, mouseX*.5, 4, 4);
    ellipse(width-mouseX*.5, mouseY*.5, 4, 4);
    ellipse(mouseY*.5, width-mouseX*.5, 4, 4);
    ellipse(mouseX*2, mouseY*2, 4, 4);
    ellipse(mouseY*2, mouseX*2, 4, 4);
    ellipse(width-mouseX*2, height-mouseY*2, 4, 4);
    ellipse(height-mouseY*2, width-mouseX*2, 4, 4);
    ellipse(mouseX*2, height-mouseY*2, 4, 4);
    ellipse(height-mouseY*2, mouseX*2, 4, 4);
    ellipse(width-mouseX*2, mouseY*2, 4, 4);
    ellipse(mouseY*2, width-mouseX*2, 4, 4);
  }
  // Red/Blue Cirles
  if(mousePressed && (mouseButton == RIGHT)) {
    stroke(random(255), 0, random(255));
    strokeWeight(6);
    fill(0, random(255), random(255), 127);
    ellipse(mouseX, mouseY, 4, 4);
    ellipse(mouseY, mouseX, 4, 4);
    ellipse(width-mouseX, height-mouseY, 4, 4);
    ellipse(height-mouseY, width-mouseX, 4, 4);
    ellipse(mouseX, height-mouseY, 4, 4);
    ellipse(height-mouseY, mouseX, 4, 4);
    ellipse(width-mouseX, mouseY, 4, 4);
    ellipse(mouseY, width-mouseX, 4, 4);
    ellipse(mouseX*.5, mouseY*.5, 4, 4);
    ellipse(mouseY*.5, mouseX*.5, 4, 4);
    ellipse(width-mouseX*.5, height-mouseY*.5, 4, 4);
    ellipse(height-mouseY*.5, width-mouseX*.5, 4, 4);
    ellipse(mouseX*.5, height-mouseY*.5, 4, 4);
    ellipse(height-mouseY*.5, mouseX*.5, 4, 4);
    ellipse(width-mouseX*.5, mouseY*.5, 4, 4);
    ellipse(mouseY*.5, width-mouseX*.5, 4, 4);
    ellipse(mouseX*2, mouseY*2, 4, 4);
    ellipse(mouseY*2, mouseX*2, 4, 4);
    ellipse(width-mouseX*2, height-mouseY*2, 4, 4);
    ellipse(height-mouseY*2, width-mouseX*2, 4, 4);
    ellipse(mouseX*2, height-mouseY*2, 4, 4);
    ellipse(height-mouseY*2, mouseX*2, 4, 4);
    ellipse(width-mouseX*2, mouseY*2, 4, 4);
    ellipse(mouseY*2, width-mouseX*2, 4, 4);
  }
  // Black Lines
  if(mousePressed && (mouseButton == CENTER)) {
    strokeWeight(3);
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
  // Spacebar Clears
  if(keyPressed && (key == ' ')) {
    background(0);
  }
}


