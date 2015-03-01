
float x, y;
float angle = 10; 
float r = 222;
float diff = 2; 


void setup() {
  size(600, 600);
  background(203,0,0);
 
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(255, 50); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(10, x, 0, y);
  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 

  angle = angle +100;
  r = r - diff;

  if ( r == 0 || r == 500) { 
    diff =  diff * -1;
  }
}
