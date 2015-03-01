
float x, y;
float angle = 0; 
float r = 200;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  noFill(); 


  x = r * cos(angle/2); 
  y = r * sin(angle/2);

  strokeWeight(2); 
  stroke(39,245,255); 

  translate(width/2, height/2); 
  rotate(r); 

  line(0, 0, x/3, y/3);

  stroke(39,255,126);
  strokeWeight(1);
  line(0, 0, x/4, y/4);

  stroke(255);
  strokeWeight(0.5);
  ellipse(x/2, y/2, 50, 50);

  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}



