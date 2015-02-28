
//Interactivity 28  Winter 2012 Professor Michael Kontopolis
//Written by Angie Fu



float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 100;  // ellipse diameter
float easing = 0.07;
float easingA = 0.04;

void setup() {
  size(640, 360);
  smooth();

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33;
  ry = height * 0.5;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {

  background(102);
  rectMode(CENTER);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);

  if ((mouseX>rx-50)&&(mouseY>ry-50)&&(mouseX<(rx+50))&&(mouseY<(ry+50))&&(mousePressed))

  {

    float targetX = mouseX;  
    rx += (targetX-rx) * easing;
    float targetY = mouseY;  
    ry += (targetY-ry) * easing;
    background (102);
    fill(25, 200, 100);
  }

  else
  {
    rx += ((width * 0.33)-rx) * easingA;
    ry += ((height * 0.5)-ry) * easingA;
  }

  rect(rx, ry, rd, rd);
  fill(255);

  if ((dist(mouseX, mouseY, ex, ey) < ed/2)&&(mousePressed)) {

    float targetX = mouseX;  
    ex += (targetX-ex) * easing;
    float targetY = mouseY;  
    ey += (targetY-ey) * easing;

    fill(255, 50, 60);
  }

  else
  {
    ex += (width*0.66-ex) * easingA;
    ey += (height*0.5-ey) * easingA;
  }

  ellipse(ex, ey, ed, ed);
  fill(255);
}



