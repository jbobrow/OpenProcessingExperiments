
//Michelle Z, CP1 4-5, Repeating Loops

size(500,500);
background(255);
noFill();

//Fading cyan background
float cyan = 0;
int circle = 1;
while(circle < 708)
{
  stroke(cyan,255,255);
  ellipse(250,250,circle,circle);
  circle = circle + 1;
  cyan = cyan + 0.4;
}

//White circles
int secondCircle = 1;
while(secondCircle < 701)
{
  ellipse(250,250,secondCircle,secondCircle);
  secondCircle = secondCircle + 20;
}

//Purple X
int n = -50;
while(n < 701)
{
  stroke(255,0,255,150);
  arc(n,n-150,250,250,PI/4,PI+PI/4);
  arc(n,n+150,250,250,PI+PI/4,TWO_PI+PI/4);
  arc(500-n,n+150,250,250,PI/2+PI/4,TWO_PI-PI/4);
  arc(500-n,n-150,250,250,TWO_PI-PI/4,TWO_PI+PI/2+PI/4);
  n = n + 50;
}
