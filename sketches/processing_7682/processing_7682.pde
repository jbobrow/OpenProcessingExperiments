
// add hours, blending, mickey mouse hand?


float DegreesPerMillisecond = 360.0/1000.0;
float DegreesPerTick = 360.0/60.0;


void setup()
{
  size(512,512);
}

void draw()
{
  background(100);
  // time!
  float millisRotation = radians( (millis() % 1000) * DegreesPerMillisecond);
  float secondsRotation = radians( second() * DegreesPerTick);
  float minutesRotation = radians( minute() * DegreesPerTick);
  
  smooth();
  // draw clock body
  fill(255);
  ellipse(width/2, height/2, width, height);
  
  fill(18, 255.0*(millis()%1000)/1000.0 , 270);
  arc(width/2, height/2, width, height, 
    secondsRotation-PI/2.0, secondsRotation-PI/2.0+millisRotation);


  strokeWeight(2);
  // draw second hand
  pushMatrix();
  // move drawing center to the center of the screen and rotate clockwise
  translate(width/2, height/2);
  rotate(secondsRotation);
  translate(-width/2, -height/2);
  // draw clock hand
  line(width/2, height/2, width/2, 0);
  popMatrix();

  
  // draw second hand
  strokeWeight(4);
  pushMatrix();
  translate(width/2, height/2);
  rotate(minutesRotation);
  translate(-width/2, -height/2);
  line(width/2, height/2, width/2, 0);
  popMatrix();
}

