
float x ;
float y;
float width ;
float height;

float randomStrokeWeight;
float randomStroke;

void setup () {
  size (500, 500);
  background (0, 0, 0);
  colorMode (RGB, 255, 255, 255, 100);
  smooth();
}

void draw () {


  x = random(200);
  y = random(500);
  width = random(10);
  height = random (10);

  width = width + 250;

  randomStrokeWeight = random(200); 
  strokeWeight(randomStrokeWeight); 

  randomStroke = random(255);
  stroke(randomStroke);



  noFill();
  ellipse (width, width, height, height);
}


