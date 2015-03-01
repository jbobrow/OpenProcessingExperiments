
float diameter; 
float angle = 0;

void setup() {
  size(1280, 720);
  diameter = height - 10;
  noStroke();
  noStroke();
  fill(205, 7, 0);
}

void draw() {
  
  background(255);
  float d2 = 10 + (sin(angle + height/2) * width/2) + diameter/2;
  ellipse(mouseX, height/2, d2, d2);

  angle += 0.05;
}


