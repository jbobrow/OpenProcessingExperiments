
/* Doctor Who / Recursion Emulator
   A simple feedback technique based on taking a copy of the
   current screen and feeding it back slightly rotated and
   scaled down */ 

boolean copyMade;
PImage lastImage;  // Delayed copy of the current screen
float liRotate = 2;  // Rotation between copies
float liScale = 0.95;  // Scaling between copies

void setup() {
  size(500, 500);
  lastImage = createImage(500, 500, RGB);
  copyMade = false;
}

void draw() {
  background(0);

  // Make sure "real" objects move between frames
  translate(width/2, height/2);
  rotate(radians(frameCount*0.5));
  translate(-width/2, -height/2);

  // Draw copy if present
  if (copyMade) {
    pushMatrix();
    
    translate(width/2, height/2);
    rotate(degrees(liRotate));
    translate(-width/2, -height/2);
    scale(liScale, liScale);
    
    image(lastImage, 0, 0);

    popMatrix();
  }

  // Draw "real" objects
  noStroke();
  fill(191 + (frameCount % 62), 127 + (frameCount % 128), 63 + (frameCount % 192), 64);
  rect(width/3, height/4, width/6, height/7);
  fill(127 + (frameCount % 128), 63 + (frameCount % 192), 191 + (frameCount % 62), 64);
  ellipse(width/6, height/3, width/7, height/8);

  noFill();
  stroke(63 + (frameCount % 192), 191 + (frameCount % 62), 127 + (frameCount % 128), 64);
  strokeWeight(10);
  line(5*width/6, 2*height/3, 6*width/7, 7*height/8);
  strokeWeight(1);

  // Copy current screen
  loadPixels();
  for (int i=0; i<width*height; i++) {
    lastImage.pixels[i] = pixels[i];
  }
  lastImage.updatePixels();
  copyMade = true;
}

void keyPressed() {
  if (keyCode == LEFT) {
    liRotate = constrain(liRotate-0.01, -5, 5);
  }
  if (keyCode == RIGHT) {
    liRotate = constrain(liRotate+0.01, -5, 5);
  }
  if (keyCode == UP) {
    liScale = constrain(liScale+0.01, 0.1, 2);
  }
  if (keyCode == DOWN) {
    liScale = constrain(liScale-0.01, 0.1, 2);
  }
}


