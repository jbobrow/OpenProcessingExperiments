
void setup ()
{
  size(500,500);
  background(255);
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
float grey_hour = map(hour(),0,59,0,255);
fill (grey_hour);
rect(200,320,100,100);
popMatrix();

pushMatrix();
noStroke();
fill(10);
translate(250,130);
float second_now = map(second(),0,59,0,2*PI);
rotate(second_now);
ellipse(0,100,10,10);
popMatrix();

pushMatrix();
noStroke();
fill(150);
translate(250,250);
float minute_now = map(minute(),0,59,0,2*PI);
rotate(minute_now);
ellipse(0,100,15,15);
popMatrix();

pushMatrix();
noStroke();
fill(230);
translate(250,370);
float hour_now = map(hour(),0,23,0,2*PI);
rotate(hour_now);
ellipse(0,100,30,30);
popMatrix();

}
