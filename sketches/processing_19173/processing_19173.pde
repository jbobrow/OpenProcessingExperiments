
//Single Variable, The bottom Y position of the triangle, or in this case, the icicle.
int t3b = 0;

//Basic setup for the entire screen width and height.
void setup() {
  size(900, 450);
  frameRate(30);
  smooth();
  background(255);
}

//Any functions listed work out here.
void draw() {
  snowDraw();
    if (mousePressed) {
      iceDraw();
    } 
}

// Function to cause the icicles.
void iceDraw() {
  if(mousePressed) {
    t3b = t3b + 1;
  } else {
    t3b = t3b - 1;
  }
  triangle(mouseX - 3, mouseY, mouseX + 3, mouseY, mouseX, t3b);
  stroke(255);
  strokeWeight(.5);
  fill(139,211,255); // I prefer RGB. But I know I don't have that much control over it as with HSB.
}

// Function that draws snow on screen at random points while user draws icicles.
void snowDraw() {
  noStroke();
  fill(203, 236, 255);
  ellipse(random(width), random(height), 5, 5);
}

  //the second the mouse is released it'll save. Is there any way to increment so that multiple images are saved?
void mouseReleased() {
}

 //function that allows the user to clear the screen. Any key can be pushed.
void keyPressed() {
  save("demo1.tiff");
  background(255);
}                                               
