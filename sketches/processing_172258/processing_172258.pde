
float counter = 0;

void setup()
{
  size(500,500);
  background(255);
  colorMode(HSB, 360,100,100);
  smooth();
}

void draw()
{
  noStroke();
  
  float counter_mouse = map(mouseX, 0, width, 0.01, 0.2);
  float amplitude = map(sin(counter), -1, 1, 0, 100);
  
  background(320,47,mouseX);
  translate(width/2,height/2);
  fill(329,amplitude,100);
  ellipse(-31,0,98,98);
  ellipse(+31,0,98,98);
  triangle(-62,+38,+62,+38,0,100);
  
  counter += counter_mouse; 
  
  
}
