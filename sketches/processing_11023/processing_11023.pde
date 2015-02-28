

float randSize;
float showUpCounter = 0;

//A Polar coordinate
float r = 0;
float theta = 0;

void setup() {
  
  size(400,400/*,OPENGL*/);
  background(30);
  smooth();
  randSize = 15;
  frameRate(60);
}

void draw() {
  
  //Polar to Cartesian conversion
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  randSize = random(20,30);
    
  fill(random(255),random(255),random(255),random(255)*0.1);
  noStroke();
  ellipse(x+width/2,y+height/2,randSize,randSize);
  
  //Increment the angle
  theta += 0.01;
  r += 0.045;
}


