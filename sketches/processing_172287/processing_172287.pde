
float counter = 0;

void setup() 
{
  size(500, 500);
  background(0);
}

void draw()
{
  background(0, 0, 0);

  colorMode(HSB, 360, 100, 100);
  float amplitude = map(sin(counter),-1,1,-100,100);

  translate(width/2, height/2);
  fill(100, 150, amplitude);
  ellipse(amplitude,0, 500, 500);

  println(sin(counter));
  counter += 0.009;
}


