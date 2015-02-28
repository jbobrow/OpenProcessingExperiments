
boolean increasing = true;
int numCircles = 0;

void setup() {  //setup function called initially, only once
  size(350, 350);
  background(255);  //set background white
  // colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
}

void draw() {  //draw function loops 
  int circleSize = 300;
  int circleDiff = increasing ? circleSize / numCircles++ : circleSize / numCircles--;
  if ( numCircles >= circleSize / 1.5 ) {
      increasing = false;
  } else if ( numCircles <= 0 ) {
      increasing = true;
  }
  for ( int i=0, circlesToDraw = circleSize/circleDiff; i<circlesToDraw; i++ ) {
      stroke( i % 255, 127 - (i % 128), 0 );
      ellipse( circleSize / 2 + 10, circleSize / 2 + 10,
               circleSize - i * circleDiff, circleSize - i * circleDiff );
  }
}
