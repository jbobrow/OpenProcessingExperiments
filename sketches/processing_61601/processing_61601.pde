
float theta = 0.0;

void setup() {
  size(400,400);
  smooth();
}


void draw() {
  background(255);
  
  float x = (sin(theta) + 1) * width/2; 
  
  theta += 0.05;
  
  fill(0);
  stroke(0);
  line(width/2,0,x,height/2);
  text("depth",x,height/2,56,16);
}

