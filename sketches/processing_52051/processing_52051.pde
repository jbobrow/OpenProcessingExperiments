

float x;
float direction;

void setup() {
  size(400,400);
  smooth();
  x = 200;
}

void draw() {
  background(0);
  
  if ( mousePressed ) {
    direction = 1;
  } else {
    direction = -1;
  }
  
  
  x = x + direction;
  x = constrain( x , 10, width -10);

  
  ellipse(x,200,20,20);
 
  
  
}
  
  
