
//This sketch makes use of a function to draw/abstract  
//a circle and the for() loops repeat it to create a composition

void setup() {
  size(400, 400);
  background(30);
  smooth();
  noFill();
}

void draw() {                                  //first set of nested for() loops set up 
  for (int f = 0; f < width+50; f +=40) {      //first layer of circles.
    for (int l = 0; l < width+50; l +=40) {
      circle(f, l);
    }
  }                                            //the first layer didnt seem to be enough, so
  for (int r = 0; r < width+50; r +=60) {      //this set of for() loops adds a second layer
    for (int t = 0; t < width+50; t +=60) {    //which adds a nice depth to the composition
      circle(r, t);
    }
  }
  noLoop();
}


void circle(float x, float y) {
  pushMatrix();
  translate(0, 0);
  strokeWeight(random(5));
  stroke(255,0,0,random(30,80));
  ellipse(x, y, random(20, 60), random(20, 60));
  popMatrix();
}


