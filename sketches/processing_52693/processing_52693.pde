
// This is expanded variable for wave on 'sunflower' one

float angle = 0.01;
float aVelocity = 0.005;
float aAcceleration = 0.001;

float startTheta = 0;
float thetaVel = 0.1;
float amplitude = 0.01;

void setup() {
  size(600,600);
  background(255);
  smooth();
}

void draw() {
  
  startTheta += 0.2;
  float theta = startTheta;
   
  rectMode(CORNER);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  float amplitude = 0.01;
  float x = amplitude * cos(angle);
  float y = amplitude * sin(angle);
  
  angle += aVelocity;
  aVelocity += aAcceleration;
  
  for (int i = 0; i <= width; i +=2) {
  float a = map(sin(theta),-1,1,0,height);
  fill(175);
  stroke(0);
  rectMode(CORNER);
  translate(width/2,height/2);
  rotate(angle);
  stroke(100,100,255);
  fill(255,155,0);
  ellipse(150,0,180,18);
  ellipse(-150,0,180,18); 
  stroke(255,0,0);
  fill(255,255,0);
  ellipse(50,0,80,18);
  ellipse(-50,0,80,18);
  
  theta += thetaVel;
 }
}


