
//  R.A. Robertson 2009.02 - 2011.10 "Stars" ~ www.rariora.org ~
//Built from scratch, but inspired by NodeBox "StarFun"

float b; //Base value
float h; //Height value
float xb; //X location first base vertex
float xb2; //X location 2nd base vertex
float xh; //X location height vertex, (average xb1, xb2)
float yb; //Y location for both base vertices
float yh; //Y location for height vertex
float r; // Rotation
float deg; // Degrees to radians
float numStars = random(100); // Set range for number of stars
float points; // Set point range on stars

void setup() {
  size (600, 400);
  smooth();
  colorMode(HSB);
  background(0);
  noStroke();
//  stroke(0,50);
}

void draw() {

  translate(width/2, height/2); //Move origin to center of window

  //Outer loop resets conditions for each star creation
  for (int n =0; n < numStars; n++) { 
    points = int(random(2, 75));
    deg = 360;
    r = radians(deg/points); //Rotation in radians, converted from degrees
    //fill(random(255),random(255),random(255),random(50,100)); //RGB all random
    fill(random(204, 255), random(100, 255), random(51, 153), random(10, 25)); //HSB modified from NodeBox

    translate(random(-100, 100), random(-100, 100)); //Random scatter. Turn off for starburst
    rotate(random(-3, 3));

    // Build an isosceles triangle
    b = random(1, 5);
    h = random(500);
    xb = 0 - b; // Locate near origin to facilitate rotation
    xb2 = xb + (b * 2);
    xh = (xb + xb2)/2; //average distance between base points
    yb = 0;
    yh = yb - h;

    //Inside loop makes a star from iso triangles
    for (int i = 0; i < points; i++) { 
//      translate(0,10); // Just for kicks. Have fun with these values
      rotate(r);
      triangle(xb, yb, xh, yh, xb2, yb);
    }
  }
  noLoop();
}
void mousePressed() {
  setup();
  loop();
}

