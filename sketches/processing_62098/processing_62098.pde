
int chicks = 10;
int [] chicken = new int [chicks];
int [] chickX = new int [chicks];
float [] chickY = new float [chicks];
float [] fallingSpeed = new float [chicks];

void chick(float x, float y)
{
  noStroke(); smooth();
  fill(255);
  ellipse(x/2, y/2, 200,200);
  fill(255,0,0);
  ellipse(x/2,y/2 -100,40,40);
  fill(255,0,0);
  triangle(x/2 -20, y/2 -100, x/2 +20, y/2 -100, x/2, y/2 -70);
  fill(230,150,0);
  triangle(x/2,y/2 -40, x/2 +20, y/2, x/2 -20, y/2);
  fill(0);
  ellipse(x/2-50, y/2 -40, 10,30);
  ellipse(x/2+50, y/2 -40, 10,30);
}

void setup()
{
  size(800,800);
  background(230,180,0);
  float x,y;
  chick(300,300);
  chick(width,height);
  
  for(int i=0; i<chicks; i++)
  {
    chickX[i] = int(random(30,1500));
    chickY[i] = 30;
    fallingSpeed[i] = random(1,10);
  }
}
  
void draw()
{
  size(800,800);
  background(230,180,0);
 
  for(int i=0; i<chicks; i++)
  {
    chickY[i] += fallingSpeed[i]; 
    chick(chickX[i],chickY[i]);
  }
}
