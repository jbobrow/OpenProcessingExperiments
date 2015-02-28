
float rectOscCounter = 0;

void setup() {

  size(400, 400);
  smooth();
  frameRate(30);
}

void draw() {

  background(0);


  // ELLIPSE 
 
  float ellipseOscCounter = 0.11 * frameCount;
  float ellipseOscCenter = width/2;
  float ellipseOscRadius = width/2;

  float ellipseX = cos( ellipseOscCounter  ) * ellipseOscRadius + ellipseOscCenter;

  ellipse(ellipseX, height*0.333, 50, 50);

   // RECT 
 
  rectOscCounter = rectOscCounter + 0.1;
  float rectOscCenter = HALF_PI;
  float rectOscRadius = QUARTER_PI;

  float rectRadians = cos( rectOscCounter  ) * rectOscRadius + rectOscCenter;
  
  translate( width*0.5 , height*0.666);
  rotate(rectRadians);
  translate( 0 , -12.5 );
  rect(0, 0, 100, 25);
  
}
