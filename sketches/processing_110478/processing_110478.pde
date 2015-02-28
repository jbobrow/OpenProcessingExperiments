
//supernova
float x, y;
float angle = 0; 
float a = 600;
float b = 5; 

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  fill(0,0); 
  
  x = a * cos(angle); 
  y = a * sin(angle);
  
  strokeWeight(0.5); 
  stroke(random(255),random(255),random(255),30); 

  translate(width/2, height/2); 
  rotate(a); 
  
  ellipse(0, 0, x, y);

  angle = angle +5;
  a = a - b;

  if ( a == 0 || a == 600) { 
    b =  b * -0.5;
  }
}


