
import processing.pdf.*;

void setup()
{
  size(250,500);
  noStroke();
  smooth();
  background(255);
}

int x = -15;

void back()
{
  loop();
  smooth();
  strokeWeight(1);
  for(float y=-1;
          y<height; 
          y = y + 1)
  {
    ellipse(x, y, 0.1, 0.1);
    stroke(color(255,255,102),random(0,25));
  }
  x=x+1;
}

int qw = 0;

void back2()
{
  loop();
  smooth();
  strokeWeight(1);
  for(float q=-1;
          q<height; 
          q = q + 1)
  {
    ellipse(qw, q, 0.1, 0.1);
    stroke(color(255,0,0),random(0,55));
  }
  qw=qw+1;
}

void rect1()
{
  
}
int control = 0;
int a = 0;
int b = 0;
void draw()
{
  if (control<500)
  {
    if (control<270)
    {
      back();
      back2();
    }
    strokeWeight(20);
    if(control<13)
    {
      fill(0,0,204,50);
      quad(-10+a,250+a,250+a,0+a,260+a,0+a,-10+a,260+a);
      a = a - 10;
    }
    if(control<26)
    {
      fill(0,0,204,50);
      quad(-130+b,370+b,250+b,0+b,260+b,0+b,-130+b,380+b);
      b = b + 10;
    }
    control = control + 1;
  }
  if(control==500)
  {
  println("finished");
  //exit();
  }
}


