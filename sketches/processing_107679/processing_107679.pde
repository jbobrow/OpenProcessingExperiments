
/**
Random Coloured Square Painting (STUDY)
28/08/2013
 */
 
float x, y;
int q;
int w;
int e;
float square;

void setup() {
  frameRate(5);
  size(420, 594);
  noStroke();
  background(random(0,255));
}

void draw() {
  //square = 10;
  square = random(10,420);
  x = random(0-square, width);
  y = random(0-square, height);
  q = random(0,255); 
  w = random(0,255);
  e = random(0,255);
  //fill(q,w,e, 220);
  fill(q);
  point(x,y);
  rect(x,y,square,square);
  if (mousePressed){
    background(random(0,255));
    //saveFrame("RandomColourSquare8.jpg");
  }
}

