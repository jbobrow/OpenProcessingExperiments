
int counter;
int ballR;      // ball radius

void setup() {

  size( 300, 300 );      // window size
  
  counter = 0;
  ballR = 50;
  
  noStroke();
  
}

void draw() {

  background(255);

  // draw orange ball
  fill( abs( 255*sin( counter*0.05 ) ) );                 // set ball color
  ellipse( width/2, height/2, ballR, ballR );
  
  counter++;
  
}
