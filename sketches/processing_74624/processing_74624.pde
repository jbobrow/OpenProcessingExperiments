
// Laura R., 100 Random Shapes, Computer Programming 1, 14-15

PImage c;
void setup()
{
  size (300,450);
  noStroke();
  c = loadImage ("http://www.everythingunderthemoon.net/images/spells/white-candle.jpg");
  frameRate (1);
}
void draw()
{
  image (c,0,0,300,450);
  noStroke(); 
  fill(250,209,43); 
  int s = 1;
  while (s <= 100)
  {
    ellipse (int(random(50,270)),int(random(30,220)),3,3);
    s++;
  }
}
