
void setup()
{
  size (400,400);
  background (16,78,139);
  ellipseMode(CENTER);
  
}

void draw()
{
  //background(131,139,131);
float sekundeNOW = map(second(),0,59,0,2*PI);

pushMatrix ();
translate (width/2,height/2);
rotate (sekundeNOW);
noFill();
stroke(random(100), random(220),(255));
ellipse (0,-75, 20, 20);
popMatrix();

float minuteNOW = map(minute(),0,59,0,2*PI);

pushMatrix();
translate (width/2,height/2);
rotate(minuteNOW);
noFill();
stroke(random (100), random (220),(255));
ellipse (0,-100,30,30);
popMatrix();

float hourNOW = map(hour(),0,23,0,2*PI);

pushMatrix();
translate (width/2, height/2);

noFill();
stroke (random (100), random(220),(255));
ellipse (0,-125,40,40);
rotate (hourNOW);
popMatrix();

}

//korrektur 10112014
