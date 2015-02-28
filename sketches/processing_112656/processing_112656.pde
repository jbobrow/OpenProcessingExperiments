
float degrees;
float T;
float X;
float Y;
float A;
void setup()  
{
  size(500,500);
  background(255);
  T = 0;
  X = 0;
  Y = TWO_PI/25;
  A = 0;
}

void draw()
{
  T = T + 1;
  if (T > 360)
  { T = 0;}
  degrees = radians(T);
  if (T <= 90 && T > 0)
  {fill(0);
   stroke(255);
   square(1);}
  if (T <= 180 && T > 90)
  {fill(255);
    square(0.6);}
  if (T <= 270 && T > 180)
  {fill(0);
   stroke(255);
   square(0.3);}
  if (T <= 360 && T > 270)
  {fill(255);
   square(.1);
  }
  
  if (T == 360 || T == 270 || T == 180 || T == 90)
    {
      sineLine();
    }
 
   
  
  
  println(T);
  
  
}

void sineLine()
{ for (int X = 0; X < 500; X += 4)
    { stroke(0);
      line(X, 50, X, 50 + sin(A) * random(40));
      line(X, 450, X, 450 + sin(A)*random(40));
      A += Y;}
}

void square(float s)
{ rectMode(CENTER);
  pushMatrix();
  translate(width/2,height/2);
  rotate(degrees);
  scale(s);
  rect(0,0,250,250);
  popMatrix();
}


