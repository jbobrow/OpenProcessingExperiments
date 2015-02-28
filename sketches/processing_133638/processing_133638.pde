
float r = 125;
float theta = 0;
float beta = 0;


void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {
  float x = r * cos(theta/2); //polar to cartesian conversion
  float y = r * sin(theta/3);

  noStroke();
  fill(200+theta, 255, 50+theta, 5);
  ellipse(x+width/2, y+height/2, 5+beta, 5+beta);

  theta += 0.01; //increment angle
  beta += 0.01;
  
}



