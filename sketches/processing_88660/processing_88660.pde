


void setup() {
  size (600, 600);
}

void draw() {
  background(0);
  noStroke();

  //The Spider hunts its Prey
  float prey = dist(mouseX, mouseY, pmouseX, pmouseY);
 


  //Four Spider Eyes
  
  
  //Spider Eye 3
    fill(0);
    ellipse (200, 250, 50, 50);
    fill (255);
    
    float trackLittleLeftXInner=map(mouseX, 0, 600, 193, 207);
    float trackLittleLeftYInner=map(mouseY, 0, 600, 243, 257);
    float trackLittleLeftXOuter=map(mouseX, 0, 600, 195, 205);
    float trackLittleLeftYOuter=map(mouseY, 0, 600, 245, 255);
    
    ellipse (trackLittleLeftXInner, trackLittleLeftYInner, 40, 40);
    fill (0);
    ellipse (trackLittleLeftXOuter, trackLittleLeftYOuter, 41, 41);

  //Spider Eye 4

    fill(0);
    ellipse (400, 250, 50, 50);
    fill (255);
    float trackLittleRightXInner=map(mouseX, 0, 600, 393, 407);
    float trackLittleRightYInner=map(mouseY, 0, 600, 243, 257);
    float trackLittleRightXOuter=map(mouseX, 0, 600, 395, 405);
    float trackLittleRightYOuter=map(mouseY, 0, 600, 245, 255);
    
    ellipse (trackLittleRightXInner, trackLittleRightYInner, 40, 40);
    fill (0);
    ellipse (trackLittleRightXOuter, trackLittleRightYOuter, 41, 41);


  //Spider Eye 1
    fill(0);
    ellipse (250, 300, 100, 100);
    fill (255);
    
    float trackBigLeftXInner=map(mouseX, 0, 600, 240, 260);
    float trackBigLeftYInner=map(mouseY, 0, 600, 290, 310);
    float trackBigLeftXOuter=map(mouseX, 0, 600, 245, 255);
    float trackBigLeftYOuter=map(mouseY, 0, 600, 295, 305);
    
    ellipse (trackBigLeftXInner, trackBigLeftYInner, 80, 80);
    fill (0);
    ellipse (trackBigLeftXOuter, trackBigLeftYOuter, 82, 82);
    
    //Spider Eye 2
    fill(0);
    ellipse (350, 300, 100, 100);
    fill (255);
    
    float trackBigRightXInner=map(mouseX, 0, 600, 340, 360);
    float trackBigRightYInner=map(mouseY, 0, 600, 290, 310);
    float trackBigRightXOuter=map(mouseX, 0, 600, 345, 355);
    float trackBigRightYOuter=map(mouseY, 0, 600, 295, 305);
    
    ellipse (trackBigRightXInner, trackBigRightYInner, 80, 80);
    fill (0);
    ellipse (trackBigRightXOuter, trackBigRightYOuter, 82, 82);

/*
  //Grid for Test
  stroke(0);
  noFill();
  for (int i = 0; i < height; i += 50) {
    for (int j = 0; j < width; j += 50) {
      rect(j, i, j+50, i+50);
    }
  }
  */
}



