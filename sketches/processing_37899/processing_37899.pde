
float headX;
float headY;
float rad;


void setup()
{
  size(1000, 1000);
  background(0, 0, 0);
  smooth();
  noStroke();
  headX = 500;
  headY = 500;
  rad = 0;
}

void draw()
{
  float modifier1 = map(mouseX, 0, width, 1, 2);
  float modifier2 = map(mouseX, 0, width, 0.5, 1.5);
  float lineMod = map(mouseX, 0, width, 0, 500);
  
  float entropy = (mouseX * modifier2) * (noise(random(1.0, 2.0)) - noise(random(1.0, 2.0)));

  fill(255, 255, 255);
    
  headX = 500 + cos(rad) * mouseX/3 + entropy;
  headY = 500 + sin(rad) * mouseX/3 + entropy;
  rad = rad + PI/(64*modifier1) % (2 * PI);
    
  rect(headX, headY, 10, 10);
  stroke(255, 255, 255);
  line(headX, headY, random(width/2 - lineMod, width/2 + lineMod), random(width/2 -lineMod, width/2 + lineMod));
  
  fill(0, 0, 0, 10);
  rect(0, 0, 1000, 1000);
}
  
                
                                
