
/*
Pearlyn Lii
 ID3 - Spring 2013
 Boundaries
 02/02/13
 */

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

float [] x = new float[300]; //set var for array

void setup() {
  size(640, 360);
  smooth();
  colorMode(HSB, 360, 100, 100);

// ------------------- Set the x- and y-coordinates for the rectangle
  
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

// ------------------- Set the x- and y-coordinates for the ellipse
  
  ex = width * 0.66;
  ey = height * 0.5;

// ------------------- Setup for array

  for (int i = 0; i < x.length; i++) {
    x[i] = random(-300, 200);
  }
}

// ------------------- for RECT - bg change when mousePressed

void draw() {
  if ((mouseX>=rx) && (mouseX<=(rx+100)) && (mouseY>=ry) && (mouseY<=(ry+100)) && (mousePressed == true))
  {
    background(360);
  }

// ------------------- for ELLIPSE - bg change when mousePressed

  if ((mouseX>=(ex-53)) && (mouseX<=(ex+53)) && (mouseY>=(ey-53)) && (mouseY<=(ey+53)) && (mousePressed == true))
  {
    background(0);
  }

  fill(42, 27, 96); 
  noStroke();  
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
  
// ------------------- for arrays to show for ELLIPSE

  if ((mouseX>=(ex-53)) && (mouseX<=(ex+53)) && (mouseY>=(ey-53)) && (mouseY<=(ey+53))) //if ellipse hovered over do this
  {

    fill(42, 27, 96, 10);
    for (int i =0; i<x.length; i++) {
      x[i] += 0.5;
      float y = i*2;
      arc(x[i], y, 12, 12, 0.52, 5.76);
    }
  }
  else //when not hovered over, look like this
  {
    fill(151, 42, 96);
    ellipse(ex, ey, ed, ed);
    ellipse(ex, ey, ed, ed);
  }
  
// ------------------- for arrays to show for RECT

  if ((mouseX>=rx) && (mouseX<=(rx+100)) && (mouseY>=ry) && (mouseY<=(ry+100)) ) //if rect hovered over do this
  {
    fill(151, 42, 96, 10);
    for (int i =0; i<x.length; i++) {
      x[i] += 0.5;
      float y = i*2;
      arc(y, x[i], 12, 12, 0.52, 5.76);
    }
  }
  else //when not hovered over, look like this
  {
    fill(151, 42, 96);
    rect(rx, ry, rd, rd);
    rect(rx, ry, rd, rd);
  }
}



