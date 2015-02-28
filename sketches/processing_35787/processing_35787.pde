
int x,y, x1, y1;
int a,b,a1,b1;

void setup()
{
  size(700,700);
  background(255);
  x1=250;
  y1=250;
  a1=250;
  b1=250;
  frameRate(15);
  rectMode(CENTER);
  smooth();
}
void draw()
{
  y=y1+(height/10)-int(random(height/5));
  x=x1+(width/10)-int(random(width/5));
  b=b1+(height/10)-int(random(height/5));
  a=a1+(width/10)-int(random(width/5));
  strokeWeight(2);
  stroke(255,0,0,100);
  line(x1,y1,x,y);
  if((y%5)==0 || x%5==0)
  {
    fill(201,255,77,128);
    rect(x,y,10,10);
  }
  stroke(0,0,255,100);
  line(a1,b1,a,b);
  if(b%5==0 || a%5==0)
  {
    fill(255,168,67);
    rect(a,b,10,10);
  }
  stroke(128,0,230,25);
  line(a1,b1,x1,y1);
  x1=x;
  y1=y;
  b1=b;
  a1=a;
}
void mousePressed()
{
  background(255);
  x1=mouseX;
  y1=mouseY;
  a1=mouseX;
  b1=mouseY;
}



