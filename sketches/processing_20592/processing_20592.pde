
int x = 0;
int y= 0;
int b = 200;
int c =200;
int e=200;
void setup()
{ 

  size(200,200);
}

void draw()
{
  background(24,138,98);  
  if (x<50)
  {background (255,0,100);
  }
  fill(255);
  ellipse(x,100,20,20);

  x++;

  if(x>200) {
    x=0;
  }

  ellipse(100,y,20,20);

  y++;

  if(y>200) {
    y=0;
  }

    ellipse(b,100,20,20);

    b--;
  

  if(b<0) {
    b=200;
  }

  ellipse(100,c,20,20);

  c--;

  if(c<0) {
    c=200;
  
}

}


