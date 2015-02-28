
int pos, pos1;

void setup()
{
  size(100,100);
  background(0);
  pos = 0;
  pos1 = 1;
  
//  fill(255);

//  ellipse(x, height/2, 20, 20);
  
}

void draw()
{
  //background(50);
  
  pos = pos+pos1;
  
  fill(255);

  ellipse(pos, height/2, 20, 20);
  if(pos > width+20)
  {
    pos = -20;
  }
  

  
  fill(0, 10);
  rect(0,0,width,height);
  

}


