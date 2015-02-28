
float bombe1 = random(1, 700);
float bombe2 = random(1, 700);
float bombe3 = random(1, 700);
float bombe4 = random(1, 700);
float bombe5 = random(1, 700);
float bombe6 = random(1, 700);
float bombe7 = random(1, 700);
float bombe8 = random(1, 700);
float fart1 = random(3, 6);
float fart2 = random(3, 6);
float fart3 = random(3, 6);
float fart4 = random(3, 6);
float fart5 = random(3, 6);
float fart6 = random(3, 6);
float fart7 = random(3, 6);
float fart8 = random(3, 6);

//Rumskib
int ruksbX = 350;
int ruksbX2 = 40;
int ruksbY = 670;
int ruksbY2 = 40;

float afstand = sqrt((ruksbX-bombe1)*(ruksbX-bombe1)+(ruksbY-fart1)*(ruksbY-fart1));
float afstand2 = sqrt((ruksbX-bombe2)*(ruksbX-bombe2)+(ruksbY-fart2)*(ruksbY-fart2));
float afstand3 = sqrt((ruksbX-bombe3)*(ruksbX-bombe3)+(ruksbY-fart3)*(ruksbY-fart3));
float afstand4 = sqrt((ruksbX-bombe4)*(ruksbX-bombe4)+(ruksbY-fart4)*(ruksbY-fart4));
float afstand5 = sqrt((ruksbX-bombe5)*(ruksbX-bombe5)+(ruksbY-fart5)*(ruksbY-fart5));
float afstand6 = sqrt((ruksbX-bombe6)*(ruksbX-bombe6)+(ruksbY-fart6)*(ruksbY-fart6));
float afstand7 = sqrt((ruksbX-bombe7)*(ruksbX-bombe7)+(ruksbY-fart7)*(ruksbY-fart7));
float afstand8 = sqrt((ruksbX-bombe8)*(ruksbX-bombe8)+(ruksbY-fart8)*(ruksbY-fart8));

void setup()
{
  size(700, 700);
}

void draw()
{
  background(255, 255, 255);
  fart1 = fart1+4;
  fart2 = fart2+3;
  fart3 = fart3+5;
  fart4 = fart4+2;
  fart5 = fart5+6;
  fart6 = fart6+7;
  fart7 = fart7+9;
  fart8 = fart8+1;

  //sorte bomber der falder  
  fill(0, 0, 0);  
  ellipse(bombe1, fart1, 20, 20);
  ellipse(bombe2, fart2, 20, 20);
  ellipse(bombe3, fart3, 20, 20);
  ellipse(bombe4, fart4, 20, 20);
  ellipse(bombe5, fart5, 20, 20);
  ellipse(bombe6, fart6, 20, 20);
  ellipse(bombe7, fart7, 20, 20);
  ellipse(bombe8, fart8, 20, 20);

  if (fart1 >= 700)
  {
    fart1 = 1;
    bombe1 = random(1, 700);
  }
  if (fart2 >= 700)
  {
    fart2 = 5;
    bombe2 = random(1, 700);
  }
  if (fart3 >= 700)
  {
    fart3= 5;
    bombe3 = random(1, 700);
  }
  if (fart4 >= 700)
  {
    fart4 = 5;
    bombe4 = random(1, 700);
  }
  if (fart5 >= 700)
  {
    fart5 = 5;
    bombe5 = random(1, 700);
  }
  if (fart6 >= 700)
  {
    fart6 = 5;
    bombe6 = random(1, 700);
  }
  if (fart7 >= 700)
  {
    fart7 = 5;
    bombe7 = random(1, 700);
  }
  if (fart8 >= 700)
  {
    fart8 = 5;
    bombe8 = random(1, 700);
  }


  //Rumskib der bevæger sig af X aksen

  ellipse(ruksbX, ruksbY, ruksbX2, ruksbY2);
  if (keyPressed)
  {
    if (key == 'a' || key == 'A')
    {
      ruksbX = ruksbX-5;
      ellipse(ruksbX, ruksbY, ruksbX2, ruksbY2);
    }
    if (key == 'd' || key == 'D')
    {
      ruksbX = ruksbX+5;
      ellipse(ruksbX, ruksbY, ruksbX2, ruksbY2);
    }
  }
  //If konsekvens af hvis en bombe rammer skib



  afstand = sqrt((ruksbX-bombe1)*(ruksbX-bombe1)+(ruksbY-fart1)*(ruksbY-fart1));
  if (afstand < 20)
  {
    exit();
  }
  afstand8 = sqrt((ruksbX-bombe8)*(ruksbX-bombe8)+(ruksbY-fart8)*(ruksbY-fart8));
  if (afstand8 < 20)
  {
   exit();
  }
  afstand2 = sqrt((ruksbX-bombe2)*(ruksbX-bombe2)+(ruksbY-fart2)*(ruksbY-fart2));
  if (afstand2 < 20)
  {
    exit();
  }
  afstand3 = sqrt((ruksbX-bombe3)*(ruksbX-bombe3)+(ruksbY-fart3)*(ruksbY-fart3));
  if (afstand3 < 20)
  {
    exit();
  }
  afstand4 = sqrt((ruksbX-bombe4)*(ruksbX-bombe4)+(ruksbY-fart4)*(ruksbY-fart4));
  if (afstand4 < 20)
  {
    exit();
  }
  afstand5 = sqrt((ruksbX-bombe5)*(ruksbX-bombe5)+(ruksbY-fart5)*(ruksbY-fart5));
  if (afstand5 < 20)
  {
    exit();
  }
  afstand6 = sqrt((ruksbX-bombe6)*(ruksbX-bombe6)+(ruksbY-fart6)*(ruksbY-fart6));
  if (afstand6 < 20)
  {
    exit();
  }
  afstand7 = sqrt((ruksbX-bombe7)*(ruksbX-bombe7)+(ruksbY-fart7)*(ruksbY-fart7));
  if (afstand7 < 20)
  {
    exit();
  }
}
