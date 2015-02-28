
float diameter; 
float angle = 0;

void setup() {
  size(800, 800);
  diameter = height - 10;
  stroke(225);
}

void draw() {
  
  float d1 = 5+ (sin(angle) * diameter/2) + diameter/4;
  float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/6;
  float d3 = 10 + (sin(angle + PI) * diameter/2) + diameter/8;
  float d4 = 10 + (sin(angle + PI) * diameter/2) + diameter/10;
  
  
  fill(150, 50, 90,120);
  ellipse(0, height/4, d1, d1);
  fill(200, 50, 90,120);
  ellipse(width/2, height/2, d2, d2);
  fill(180, 50, 90,120);
  ellipse(width, height/2, d3, d3);
  
  fill(150, 50, 90,120);
  ellipse(width/2, height/4, d3, d3);
  fill(200, 50, 90,120);
  ellipse(width, height/5, d1, d1);
  fill(180, 50, 90,120);
  ellipse(0, height*0.8, d4, d4);
  fill(150, 50, 90,120);
  ellipse(width, height, d1, d1);
  ellipse(width/2, height, d4, d4);
  
  
  angle += 0.02;
}
