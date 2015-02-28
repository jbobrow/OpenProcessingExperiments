
//Michelle Z, CP1 4-5, Doubling Shapes

int i = 0;
int num;

void setup()
{
  size(500,500);
  background(0);
  noStroke();
  smooth();
  num = 1;
  frameRate(2);
}

void draw()
{
  fill(0);
  rect(0,0,500,500);
  while (i <= num)
  {
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));  
    fill(r,g,b);
    
    int x = int(random(10,490));
    int y = int(random(10,490));
    float siz = random(50,80);
  
    ellipse(x,y,siz,siz);
    i = i+1;
  }
  textSize(50);
  textAlign(CENTER);
  text(i/2,250,50);
  num = num*2;
  if (i > 513)
  {
    i = 2;
    num = 1;
    fill(0);
    rect(0,0,500,500);
  }
}

