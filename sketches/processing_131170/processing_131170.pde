
int counter;
int ballR;      // ball radius

void setup() {

  size( 300, 300 );      // window size
  
  counter = 0;
  ballR = 20;
  
  noStroke();
  
}

void draw() {

  background(255);

  // draw orange ball
  fill( 255, 128, 64 );         
  ellipse( width/2, 100*sin(counter*0.05)+height/2, ballR, ballR );
  
  counter++;
  
}
