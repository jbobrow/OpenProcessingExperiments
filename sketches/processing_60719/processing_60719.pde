
int WIDTH = 580;
int HEIGHT = 580;
boolean flicker = true;
  
int[] x = new int[20];
int[] y = new int[20];
  
void setup()
{
    size (WIDTH, HEIGHT);
    rectMode(CENTER);
    ellipseMode(CENTER);
    frameRate(40);
    for (int i = 0; i < 20; i++)
    {
        x[i] = 0;
        y[i] = 0;
    }
}
  
void draw()
{
    background(0);
    for (int i = 0; i < 19; i++)
    {
        x[i]= x[i+1];
        y[i]= y[i+1];
    }
     
   x[7] = mouseX;
   y[7] = mouseY;
    
   ellipse(x[0],y[0],20,20);
}
