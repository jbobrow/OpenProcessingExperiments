

float counter = 0;

void setup() 
{
 size (500,300);
 background(255);
}

void draw()
{
  if (mousePressed == true)
  {
  background(0);
  colorMode(HSB, 360, 100, 100);
  float amplitude = map(sin(counter)*50, -1, 1, 250, 255); 
  translate(mouseX,mouseY);
  fill(amplitude, 35, 100);
  noStroke();
  ellipse(sin(counter), sin (counter)*100, 50, 50);
  }
  else
  {
    background(255);
  }
 
  counter += 0.5;  
}

