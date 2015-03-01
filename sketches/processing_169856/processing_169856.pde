
void setup ()
{
  size(500,500);
  background(0);
  smooth();
}

void draw()
{
pushMatrix();
translate(100,0);
float grey = map(second(), 0, 59, 0, 255);
fill(grey);
rect(100,80,100,100);
popMatrix();

pushMatrix();
float grey_minute = map(minute(),0,59,0,255);
fill (grey_minute);
rect(200,200,100,100);
popMatrix();

pushMatrix();
float grey_hour = map(hour(),0,23,0,255);
fill (grey_hour);
rect(200,320,100,100);
popMatrix();

}
