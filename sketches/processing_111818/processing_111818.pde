
float x, y;
float angle = 0; 
float r = 50;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255, 255, 255);
}

void draw() {

  fill(random(100, 255), random(100, 255), random(100, 255), 50); 


  x = r * cos(angle); 
  y = r * sin(angle);


  strokeWeight(0.1); 
  stroke(random(50, 255)); 

  translate(width/2, height/2); 
  rotate(r); 

  rect(x, y, 10, 10);
  rect(x + 10, y + 10, 15, 15);
  rect(x - 15, y - 15, 15, 15);
  rect(x*2, y*2, 10, 10);

  ellipse(x/2-10, y/2-10, 200, 200);


  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}
