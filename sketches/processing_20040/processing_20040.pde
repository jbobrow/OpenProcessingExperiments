
/**
 * Parameterize: Wave
 * from Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * Princeton Architectural Press, 2010
 * ISBN 9781568989372
 * 
 * This code was written for Processing 1.2+
 * Get Processing at http://www.processing.org/download
 */

int brickWidth = 40;
int brickHeight = 15;
int cols = 20;
int rows = 24;
int columnOffset = 60;
int rowOffset = 30;
float rotationIncrement = 0.15;
PVector velocity;
PVector location;

void setup() {
  size(1200, 768);
 noCursor();
  background(255);
  smooth();
  noFill();
  stroke(0);
  // noLoop();

  location = new PVector(mouseX, mouseY);
}

void draw() {
 // filter(INVERT);
  background(0);
  //filter(INVERT);

  velocity = new PVector(mouseX - pmouseX, mouseY - pmouseY);
  location.add(velocity);
  translate(30, 30);
  for (int i=0; i<cols; i++) {
    pushMatrix();
    translate(i * columnOffset, 0);
    float r = random(-QUARTER_PI, QUARTER_PI);
    int dir = 1;
    for (int j=0; j<rows; j++) {
      pushMatrix();
      translate(0, rowOffset * j);
      //rotate(r);
      // check if mouse is movingj[
      print("," +i+ "," + mouseX);
      float m = map(mouseX, 0, 1200, 0, 20);
      float n = map(mouseY, 0, 768, 0, 24);
      color from = color(204, 102, 0);
      color to = color(0, 102, 153);
      if(abs(m-i) < 2 && abs(n-j) < 2)
      {
        //if (mouseX == pmouseX && mouseY == pmouseY) {
        // rotate(r);
        //}
        //else {

       // color interA = lerpColor(from, to, .33);
       float rate = map(abs(m-i), 0,2,0,1);
        color interB = lerpColor(from, to, rate);
        rotate(abs(m-i)*velocity.heading2D());
         fill(interB);
        


        //}
      }
      else{
       //color interA = lerpColor(to, from, .33);
        color interB = lerpColor(to, from, .66);
       fill(to);
       
      }

//directionalLight(204, 204, 204, .5, 0, -1);
//emissive(0, 26, 51);

     rect(-brickWidth/2, -brickHeight/2, brickWidth, brickHeight);
    // noStroke();
//lights();
//translate(58, 48, 0);
//sphere(28); 
//box(20);
      
      popMatrix();

      r += dir * rotationIncrement;
      if (r > QUARTER_PI || r < -QUARTER_PI) dir *= -1;
    }
    popMatrix();
  }
}



