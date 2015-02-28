
// takes the method for drawing a star and generalize it into a 
// function that can be easily re-used 

void setup() {
  size(600, 200);
  noStroke();
  smooth();
}

void draw() {
  background(0);

  for (int i=0; i < 5; i++) {
    float space = width/5; // the space in the between stars
    float x = space/2 + i * space; // the x position of each star    

    // randomize the parameters to create different stars!
    int points = int(random(5, 10));
    float thickness = random(5, 50);
    float dia = random(30, space/2);

    star(x, height/2, points, thickness, dia);
  }

  // stops the draw() loop from running, but don't exit the program
  noLoop();
}

//------------------------------------------------------------------------
// code for drawing a star
// takes 5 arguments
void star(float x, float y, int points, float thickness, float diameter) {
  float angle = TWO_PI / points; // TWO_PI = 360 degrees 
  pushMatrix(); // save the position / orientation of the origin
  translate(x, y); // move the origin where we want the star
  for (int i=0; i < points; i++) {
    rotate(angle); // rotate by the angle increment for each triangle
    triangle(-thickness/2, 0, 0, diameter, thickness/2, 0);
  }
  // restore the origin's orientation and position as it was when 
  // we first called pushMatrix() above
  popMatrix();
}

