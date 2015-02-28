
//My rule for this projet was to create a series of boundaries 
//and have primatives that were inverses of each other occupy 
//radomly within the space.
void setup() {
  size (500, 500);
  colorMode(HSB, 100);
  noStroke();
  smooth();
  background(100);
}

//Variables that change randomly add you press the mouse. 
//Final drawing complete at the mouse count max which is = 30
float x = mouseX;
float count = 30;
float rectSize;
float ellipseSize;


void draw() {
}

//All commands are in mouse pressed so that all the primaives
//appear after each click.
//The bounding lines should appear first and from there the 
//remaining primatives randomly plot
void mousePressed() {
  x = mouseX;

  //Rectagles that bound creating L
  if (count > 0) {
    rectSize = random (10, 50);
    fill(80, 100, 100, 10);
    strokeWeight(2);
    stroke(50, 80, 90, 10);
    rect(random(20, 60), random(60, height), rectSize, rectSize);
    rect(random(70, 500), random(60, height/3), rectSize, rectSize);

    //Changed the orgin to (200,200)
    //Red ellipses in center space
    pushMatrix();
    translate(200, 200);
    noStroke();
    fill(100, 100, 100, 10);
    if (count >0) {
      ellipse(random(0, 150), random(10, 300), ellipseSize, ellipseSize);
      popMatrix();
    }

    //Bounding Lines
    strokeWeight(5);
    stroke(0, 10, 100, 100);
    line(0, 55, 180, 55);
    line(180, 200, 180, 500);
    line(480, 200, 480, 500);
    line(380, 200, 380, 500);

    //Mouse Pressed Command, Drawing Machine
    if (mousePressed == true) {
      strokeWeight(4);
      stroke(50, 100, 100, 10);
      line(mouseX, 0, mouseX, 0);
    }
    else {
      stroke(0);
    }

    // Blue Ellipse that bound creating an L...inverse of Rectangles
    //These however imply the boudary, do not meet like the rectangles
    if (count > 0) {
      ellipseSize = random (5, 30);
      fill(50, 100, 100, 10);
      stroke(80, 100, 100, 10);
      strokeWeight(2);
      ellipse(random(400, 300), random(height), ellipseSize, ellipseSize);
      ellipse(random(width/3), random(480, 440), ellipseSize, ellipseSize);

      for ( int a = 300; a <= 100; a -=10) {
        stroke(60, 100, 100, 10);
        line(0, 400, 0, height);
      }
    }
  }
  count--;
}


