
int a=0;
int b=0;
int c=0;
int d=0;
int e=0;
int f=0;
int g=0;
int h=250;
int i=250;
int j=0;
int x=0;
int y=0;
int z=0;
boolean isStarting=false;
void setup()
{
  size(500, 500);
}
void draw()
{
  if (j==0)
  {
  textSize(40);
    textAlign(CENTER);
    text("Click to Start", h, i);
  }
 
  
  noStroke();
  fill(d, e, f, g);
  ellipse(a, b, c, c);
  rect(x, y, z, c);
  if (isStarting==true)
  {
    a=int(random(500));
    b=int(random(500));
    c=int(random(100));
    d=int(random(255));
    e=int(random(255));
    f=int(random(255));
    g=int(random(255));
    x=int(random(475));
    y=int(random(475));
    z=int(random(100));
    
  }
 
  
}
void mouseClicked()
{
 j=2;

  isStarting=true;
}
void keyPressed()
{
  isStarting=false;
 }

