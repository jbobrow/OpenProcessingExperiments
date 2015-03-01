
float counter_1 = 0;

void setup() 
{
 size (500,500);
 background(250);
}

void draw()
{
  colorMode(HSB, 360, 100, 100);
  float amplitude_1 = map(sin(counter_1), -1, 1, 220, 255); 
  translate(mouseX,mouseY);
  fill(amplitude_1, 35, 100);
  noStroke();
  rect(sin(counter_1), sin(counter_1)*1000, 20, 20); 
 
  counter_1 += 0.5;  
}

