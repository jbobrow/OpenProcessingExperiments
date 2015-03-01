
float counter = 0;

void setup() 
{
 size (300,750);
 background(255);
}

void draw()
{
  background(255); 
  float amplitude = map(sin(counter), -1, 1, 60, 255);
  noStroke();
  fill(amplitude);
  println(sin(counter) );
  counter += 0.007;  
  
  background(255); 
  translate(width/2, height/2);
  ellipse(0, sin(counter) *mouseX, 80, 80); 
  println(sin(counter) );
  counter += 0.03;  
}

