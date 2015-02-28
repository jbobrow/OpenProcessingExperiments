
int mul1, mul2;
float theta,level,dia;
void setup()
{
  noStroke();
  size(600, 600);
  background(0);
  smooth();
}

void draw()
{
  fill(100, 100, 100, 10);
  noStroke();
  rect(0, 0, width, height);
  fill(255);
  level=1;
  dia = 100;
  drawEllipse(width/2, height/2);
}

void drawEllipse(float a, float b)
{
  fill(level*40,255-(level*40),255,  255-(level*40));
  translate(a, b);
  ellipse(0, 0, dia/level, dia/level);
  theta = random(0, 6);  //radian
  level+=1;
  mul1 = (int)random(1, 3);
  if (mul1 <1.5)
    mul1=-1;
  else  
    mul1 = 1;
  mul2 = (int)random(1, 3);
  if (mul2 <1.5)
    mul2=-1;
  else
    mul2 = 1;

  if (level<8)
    drawEllipse(mul1*dia*cos(theta)/(level-1), mul2*dia*sin(theta)/(level-1));
}


