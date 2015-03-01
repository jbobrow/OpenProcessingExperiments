
// Monash Creative Coding Course, week 2, 'Vera Molnar' exercise
// version: Jerome Herr

int edge, col, num=5; // declaring the variables for the edge round the image, the color and the number of columns
float unit, sz; // unit = the width of a column, sz = size of the square
long rs = 100; // the variable for the randomSeed (that I want to change by mouseClick 
boolean shapeRect = true; // used to switch between rectangle and ellipse

void setup() {
  size(600, 600);
  noStroke();
  rectMode(CENTER);
  colorMode(HSB,255,100,100); // I'm using HSB since it's easier to get nice colors on the fly
  edge = width/14; //the empty space around the 5x5 squares
  unit = (width-2*edge)/num; //the width of a column
  col = 0; // the color to start with should be red (on the HSB scale)
}

void draw() {
  randomSeed(rs);
  background(#eeeeee);
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      float r = random(1);  // a random number between 0 and 0.9999 in order to differentiate between darker and lighter squares
      if (r>0.85) {  // if r is greater than 0.85 then the square will be darker
        fill(col,100,90, 240);
      } else { //otherwiese it will be lighter
        fill(col, 80,80,200);
      }
      float varX = random(-10, 10);  // variables to make the squares look 'shaky'
      float varY = random(-10, 10);  // variables to make the squares look 'shaky'
      if (shapeRect) {
      rect(edge+(i+.5)*unit+varX, edge+(j+.5)*unit+varY, unit, unit);
      } else {
      ellipse(edge+(i+.5)*unit+varX, edge+(j+.5)*unit+varY, unit, unit);            
      }
    }
  }
}

void mouseClicked() {
  rs = hour()+minute()+second()+millis(); // = generate a new randomSeed > different look of the image
  col = (int) random(255); // = generate a new color 
}

void keyPressed() {
  shapeRect =! shapeRect; // flip the value; ellipse will become rectangle / rectangle will become ellipse
}
