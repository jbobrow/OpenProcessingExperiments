
// Programmer: Je Hyun, Park
// The circles represents our dream and the rectangles are the simple
// reality with full of bias, as black and white.
// If the reality comes too close to our dream our dream becomes simple
// and be ruined and turns into black.

void setup() {
  size(800, 600);
  background(240, 255, 255);
  stroke(0);
}

// Draw different colors of circles in different positions with
// using for loops.
void draw() { 

  for (int x=90;x<700;x+=60) {
    for (int y=90;y<500;y+=60) {
      ellipse(x, y, 100, 100);
      stroke(255, 0, 0);
    }
  } 
  for (int x=100;x<700;x+=50) {
    for (int y=100;y<500;y+=50) {
      ellipse(x, y, 90, 90);
      stroke(0, 191, 255);
    }
  }
  for (int x=200;x<600;x+=40) {
    for (int y=200;y<400;y+=40) {
      ellipse(x, y, 80, 80);
      stroke(124, 252, 0);
    }
  }
  for (int x=250;x<550;x+=30) {
    for (int y=250;y<350;y+=30) {
      ellipse(x, y, 70, 70);
      stroke(255, 255, 0);
    }
  }
  for (int x=300;x<500;x+=20) {
    for (int y=260;y<390;y+=20) {
      ellipse(x, y, 60, 60);
      stroke(250, 128, 114);
    }
  }
  for (int x=400;x<500;x+=10) {
    for (int y=270;y<340;y+=10) {
      ellipse(x, y, 50, 50);
      stroke(255,69,0);
    }
  }

// When the mouse ws pressed, a rectangle comes out and changes the 
// background color.
 if (mousePressed) {
    fill(0);
  } 
  else {
    fill(255);
  }
  rect(mouseX, mouseY, 80, 80);
}



