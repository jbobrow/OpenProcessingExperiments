
//Using noise to generate terrain/water
//M. Kontopoulos (11.2010

float t = 0.0;
float t2 = 0.0;
float t3 = 0.0;
float step = 0.005;
float step2 = 0.004;
float step3 = 0.006;
void setup()
{
  size(300,300);
  fill(100);
  smooth();
}
void draw()
{
  background(200);
  stroke(30,117,206, 150);
  for (int i=0; i<width; i++) {
    //try replacting t with mouseX!
    float mountain = noise((i+t)/300.0 + 8) * 150;
    line(i,height, i,mountain);
    t+=step;
  }

  stroke(30,100,200, 100);
  for (int i=0; i<width; i++) {
    //try replacting t with mouseX!
    float mountain = noise((i+t2)/280.0 + 10) * 160;
    line(i,height, i,mountain);
    t2+=step2;
  }

  stroke(40,100,180, 100);
  for (int i=0; i<width; i++) {
    //try replacting t with mouseX!
    float mountain = noise((i+t3)/320.0 + 9) * 155;
    line(i,height, i,mountain);
    t3+=step3;
  }
}


