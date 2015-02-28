
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
  
  strokeWeight(0.2);
  noFill();
  
  radius = 10;
  thickness = 0.5;
  x = 2;
  y = height/2;
  z = height/2;
  t = height/2;
  amp = random(5);
  angle = 0;
}

void draw()
{
  if(x<width){
  colorMode(HSB, width, 100, 100, 100);
  stroke(random(width), 100, 100, random(width));
  ellipse(x, height/2+y+t, random(radius), random(radius*1.25));

  colorMode(RGB, width, 100, 100, 100);  
  stroke(width - x, 0, width - x, 100);
  ellipse(x, height/2+z-random(t), random(radius), random(radius*0.75));
    
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
  background(random(255), random(255), random(255));
  draw();
 
}
  

