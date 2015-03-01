
float r = 75;

void setup()
{
  size(400,400);
}
void draw()
{
 
  background(204);
  float s = map(second(), 0, 59,0,2*PI)-HALF_PI ;
  float m = map(minute(), 0, 59, 0, 2*PI )-HALF_PI ;
  float h = map(hour(), 0, 24, 0, 2*PI )-HALF_PI ;
noFill();
strokeWeight(20);
stroke(50,200,30);
arc(200, 200, 180, 180,-HALF_PI, h);
stroke(30,45,67);
arc(200, 200, 240, 240,-HALF_PI, m);
stroke(30,200,20);
arc(200, 200, 300 , 300,-HALF_PI, s);

  

}


