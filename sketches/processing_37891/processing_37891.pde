
//Gina DeMatteo
//Loop & Translation
//September 18,2011

void setup() {
  size(500, 500);
  background(0);
  colorMode(HSB);
  strokeWeight(.5);
  stroke(245, 146, 232, 60); 
  noFill();
  smooth();
}

int a = 10;
int b = 10;

void draw() {

  //Transformation code; draws the rotatedrectangles around the centered ellipse
  //Based off of the code given by Nick Senske
  pushMatrix();
  translate(width/2, height/2);  //move the origin to the center
  rotate(radians(a));          //rotate from the center, convert degrees to radians
  translate(185, 0);             //set the radius
  rotate(radians(b + 45));     //rotate the rect about the next axis
  rectMode(CORNER);
  rect(0, 0, 100, 100);          //draw the rect
  popMatrix();

  //increment the rotation
  b+=10;
  a++;

  //Loop that establishes the ellipse in the center; anchors the composition
  ellipseMode(CENTER);
  for (int ellipseSize=100; ellipseSize>=8; ellipseSize-=8) {
    ellipse(250, 250, ellipseSize, ellipseSize);
  }
}


