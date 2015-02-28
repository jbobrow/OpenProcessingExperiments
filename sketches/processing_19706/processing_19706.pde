
void setup(){
  size(250, 250);
  background(255);
  smooth();
}

void draw(){
  // line
  for(int x = 0; x < 50; x += 4)
  {
  fill(255);
  stroke(random(255), random(255), random(255), random(255));
  bezier(125, 125, 100, x, x, 100, 125, 125);
  
  bezier(125, 125, 150, x, 250-x, 100, 125, 125);
  
  bezier(125, 125, x, 150, 100, 250-x, 125, 125);
  
  bezier(125, 125, 250-x, 150, 150, 250-x, 125, 125);
  }
  
  for(int x = 0; x < 200; x += 3)
  {
  noFill();
  stroke(255);
  ellipse(125, 125, x, x);
  }
}

