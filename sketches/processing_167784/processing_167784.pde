
float x, y;
float angle = 0; 
float r = 400;
float fd = 3; 


void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.6); 
  stroke(y, x, 255, 20);

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);


  angle = angle*2;
  r = r - fd;

  if ( r == 0 || r == 400) { 
    r = r-fd;
    fd =  fd * -2;
  }
}
