

float x, y;
float angle = 0; 
float r = 400;
float d = 1; 


void setup() {
  size(600, 600);
  background(0);
}

void draw() {

  noFill(); 
  x = r * cos(angle); 
  y = r * sin(angle);


  translate(width/2, height/2); 
  rotate(r); 
  
  
  strokeWeight(1); 
  stroke(255,80,0, 30); 
  ellipse(0, 0, x, y);
  strokeWeight(1); 
  stroke(252, 116, 0, 70); 
  rect(0, 0, 0, 90);
  strokeWeight(0.2); 
  stroke(147,0, 0); 
  ellipse(0, 0, x, y);

  angle = angle +5;
  r = r - d;

  if ( r == 0 || r == 200) { 
    d =  d * -1;
  }
}





