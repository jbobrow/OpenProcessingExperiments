


float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 
float a, b;

void setup() {
  size(600, 600);
  background(0);

}

void draw() {

  noFill(); 

  a = 500*cos(angle);
  b = 500*tan(angle);
  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.1); 
  stroke(120,0, 0); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, a, b);
 // ellipse(x, 0, x, 50);
  line( 0, 0, x, y); 

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}


