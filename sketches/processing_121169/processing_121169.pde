
float counter = 0;
 
void setup()
{
  size(400, 400);
}
 
void draw()
{
  float t = map(sin(counter), 1, -3, 0, 270);
  float x = map(-sin(counter), 1, -1, 0, 120);
  background(0, x, t);
  
  
  translate(width/8, height/2);
  pushMatrix();
  translate(0, sin(counter)*-150);
  float h = map(sin(counter), -1, 1, 0, 360);
  fill(255, 255, h);
  ellipse(0, 0, 40, 40);
  popMatrix();
  
  translate(75,0);
 
  pushMatrix();
  translate(0, sin(counter)*125);
  float b = map(sin(counter), -1, 1, 60, 300);
  fill(255, 255, b);
  ellipse(0, 0, 40, 40);
  popMatrix();
  
  translate(75,0);
 
  pushMatrix();
  translate(0, sin(counter)*-100);
  float v = map(sin(counter), -1, 1, 120, 240);
  fill(255, 255, v);
  ellipse(0, 0, 40, 40);
  popMatrix();
  
  translate(75,0);
 
  pushMatrix();
  translate(0, sin(counter)*125);
  fill(255, 255, b);
  ellipse(0, 0, 40, 40);
  popMatrix();
  
  translate(75,0);
 
  pushMatrix();
  translate(0, sin(counter)*-150);
  fill(255, 255, h);
  ellipse(0, 0, 40, 40);
  popMatrix();
 
 
  counter += 0.025;
}

