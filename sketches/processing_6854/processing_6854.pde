
ArrayList newball;
int i=0;
void setup()
{
  size(600,600);
  newball = new ArrayList();
  newball.add(new Ball());
}

void draw()
{
  background(200);
  
  newball.add(new Ball());
  if(i>0)
  { 
    for(int t=0;t<newball.size();t++)
    {  
      Ball temp = (Ball)newball.get(t);
      temp.move();
    }
  }
  i++;
  println(i);
}

void mousePressed()
{
  
}

class Ball
{
  int x=0;
  int f=0;
  Ball()
  {
    f=0;
    x=mouseX;
  }
  void move()
  {    
    f+=1;
    ellipse(x,f,10,10);
    noStroke(); 
  }  
}

