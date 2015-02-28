
// wrong way of drawing a bunch of circles
// (it could be worse, at least we're using a variable!) 
int d = 60;

void setup() {
  size(600, 100);
  smooth();
}

void draw() {
  background(128);
  ellipse(  0, height/2, d, d ); 
  ellipse(  d, height/2, d, d ); 
  ellipse(2*d, height/2, d, d ); 
  ellipse(3*d, height/2, d, d ); 
  ellipse(4*d, height/2, d, d ); 
  ellipse(5*d, height/2, d, d ); 
  ellipse(6*d, height/2, d, d ); 
  ellipse(7*d, height/2, d, d ); 
  ellipse(8*d, height/2, d, d ); 
  ellipse(9*d, height/2, d, d ); 
  ellipse(10*d, height/2, d, d );
}

