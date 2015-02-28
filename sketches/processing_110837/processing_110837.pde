

float x, y;
float angle = 0.1; 
float r = 400;
float diff = 1; 

color col = color(216,12,129,10);

void setup() {
  size(600, 600);
  background(0,183,139);
}

void draw() {

  fill(col); 
  
  
  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.1); 
  stroke(0); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
  ellipse(x, 0, x+10, y);

  angle = angle +0.1;
  r = r - diff;

  if ( r == 0 || r == 10) { 
    diff =  diff * -1;
  }
}





