
/*float a = 0.0;
float s = 0.0;*/

void setup() 
{
  
  size(800, 800);
  noStroke();
  frameRate(30);
}

void draw() 
{
  
  background(100);
  
  /*a = a + 0.04;
  s = cos(a)*2;*/
  
  float colorA;
  colorA = 0;
  float colorB;
  colorB = 0;
  float colorC;
  colorC = 0;
  
  float squareX;
  squareX = random(0,600);
  float squareY;
  squareY = random(0,600);
  float squareW;
  squareW = random(50,200);
  float squareH;
  squareH = random(50,200);
  
  float M;
  M = 0;
  float N;
  N = 255;
  
  float Z;
  Z = random(0,255);
  
  /*float angle;
  angle = PI;
  float rotation = cos(angle);
  rotate (rotation);*/
  
  if (second() % 4 == 0)
    {
      background(Z);
    }
  
  if (second() % 12 == 0)
    {
      fill(0);
      ellipse(400, 400, 400, 400);
      ellipse(200, 200, 400, 400);
      ellipse(200, 600, 400, 400);
      ellipse(600, 200, 400, 400);
      ellipse(600, 600, 400, 400);
    }
  
  if (second() % 1 == 0) 
    {
      colorA = random(0,255);
      colorB = random(0,255);
      colorC = random(0,255);
    }
    
  fill(colorA, colorB, colorC);
  
  rect(0,0,200,200);
  rect(200,200,200,200);
  rect(400,400,200,200);
  rect(600,600,200,200);
  
  rect(400,0,200,200);
  rect(600,200,200,200);
  rect(0,400,200,200);
  rect(200,600,200,200);
    
   if (second() % 5 == 0)
    {
      fill(M);
      rect(squareX,squareY,squareW,squareH);
    }
    
   if (second() % 7 == 0)
    {
      fill(N);
      rect(squareX,squareY,squareW,squareH);
    }
    
  /*fill(colorA, colorB, colorC);
  
  rect(0,0,200,200);
  rect(200,200,200,200);
  rect(400,400,200,200);
  rect(600,600,200,200);
  
  rect(400,0,200,200);
  rect(600,200,200,200);
  rect(0,400,200,200);
  rect(200,600,200,200);*/
  
  
  /*scale(s); 
  fill(colorA, colorB, colorC);
  rect(100, 100, 50, 50); 
  
  translate(75, 0);
  fill(colorA, colorB, colorC);
  scale(s);
  rect(100, 100, 50, 50);  */
  
}

