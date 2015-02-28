
float y = 50;
float spead = 6;
float g=0.1;


void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(255);
  y = y + spead;
  spead= spead + g;
  
  if ((y > height) || (y <0)) 
  {
    spead= spead * -0.6;
  }
  
  stroke(0);
  fill(175);
  ellipse(250,y,32,32);
  }
