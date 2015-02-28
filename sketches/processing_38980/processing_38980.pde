
// reference for the composition is from the tibetian prayer flags
// its a distortion of the triangluar flags to trapezoidal shapes 
void setup() {
  size(400, 400);
  colorMode(RGB);
  background (245, 210, 10, 30);
}

void draw() {
  for (int x=0; x<width-39; x+=40) {
    for (int y=10; y<height-30; y+=50) {
      tibetianFlag (x, y);
      stroke(237, 54, 17);
      strokeWeight(7);
      point (x+10, y+20);
    }
  }
  noLoop();
}
// defining the formation of each trapezoid in the form of a helper function
void tibetianFlag (float a, float b) {
  pushMatrix();
  translate(a, b);// shifts the co-ordinate system from 0,0 to the defined axi
  fill (random(250), random(250), random(200));
  noStroke();
  smooth();
  quad (random(30), 0, random(10, 60), 0, random(30, 70), 50, 20, 40);
  //variating some lengths of the trapezoids and keeping some of them stationary to generate pleasing forms
  stroke(0, 0, 0);
  strokeWeight(3);
  point (a, b);
  popMatrix();
}



