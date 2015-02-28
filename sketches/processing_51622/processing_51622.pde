

//------------------------------------------------
// PG_PlayingWithSpiro   2012-02-10
//------------------------------------------------

color sfColor, bgColor = color(64);
int vertices = 120;
int s1,s2, maxCount = 120, frames = maxCount;
float sfRadius, r, theta, thetaStep, t1,t2, m,f1,f2,f3;

//------------------------------------------------ 
void startRandom() 
{
  frames = 0;
  strokeWeight(1+random(2));  
  sfColor = color(100+random(155)
                 ,100+random(155)
                 ,100+random(155), 32);
  m  = int (random(3, 40));
  f1 = random(0.01, 0.5);
  f2 = random(0.01, 6.0);
  f3 = random(0.00, 0.1);
  t1 = random(0.8, 1.2);
  t2 = random(0.8, 1.2);
  thetaStep = random(0.05, 10.0);
  sfRadius = random(160, 380);
}
//------------------------------------------------ 
void setup() 
{
  size(512,512);
  s1 = width;
  s2 = width/2;
  background(bgColor);
  frameRate(60);
  smooth();
}
//------------------------------------------------ 
void draw() 
{
  copy(0, 0, width, height, 1, 1, width-3, height-3);
  fill(bgColor,3);
  rect(-8, -8, width+16, height+16);

  frames++;
  if (frames > maxCount) startRandom();
  translate(s2, s2);
  noFill();
  stroke(sfColor);
  beginShape();
  for(int vi=0; vi < vertices; vi++) 
  { r = sfRadius * pow( ( (pow(abs(cos(m*theta)*t1),f2))
                         +(pow(abs(sin(m*theta)*t2),f3))), (-1/f1)); 
    curveVertex(r*cos(theta), r*sin(theta));
    theta += thetaStep;
  }
  endShape();
}
//------------------------------------------------ 
void mousePressed()  
{
  startRandom();
}
//------------------------------------------------ 
void keyPressed()  
{
  if (key==' ') startRandom();
  if (key=='s') save("spiro.png");
}


