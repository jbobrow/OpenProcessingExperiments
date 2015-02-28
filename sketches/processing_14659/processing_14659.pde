
size(200,200);
strokeWeight(2);

background(255);


int x, y;
boolean mode = true;

for(y=10;y<=190;y+=20)
{
  for(x=10;x<=190;x+=20)
  {
    if(mode)
    {
      fill(0);
    }
    else
    {
      fill(255);
    }
    
    ellipse(x,y,10,10);    
    mode = !mode;
  }
  mode = !mode;
}
