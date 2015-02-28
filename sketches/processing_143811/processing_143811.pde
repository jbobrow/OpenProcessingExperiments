
//Diego Rodriguez_Midterm assigment
//genesis of spaces born out of a spiral motion
//based on tutorials for spirals and addina a continous or organic growth for 
//pattern that is born implying on the polycentric qualities of a circle and how
//it can be used to organize "squares" or "patches of information to it". 

float x, y, d;
float radiusCircle = 150;
float frameSpeed = 10;//control speed of drawing
float noiseY;


void setup() {
  size(800, 800);
  background(255);
  smooth();
  frameRate(frameSpeed);
}
void draw() {
  color[] whiteRainbow = {
    #00FF00, #33FF00, #66FF00, #99FF00, #CCFF00, #FFFF00
  };//from light to dark color
  color white = color(245, 10);
  color lightRed = color(#FF3300, 10);
  float amt = map( mouseX, 0, width, 0, 1 );
  color c = lerpColor( white, lightRed, amt );
  translate(width/2, height/2);
  ellipseMode(RADIUS);
  rectMode(CENTER);
  stroke(255);//add int to random to include 5. for index numbers needs []
  fill(c, 40);
  ellipse(0, 0, radiusCircle, radiusCircle);//origin and radius


  float radiusSpiral =10+frameSpeed;
  float px = -999;
  float py = -999;
  strokeWeight(.8);
  for (float angle = 0; angle < 4*TAU; angle += 0.6)//eight cycles around, increment of 0.6
  {
    radiusSpiral += 1;
    x = cos(angle) * radiusSpiral;
    y = sin(angle) * radiusSpiral;
    d = width/2;
    //drawing line "path" connecting spaces
    if (px > -999) {
      stroke(whiteRainbow[int(random(1, 6))]);//add exponential variance to colors of ranibow + white + black
      line (x, y, px, py);
      ellipse(x*2.2, y*1.8, angle, angle);
      arc(x, y, d-60, d-120, 0, TAU);//position of arches around 
      point(x, y);
      rect(x*2.2, y*1.8, angle, angle);//x,y position of "spaces" revolving around angle of elllipse
    }
    px = x;
    py = y;
  }
  if (mousePressed == true) {
    frameSpeed += 10;
  } 
  else {
    frameSpeed +=random(-1, 1.5);//close frame rate to keep continious and balanced motion
  }
  if (keyPressed == true) {
    frameSpeed += -10;
  }
}



