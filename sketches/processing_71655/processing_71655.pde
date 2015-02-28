

int w = 600; 
int h = 600; 
int t = 0;
 
void get_strokeFill()
{
  size(600,600);
  if (mouseX < w/10)
    stroke(30, random(40), random(175), random(175, 15));
  else if ((w/3 <= mouseX) && (mouseX <= (2*w/3)))
    stroke(60,random(155), random(205), random(175, 200));
  else if ((2*w/3 >= mouseX) && (mouseX >= w))
    stroke(90, random(105), random(255),  random(100, 255));
}
 
float get_radius()
{
  float r = random(90, 90 + mouseX);
  return r;
}
 
void setup()
{
    size(w, h);
  smooth(); noStroke();
  background(0);
}
 
void draw()
{
  get_strokeFill();
   
  t += random(10, mouseX/10);
   
  float r = get_radius();
  float xStart = mouseX + (r*cos(radians(t)));
  float yStart = mouseY - (r*sin(radians(t)));
  float xEnd = mouseX + (r*cos(radians(t)));
  float yEnd = mouseY + (r*sin(radians(t)));
   
  line(xStart, yStart, xEnd, yEnd);
}


