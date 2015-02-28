
/**
Random Coloured Square Painting (STUDY)
28/08/2013
 */
 
float x, y;
//float dim = 80.0;
float q  = 0.0;
float w  = 0.0;
float e  = 0.0;
float square;

void setup() {
  frameRate(2);
  size(420, 594);
  noStroke();
  background(102);
}

void draw() {
  //square = 10;
  square = random(10,420);
  x = random(0-square, width);
  y = random(0-square, height);
  q = random(0.0,255.0); 
  w = random(0.0,255.0);
  e = random(0.0,255.0);
  fill(q,w,e, 220);
  point(x,y);
  rect(x,y,square,square);
  if (mousePressed){
    //background(102);
    saveFrame("RandomColourSquare8.jpg");
  }
}


