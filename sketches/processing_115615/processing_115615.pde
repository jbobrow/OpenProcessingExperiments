
int x;
int y;

void setup()
{
  size(400,400);
  background(255);
  noStroke();
  smooth();
  
  
}

void draw()
{
  //fill(255,170,171);
  //ellipse(x+50, y+45, 75, 75);
  
  //NAS
  //fill(244,144,148);
  //ellipse(x+50,y+60,30,20);

  //ULLS
  //fill(255);
  //ellipse(x+35,y+35,20,20);
  //ellipse(x+65,y+35,20,20);
  
  //fill(0);
  //negre ulls
  //ellipse(x+35,y+35,5,5);
  //ellipse(x+65,y+35,5,5);
  //negre nas
  //ellipse(x+45,y+60,5,5);
  //ellipse(x+55,y+60,5,5);
  
  x=0;
  y=0;
  
  for (x=0; x<width;x+=80)
  {
    for(y=0;y<height;y+=80)
    {
      
  fill(255,170,171);
  ellipse(x+50, y+45, 75, 75);
  
  //NAS
  fill(244,144,148);
  ellipse(x+50,y+60,30,20);

  //ULLS
  fill(255);
  ellipse(x+35,y+35,20,20);
  ellipse(x+65,y+35,20,20);
  
  fill(0);
  //negre ulls
  ellipse(x+35,y+35,5,5);
  ellipse(x+65,y+35,5,5);
  //negre nas
  ellipse(x+45,y+60,5,5);
  ellipse(x+55,y+60,5,5);
  
  }
  
  }

}
