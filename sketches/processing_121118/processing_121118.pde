
float counter = 0;

void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  background(0, 0, 0);
  float b = map(sin(counter), -1, 1, 0, 80);
  
  //float winkel = map(700, 0, 5000, 0, 2*PI);
  
  //noStroke();
  //fill(227, 100, b);
  //rotate(winkel);
  //rect(100, 0, 50, 200);
  
  fill(0, 100, b);
  noStroke();
  ellipse(120, 147, 170, 218);
  ellipse(280, 147, 170, 218);
  
  translate(200, 110);
  rotate(0.8);
  rect(0, 0, 180, 180);
  
  counter += 0.3;
}
