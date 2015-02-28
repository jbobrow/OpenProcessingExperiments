
float x, y, t, z;
float amp, angle;
float thickness;
float radius;

void setup()
{
  frameRate(100);
  size(700, 500);
  background(255);
  smooth();
  
  strokeWeight(random(0.9));
  noFill();
  
  radius = random(8);
  thickness = random(0.4);
  x = random(2);
  y = random(height/2);
  z = random(height/2);
  t = random(height/2);
  amp = random(5);
  angle = 0;
  
  //colorMode(RGB, width, 100, 100, 100);  
}

void draw()
{
  if(x<width){
  stroke(random(width), random(100), random(100), random(width));
  ellipse(random(x), random(height/random(2)+random(y)+random(t)), random(radius), random(radius*1.25));

  stroke(random(random(width) - random(x)), 0, random(width) - random(x), random(100));
  ellipse(random(x), random(height/2+random(z)-random(t)), random(radius), random(radius*0.75));
    
  y = random(sin(random(radians(random(angle))))) * random(amp);
  z = random(cos(random(radians(random(angle))))) * random(amp);
  t = random(sin(random(radians(random(angle))))) * random(10);
  x++;
  angle += random(5);
  radius +=random(thickness);
  if( x == width/2) thickness*=-1;
  }
}

void mousePressed()
{
  setup();
  
  draw();
}
  



