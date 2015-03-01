

void setup()
{
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
  background(0);
  String s = "! !";
 
  float sz = random(200, 500);
  float x = random(0, width);
  float y = random(0, height);
 
  if (mousePressed)
  {
    int substrbegin = (int)random(0, s.length()-1);
    int substrend = (int)random(substrbegin+1, s.length()-1);
    textSize(sz);
    colorMode(HSB,360,100,100);
    fill(mouseX*360/width, 100, 100);
    text(s.substring(substrbegin, substrend), x, y);
  } else
  {
    textSize(20);
    fill(255);
    text(s+" Press ! !", width/2, height/2);
  }
}
