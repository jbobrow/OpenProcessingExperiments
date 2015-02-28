
float x, y;
float angle = 0;
float r = 100;
float diff = 1;

color col = color(255, 3, 41);

void setup() {
  size(600, 600);
  background(235);
}


void draw() {
  x = r * cos(angle)*1.0;
  y = r * sin(angle)*1.0;

  translate(width/2, height/2);
  rotate(r);

  noStroke();
  fill(0, 255, 135, 10);
  strokeWeight(0.1);
  rect(x/2, y/2, x*2, y*2);

  noStroke();
  fill(255, 0, 135, 5);
  strokeWeight(0.1);
  rect(x, y, x*2, x*2);

  noFill();
  stroke(#03F9FF, 10);
  strokeWeight(0.1);
  line(0, 0, y, y);
  fill(#03F9FF, 10);
  ellipse(y, y, y/5, y/5);

  noFill();
  stroke(col, 10);
  strokeWeight(0.1);
  line(0, 0, x, x);
  fill(col, 10);
  ellipse(x, x, x/5, x/5);

  angle = angle + 0.5;
  r = r - diff;

  if ( r == 0 || r == 100) { 
    diff =  diff * -1;
  }
}



