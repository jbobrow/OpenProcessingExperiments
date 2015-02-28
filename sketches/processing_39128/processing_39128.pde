
//Sketch by Miles Thomas
//Sunday, September 25, 2011
//Homework 5_1 for Comp Methods

void setup() {
  size(400, 400);
  background(0);
  ellipseMode(CENTER);
  smooth();
}

//void draw sets up the grid for the infinityEllipse program to follow
void draw() { 
  for (int x=50; x<=360; x+=100) {
    for (int y=50; y<=380; y+=100) {
      infinityEllipse(x, y);
      noLoop();
    }
  }
}

//infinity Ellipse creates a pattern of joined ellipses like
//an infinity sign, that are rotated to create a pattern
void infinityEllipse(float x, float y) {
  pushMatrix();
  translate(x, y);
  //sets up rotates at each 90 degrees, runs multiple times to overlap transparencies
  for (int r=0; r<360; r+=30) {
    rotate(radians(90));
    stroke(random(0, 255)); //degree of randomness introduced to stroke
    fill(0, 0, 255, 50); //overlaying transparencies builds up pattern
    //linked ellipses
    ellipse(0, 0, 30, 40); 
    ellipse(0, 20, 30, 40);
  }
  popMatrix();
}

