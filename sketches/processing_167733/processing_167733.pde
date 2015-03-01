


float x, y;
float angle = 0; 
float r = 400;
float diff = 2; 


void setup() {
  size(600, 600);
  background(0);
}

void draw() {

  noFill(); 

  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(24, 103, 200); 
  line(width/2, height/2, width/2 + x, height/2 +y);


  translate(width/2, height/2); 
  rotate(angle); 
  ellipse(0, 0, x, y);
  
  angle = angle +1;
  r++;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}


