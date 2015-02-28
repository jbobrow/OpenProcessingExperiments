
Alien alien1;
Alien alien2;
Alien alien3;

float interval;

void setup()
{
  frameRate(4);
  size(900, 500);
  smooth();

  interval = width/4.0;

  alien1 = new Alien();
  alien2 = new Alien();
  alien3 = new Alien();
}

void draw()
{
  pushMatrix();
  translate(0, 0);
  background(0);
  float r = random(255);
  float g = random(255);
  float b = random(255);
  float scaled = random(0.5, 1.5);
  float scaleeye = random(0.7, 1.1);
  float scaleeye2 = 1;
  float r1 = random(50, 100);
  float inc = 0.0;
  inc +=0.4;
  float angle2 = sin(inc)/10.0+sin(inc)/10.0;

  alien1.legs2(width/2, height/2);
  alien1.littlered(width/2, height/2, color(r, g, b));
  alien1.eyewhite(width/2, height/2, scaleeye);
  alien1.iris(width/2, height/2);
  alien1.ant(width/2, height/2, color(r, g, b));

  alien2.legs2(width/4, height/2);
  alien2.littlered(width/4, height/2, color(r, g, b));
  alien2.eyewhite(width/4, height/2, scaleeye2);
  alien2.iris(width/4, height/2);
  alien2.antennae(width/4, height/2, r1);

  alien3.legs(width*.75, height/2, angle2);
  alien3.littlered(width*0.75, height/2, color(r, g, b));
  alien3.eyewhite(width*.75, height/2, scaleeye2);
  alien3.iris(width*.75, height/2);
  alien3.ant(width*.75, height/2, color(r, g, b));


  popMatrix();
}








