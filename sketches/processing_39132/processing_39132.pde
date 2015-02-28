
//Gina DeMatteo
//Functions
//Homework: September 24,2011


void setup() {
  size(400, 400);
  noFill();
  background(0, 0, 0);
  smooth();
  colorMode(HSB, 200); //creates uniformity between the colors of the rectangles
}

//'FOR' Codes below establish the grid that maintains the control throughout the composition
//Spacing between the rectangles is adjusted when the numbers in the for statement is altered
void draw() {

  for (int a=0; a<width; a+=110) {

    for (int b=0; b<width; b+=110) {

      rectangles(a, b);
    }
  }

  for (int c=5; c<width; c+=55) {

    for (int d=5; d<width; d+=55) {

      rectangles(c, d);
    }
  }

  noLoop();
}

//Establishing the rectangles 
//Push & pop matrix write the repitition of the figures
//Colors are defined within this function
void rectangles(float c, float d) {

  pushMatrix();

  translate(0, 0);

  strokeWeight(random(3));

  stroke(15, random(width), random(height), random(width));

  rect(c, d, 15, 30);

  popMatrix();
}



