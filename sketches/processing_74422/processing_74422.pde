
// Wendy Chuyi Liu, Gold Fish, Mods 16/17
// http://besttoshow.webs.com/

boolean looping = true;
void setup()
{
  size(500, 500);
  background(random(255), random(255), random(255));
  frameRate(2);
}
void draw()
{
  background(random(255), 225, random(200));
  stroke(random(255), random(255), random(255));
  strokeWeight(3);
  fill(random(255), random(255), random(255), 90);
  float x = 0 ;
  float y = 0;
  int  v= 1;
  while (v<100)
  {
    ellipse(random(500), random(500), x, y);
    v ++;
    x = (random(12, 60));
    y = (random(12, 60));
  }
}
void mousePressed()
{
  if ( looping == true)
  {
    noLoop();
    looping = false;
  }
  else
  {
    loop ();
    looping = true;
  }
}
