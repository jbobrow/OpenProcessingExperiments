
int counter;
int ballR;    // ball radius

void setup() {  //setup function called initially, only once
  size( 512, 512 );
  counter = 0;
  ballR = 20;
}

void draw() {  //draw function loops 

  // erase background 
  fill( 255, 255, 255, 2);
  rect(0, 0, width, height);

  noStroke();

  // draw blue ball
  fill( 64, 128, 255 );
  float r = ( 200*sin(counter/200.0) );             
  ellipse( r*cos(counter/2.5)+width/2, r*sin(counter/2.5)+height/2, ballR, ballR );

  filter(BLUR, 3);

  counter++;
}
