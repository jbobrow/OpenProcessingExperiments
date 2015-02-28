
int x=0;
int y=0;
float num1=0;
int num2=300;

void setup()
{
  size(500,500);
  background(0,0,255);
}

void draw()
{
  for(int count=500;y<count;y+=20)
  {
    for(int count2=500;x<count2;x+=20)
    {
      num1=random(305);
      if(num1<num2)
      {
        fill(random(70),random(70),random(100,255));
        triangle(x,y,x,y+20,x+10,y+10);
        fill(random(100),random(100),random(100,255));
        triangle(x,y,x+20,y,x+10,y+10);
        fill(random(100),random(100),random(100,255));
        triangle(x+20,y,x+10,y+10,x+20,y+20);
        fill(random(70),random(70),random(100,255));
        triangle(x,y+20,x+10,y+10,x+20,y+20);
      }
      if(num1>=num2)
      {
        num1=random(500);
        if(num1<num2)
        {
          fill(random(75,120));
          quad(x,y,x+20,y,x+20,y+20,x,y+20); 
          fill(random(70),random(70),random(100,255));
          rect(x,y,10,10);
          fill(random(70),random(70),random(100,255),200);
          rect(x+10,y,10,10);
          fill(random(70),random(70),random(100,255));
          rect(x,y+10,10,10);
          fill(random(70),random(70),random(100,255),200);
          rect(x+10,y+10,10,10);
          stroke(255);
          line(x,y,x+20,y);
          line(x,y+20,x,y);
          stroke(0);
        }
        if(num1>=num2)
        {
          num1=random(600);
          if(num1<num2)
          {
            fill(random(70),random(70),random(100,255),200);
            rect(x+10,y,10,10);
            fill(random(70),random(70),random(100,255));
            rect(x,y+10,10,10);
            fill(random(70),random(70),random(100,255));
            bezier(x,y,x+20,y,x+20,y+20,x,y+20);
            stroke(255);
            line(x,y,x+20,y);
            line(x,y+20,x,y);
          }
          else
          {
            fill(random(70),random(70),random(100,255));
            rect(x,y+10,10,10);
            fill(random(70),random(70),random(100,255),200);
            rect(x+10,y+10,10,10);
            fill(random(70),random(70),random(100,255));
            bezier(x+20,y,x+20,y+20,x,y+20,x,y);
            stroke(255);
            line(x,y,x+20,y);
            line(x,y+20,x,y);
          }
          stroke(0);
        }
        stroke(0);
      }
    }
    x=0;
  }
}


