
// I used some code from the examples section on the processing site
// In my project
float i = 0;

float x1, x2, y1, y2;

float angle1;
float glitch;
float diameter;

float angle2;
float angle3;

float hue = 0.0;
float offset = 10;

float counter = 0.0;

void setup()
{
  size (800, 400);
  colorMode(HSB);
  noStroke();
  diameter = 200;
  rectMode(CENTER);
  
}

void draw()
{
  background(51);
  
  //Random Color
  //fill (255, 255, hue);
  hue += offset;
  if (hue >= 255)
  {
    offset = -offset;
    hue = 255;
  }
  else if (hue < 0)
  {
    offset = -offset;
    hue = 0;
  }
  
  // Glitch
  if (second() % 2 == 0)
  {
    glitch = random(-0.1, 0.1);
    fill(hue, 255, random(0, 255));
    background(random(51));
  }
  else if (!(second() % 2 == 0))
  {
    background(51);
  }
  
  
  // Spinning Circles
  i = i + 0.1 + glitch;
  pushMatrix();
  translate(width/2, height/2);
  smooth();
  rotate(i);
  ellipse(0, 150, 20, 20);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  smooth();
  rotate(-i);
  ellipse(0, 150, 20, 20);
  popMatrix();
  
  //Side Rects
  float ang1 = radians(angle2);
  float ang2 = radians(angle3);
  
  y1 = height/2 + (100 * sin(ang1 * glitch));
  y2 = height/2 + (100 * sin(ang2 * glitch));
  
  rect(50, y1, 50, 50);
  rect(750, y2, 50, 50);
  angle2 +=-4;
  angle3 +=4;
  
  
  // Center Rect 
  pushMatrix();
  angle1 = angle1 + glitch;
  float c = cos(angle1);
  translate(width/2, height/2);
  rotate(c);
  rect(0, 0, 100, 100);
  popMatrix();
  
  
 

}


