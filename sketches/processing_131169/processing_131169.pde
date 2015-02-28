
int counter;
int ballR;      // ball radius

void setup() {

  size( 300, 300 );
  
  counter = 0;
  ballR = 20;
  
  noStroke();
  
}

void draw() {

  background(255);

  // draw orange ball
  fill( 255, 128, 64 );
  float angle = counter * 0.05;                      
  ellipse( width/2, 120*sin(angle)+height/2, ballR, ballR );
  
  text( "sine sample\n\n" + "sin " + int(degrees(angle))%360 +" degrees\n\n" + "counter: " + counter, 20, 20 );
  
  counter++;
  
}
