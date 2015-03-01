
void setup()
{
size(500,500);
background(0);
noFill();
frameRate(15);
}

int clock = 500;
int strokeR = 30;
int strokeG = 30;
int strokeB = 30;
int strokeA = 30;
int clock2 = 0;
int clock3 = 0;
int rep = 0;

void draw()
{
  if (frameCount <= 225)
  {
   strokeR += 1; 
   stroke(strokeR,0,0);
   noFill();
  }
  if (frameCount >=225 && frameCount <=450)
  {
   strokeG += 1; 
   stroke(0,strokeG,0);
   noFill();
  }
  if (frameCount >=450 && frameCount <=675)
  {
   strokeB += 1; 
   stroke(0,0,strokeB);
   noFill();
  }
  if (frameCount >=675 && frameCount <=900)
  {
   strokeA += 1; 
   stroke(strokeA);
   noFill();
  }
  if (frameCount <= 900)
  {
  if (rep%2 == 0)
  {
   clock2 += 1;
   clock3 += 1;
  }
  else
  {
   clock2 -= 1;
   clock3 -= 1; 
  }
  if (clock2 == 100 && clock3 == 100)
  {
   rep += 1; 
  }
  if (clock2 == 0 && clock3 == 0)
  {
   rep += 1; 
  }
pushMatrix();
float my_angle = map(clock, 100, width, 0, 35*PI);
translate(width/2, height/2);
rotate(my_angle);
triangle(10,500, 150, 100,40,20);
popMatrix();
clock -= 1;
println(rep);
noStroke();
fill(0);
ellipse(width/2,height/2,100,100);
fill(255);
ellipse(width/2,height/2,clock2,clock3);
  }
}



