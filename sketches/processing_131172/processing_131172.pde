
int counter;
int ballR;      // ball radius

void setup() {
  size( 512, 512 );
  counter = 0;
  ballR = 20;
}

void draw() {

  // erase background 
  fill( 255, 255, 255, 8);
  rect( 0, 0, width, height);
  
  fill( 192, 192, 192 );
  textSize( 22 );
  text( "sine cosine sample", 20, 30 );

  // draw cross line
  stroke(224, 224, 224);  
  line(width/2, 0, width/2, height );
  line(0, height/2, width, height/2 );

  noStroke();

  // draw white ball
  stroke(192, 192, 192);
  fill(255, 255, 255); 
  ellipse( 2.5*(counter%200-100)+width/2, 200*cos(PI*counter/100) + height/2, ballR, ballR );        // ellipse(x, y, x_size, y_size)

  // draw orange ball
  noStroke();
  fill(255, 128, 64);                         
  ellipse( 2.5*(counter%200-100)+width/2, 200*sin(PI*counter/100) + height/2, ballR, ballR );
  
  counter++;
}
