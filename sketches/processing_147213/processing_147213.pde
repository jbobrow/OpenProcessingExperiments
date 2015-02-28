
float ex = 0;
float ey;
float espeed ;


void setup()
{
  size (800,800);
  ey = random (0,700);
  espeed = random (0,5);
}

void draw()
{
  background(#00FFFF);
  fill(#19D119);
  
  pushMatrix();
  translate(mouseX-400, mouseY-250);
  ellipse(330,mouseY,55,35);
  ellipse(390,mouseY,30,60);
  ellipse(410,mouseY,20,50);
  ellipse(630,mouseY,20,60);
  ellipse(610,mouseY,30,50);
  triangle(655,mouseY,395,mouseY,345,mouseY);
  fill(#008000);
  arc (500,mouseY,310,200,3.14,6.28);
  fill(#000000);
  ellipse(320,mouseY,2.5,2.5);
  popMatrix(); 
  
  ex = ex + espeed;
  fill (0);
  ellipse (ex, ey, 100,100);
  
}


