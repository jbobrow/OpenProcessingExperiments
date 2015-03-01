
void setup()
{
  size(600,300);
}

void draw()
{
}

void keyPressed()
{
  int a = int(random(255));
  int b = int(random(255));
  int c = int(random(255));
  fill(a+random(70)-35,b+random(70)-35,c+random(70)-35);
  rect(0,0,300,150);
  fill(255-a+random(70)-35, 255-b+random(70)-35, 255-c+random(70)-35);
  rect(0,150,300, 150);
  fill(255-a+random(70)-35, 255-b+random(70)-35, 255-c+random(70)-35);
  rect(300,0,300,150);
  fill(a+random(70)-35,b+random(70)-35,c+random(70)-35);
  rect(300,150,300,150);
  
  Melodie(0,0);
  Melodie(300,0);
  Melodie(0,150);
  Melodie(300,150);
  save("Test.png");
}

void Melodie(float a, float b)
{
  int x = int(random(2));
  if (x == 0)
  {
    Melodie2(a,b);
  }
  else
  {
    Melodie3(a,b);   
  }
}

void Melodie2( float a, float b)
{
 fill(200+random(50), random(50), random(50));
 ellipse(a+80, b+80, 75,75);
 fill(random(50), random(200) + 50, random(200) + 50);
 ellipse(a+180, b+ 80, 60, 60);
}

void Melodie3( float a, float b)
{
 fill(200+random(50), random(50), random(50));
 ellipse(a+50, b+80, 60,60);
 fill(random(50), random(200) + 50, random(200) + 50);
 ellipse(a+ 140, b+ 80, 50, 50);
 ellipse(a+ 215, b+ 80, 50, 50);
}
