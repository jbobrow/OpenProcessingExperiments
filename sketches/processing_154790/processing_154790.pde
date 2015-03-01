
float theta = 0.1;
float r = 200;

void setup(){
  size(500, 1000);
  smooth();
  background(28, 145, 232, 50);
  frameRate(100);
  
}

void draw(){
   fill(80, 80, 80);
  triangle(250+r*cos(theta), 500+r*sin(theta), 260+r*cos(theta), 500+r*sin(theta), 255+r*cos(theta), 510+r*sin(theta));
  strokeWeight(10);
  stroke(215, 229, 240, 50);
  point(250+r*cos(theta), 500+r*sin(theta));
  theta += 0.01;
  r -= 0.1;
  
  
}


