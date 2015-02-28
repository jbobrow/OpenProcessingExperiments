
float counter=0;

void setup()
{
  size(400,400);
  noStroke();
  colorMode(HSB, 360, 100, 100);
}
void draw()
{
  float h = map(sin(counter), -1, 1, 0, 35);
  background(h, 100, 60);
  counter += 0.001;
  
  translate(width/2, height/2);
  
  pushMatrix();
  translate(cos(counter+45)*-40, sin(counter)*100);
  ellipse(0, 0, 40, 40);
  fill (0);
  popMatrix();
  
  pushMatrix();
  translate(cos(counter-45)*-80, sin(counter)*100);
  ellipse(0, 0, 40, 40);
  popMatrix();
  
  counter +=0.3;
}
