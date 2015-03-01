

float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 


void setup() {
  size(600, 600);
  background(235);
}

void draw() {

  fill(255, 204, 204);

  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(235); 

  translate(width/1, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);

  angle = angle +0.7;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}

