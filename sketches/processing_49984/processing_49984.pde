
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

void setup() {
  size(640, 360);
  smooth();
  noStroke();

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;

  //text setup
  textSize(12);
  textAlign(CENTER, BOTTOM);
}

void draw() {
  background(255);
  fill(255, 206, 165);
  rect(rx, ry, rd, rd);
  fill(149, 224, 250);
  ellipse(ex, ey, ed, ed);

  float x = width/2;

  //rectangle
  if (mouseX > rx && mouseX < rx +rd && mouseY >
    ry && mouseY < ry + rd) {
    if (mouseX>=x) {
      fill(82, 53, 8);
      rect(rx, ry, rd, rd);
    }
    if (mousePressed == false) {
      stroke(100);
      strokeWeight(2);
    } 
    else {
      noStroke();
      fill(8, 63, 82, 185);
      rect(rx-25, ry-25, rd+50, rd+50);
    }
  }


//circle

float d= dist(mouseX, mouseY, ex, ey);

if (d < ed/2) {
  fill(8, 63, 82);
  ellipse(ex, ey, ed, ed);
  if (mousePressed == false) {
    stroke(200);
    strokeWeight(3);
  } 
  else {
    noStroke();
    fill(82, 52, 8, 185);
    ellipse(ex, ey, ed+50, ed+50);
  }
}

//hello!
if (keyPressed) {
  text("Hello!", width/2, height*.99);
}
}

