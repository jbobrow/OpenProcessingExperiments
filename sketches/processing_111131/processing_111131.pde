
PImage tigerImage;

void setup()
{
  size(400, 400);
  frameRate(12);
  tint(255, 200);
  tigerImage = requestImage("Tiger.jpg");
}
 
void draw()
{
  if (tigerImage.width > 0)
  {
    image(tigerImage, 0, 0, width, height);
  }
  
  copy(210, 165, 40, 40, 250, 160, 40, 40);
  copy(170, 165, 40, 40, 130, 160, 40, 40);
  copy(150, 110, 40, 40, 170, 160, 40, 40);
  copy(240, 110, 40, 40, 210, 160, 40, 40);
 
  fill(random(0, 150), random(50, 150));
  triangle(width, height, width, height*.9, width*.6, height);
  fill(random(0, 100), random(50, 150));
  triangle(width, height*.9, width*.68, height*.72, width*.6, height);
  fill(random(0, 150), random(50, 150));
  triangle(width*.4, height, width*.3, height*.75, 0, height);
  fill(random(0, 100), random(50, 150));
  triangle(width*.68, height*.72, width*.6, height, width*.5, height*.85);
  fill(random(0, 150), random(50, 150));
  triangle(width*.6, height, width*.5, height*.85, width*.4, height);
  fill(random(0, 100), random(50, 150));
  triangle(width*.4, height, width*.5, height*.85, width*.3, height*.75);
  fill(random(0, 150), random(50, 150));
  triangle(0, height, width*.3, height*.75, 0, height*.67);
  fill(random(0, 100), random(50, 150));
  triangle(0, height*.67, width*.3, height*.75, width*.23, height*.6);
  
  float a = 0;
  float b = 0;
  float prevA = a;
  float prevB = b;
  
  while (a < 400)
  {
    a += 20;
    b += random(-10, 10);
    line(prevA, prevB, a, b);
    prevA = a;
    prevB = b;
  } 
  
  float c = 0;
  float d = 100;
  float prevC = c;
  float prevD = d;
  
  while (c < 400)
  {
    c += 20;
    d += random(-20, 20);
    line(prevC, prevD, c, d);
    prevC = c;
    prevD = d;
  } 
  
  float e = 0;
  float f = 200;
  float prevE = e;
  float prevF = f;
  
  while (e < 400)
  {
    e += 20;
    f += random(-30, 30);
    line(prevE, prevF, e, f);
    prevE = e;
    prevF = f;
  } 
}

void mousePressed() 
{
  loop();
}

void mouseReleased() 
{
  noLoop();
}




