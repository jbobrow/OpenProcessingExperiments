
boolean looping = true;
int count = 1;
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
  while (v <=count)
  {
        x = (random(12, 60));
    y = (random(12, 60));
    ellipse(random(500), random(500), x, y);
    v ++;

  }
  count = count *2;
  if (count > 1000)
  {
    count = 1;
    v = 1;
  }
  textSize(300);
  text(count/2,0,250);
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
