
// Frequency 

float x, y;
float x2;
float dim = 80.0;
float r = 1;

PFont poopfont;

void setup() {
  size(800, 360);
  noStroke();
}

void draw() {

  background(193,192,191);
  
  // type instruction 
  
  smooth();
  fill(240,76,0);
  poopfont = loadFont("Helvetica.vlw");
  textFont(poopfont, 20);
  textAlign(LEFT);
  text("Click repeatedly.", 50, 50);
  
  
  x = x + 0.8;

  if (x > width + dim) {
    x = -dim;
  } 


  // horizontal tranform // note: these accumulate 

  translate(x, height/2-dim/2);
  fill(240,76,0);
  rect(-dim/2, -dim/2, dim, dim); 


  translate(x2+r, height/2-dim/2);
  fill(240,76,0);
  rect(-dim/2, -dim/2, dim, dim);

  // when pressed speeds up second square

  if (mousePressed) {
    r*=1.1 ;
  }
}



