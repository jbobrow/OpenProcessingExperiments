
float x=0;
float y=0;
float xInc=0;
float yInc=0;
float a = 0;

void setup() {
  smooth();
  size(800, 800);
  noStroke();
  x=width/2;
  y=height/2;

  background(0);
  ;
}


void draw() {
  //this will re-freash the screen
  background(255);

  //this will make the elipses fill a diffrent colour to the bg
  fill(0, 100, 0);
  stroke(0);
  
  //draw the ellipse
  ellipse(x, y, 4, 4);
  
  //this is a line in the direction the ellipse is moving
  line(x, y, x+cos(radians(a))*40, y+sin(radians(a))*40);


  stroke(100);
  // this is a line at angle 0 
  line(x, y, x+cos(radians(0))*40, y+sin(radians(0))*40);


  // this is where we incriment the x and the y values in the direction of angle a
  // the numbers on the end are to chacge the shape & size of the orbit
  // if the scalers are equal the orbit will be circular if they are different it will be ellipticle
  x+=cos(radians(a))*0.8;
  y+=sin(radians(a))*1.;
  a++;
  fill(255);
  ellipse(x, y, 4, 4);
}


