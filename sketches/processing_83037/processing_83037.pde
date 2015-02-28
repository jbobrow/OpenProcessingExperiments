
PImage w;

void setup ()
{
  size(450,300);
  w = loadImage ("http://www.partycraze.com.au/images/windowinstaview-wintersnow.jpg");
  frameRate(1);
}
void draw ()
{
  image(w,0,0,450,300);
  noStroke();
  fill(255,254,206);
  int s = 1;
  while (s <= 100)
  {
    ellipse (int(random(20,430)),int(random(20,280)),7,7);
    s++;
  }  
}



