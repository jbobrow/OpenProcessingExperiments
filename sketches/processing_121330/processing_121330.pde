
float counter = 0;
 
void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
  float h = map(sin(counter), 1, -3, 150, 360);
  background(h, 100, 100);
 
  translate(width/2, height/2);
 
  pushMatrix();
  fill(0, 0, 100);
  noStroke();
  translate(70, sin(counter)*100);
  ellipse(0, 0, 50, 50);
  popMatrix();
  
  pushMatrix();
  fill(0, 0, 100);
  noStroke();
  translate(-70, sin(counter)*100);
  ellipse(0, 0, 50, 50);
  popMatrix();

 
  counter += 0.01;
}

