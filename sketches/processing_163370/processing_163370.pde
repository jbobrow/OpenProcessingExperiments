
float gravity = 0.98;
float speed =10;
float y = 0;
float[] x = new float[50];


void setup()
{
  size(600,600);
  smooth();
  
}

void draw()
{
  
  background(119,222,215,100);
  for(int i=0; i<50;i++)
  { 
    x[i] = random(600);
    ellipseMode(CENTER);
    ellipse(x[i],y,5,30);
    fill(255,255,255,random(1000));
    line(x[i], y, x[i], y-20);
    stroke(119,222,215,random(100));
    y = y + speed + gravity;
  
    if(y>height)
    {
      y = -50;
      speed = 10;
    }
  }
}
