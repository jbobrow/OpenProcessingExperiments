
float angle = 0.0;
float speed = 0.1;

void setup(){
  size(500,500);
  noStroke();
  smooth();
}

void draw() {
  background(0);
  angle = angle +speed;
  //ellipse(100 + (sin(angle+PI) * 5), 125, 130, 130);
  //ellipse(100 + (sin(angle + HALF_PI) * 5), 155, 130,130);
  //ellipse(100 + (sin(angle + QUARTER_PI) * 5), 185, 130, 130);
  circlePhase(0.0);
  circlePhase(QUARTER_PI);
  circlePhase(HALF_PI);
  angle += speed;
}

void circlePhase(float phase) {
  float diameter = 65 + (sin(angle +phase) * 45);
  fill(250, 170, 100, 90);
  ellipse(50,50,diameter,diameter);
  ellipse(100, 10, diameter,diameter);
  ellipse(200,200,diameter,diameter);
  ellipse(50, 100, diameter,diameter);
  ellipse(100,200,diameter,diameter);
  ellipse(200, 300, diameter,diameter);
  
  fill(250, 270, 100, 90);
  ellipse(300,50,diameter,diameter);
  ellipse(400, 10, diameter,diameter);
  ellipse(500,200,diameter,diameter);
  ellipse(50, 300, diameter,diameter);
  ellipse(100,400,diameter,diameter);
  ellipse(200, 500, diameter,diameter);


  
}



