

float x, y;
float angle = 0; 
float r = 200;
float diff = 1; 

color col = color(255,0,0);

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  noFill(); 
  
  
  x = angle * cos(angle); 
  y = r * sin(r);


  strokeWeight(0.01); 
  stroke(0,10); 

  translate(width/2, height/2); 
  rotate(angle/r); 

  ellipse(0, 0, x/5, y*3);
  
  
  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 300) { 
    diff =  diff * -1;
  }
}

