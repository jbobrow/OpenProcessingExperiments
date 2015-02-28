

float diameter; 
float angle = 0;

void setup() {
  size(950, 950);
  diameter = height - 20;
  noStroke();
  noStroke();
  fill(25, 204, 10);
}

void draw() {
  
  background(0);

  float d1 = 10 + (sin(angle) * diameter/30) + diameter/2;
  float d2 = 10 + (sin(angle + PI/21) * diameter/2) + diameter/2;
  float d3 = 10 + (sin(angle + PI) * diameter/5) + diameter/2;
  
  ellipse(0, height/12, d1, d1);
  ellipse(0, height/2, d1, d1);
  ellipse(0, height/1.1, d1, d1);
  ellipse(width/2, height/2, d2, d2);
  ellipse(width, height/2, d3, d3);
  
  angle += 2.02;
}



